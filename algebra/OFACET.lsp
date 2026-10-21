
(SDEFUN |OFACET;orientedFacet;IL%;1|
        ((|mul1| (|Integer|)) (|fac1| (|List| (|NonNegativeInteger|))) (% (%)))
        (SPROG
         ((|fac2| (|List| (|NonNegativeInteger|))) (|y| NIL) (#1=#:G37 NIL)
          (|x| NIL) (#2=#:G36 NIL) (|diff| (|NonNegativeInteger|))
          (|mul2| (|Integer|)))
         (SEQ (LETT |mul2| |mul1|)
              (LETT |fac2| (SPADCALL |fac1| (QREFELT % 8))) (LETT |diff| 0)
              (SEQ (LETT |y| NIL) (LETT #1# |fac2|) (LETT |x| NIL)
                   (LETT #2# |fac1|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#)) NIL) (ATOM #1#)
                         (PROGN (LETT |y| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |x| |y| (QREFELT % 11))
                       (LETT |diff| (+ |diff| 1))))))
                   (LETT #2# (PROG1 (CDR #2#) (LETT #1# (CDR #1#)))) (GO G190)
                   G191 (EXIT NIL))
              (COND
               ((EQL |diff| 1) (|error| "can not construct orientedFacet")))
              (COND
               ((EVENP |diff|) (COND ((> |diff| 1) (LETT |mul2| (- |mul2|))))))
              (EXIT (CONS |mul2| |fac2|))))) 

(SDEFUN |OFACET;orientedFacetUnsigned;L%;2|
        ((|fac1| (|List| (|Integer|))) (% (%)))
        (SPROG
         ((#1=#:G43 NIL) (|x| NIL) (#2=#:G44 NIL) (#3=#:G39 NIL)
          (|lst| (|List| (|NonNegativeInteger|))))
         (SEQ
          (LETT |lst|
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |x| NIL) (LETT #2# |fac1|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS
                               (PROG1 (LETT #3# (ABS |x|))
                                 (|check_subtype2| (>= #3# 0)
                                                   '(|NonNegativeInteger|)
                                                   '(|Integer|) #3#))
                               #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#)))))
          (LETT |lst| (SPADCALL |lst| (QREFELT % 14)))
          (EXIT (CONS 1 (SPADCALL |lst| (QREFELT % 8))))))) 

(SDEFUN |OFACET;orientedFacetSigned;L%;3|
        ((|fac1| (|List| (|Integer|))) (% (%)))
        (SPROG
         ((#1=#:G53 NIL) (|x| NIL) (#2=#:G54 NIL) (#3=#:G46 NIL)
          (|lst| (|List| (|NonNegativeInteger|))) (|sig| (|Integer|)))
         (SEQ
          (LETT |lst|
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |x| NIL) (LETT #2# |fac1|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS
                               (PROG1 (LETT #3# (ABS |x|))
                                 (|check_subtype2| (>= #3# 0)
                                                   '(|NonNegativeInteger|)
                                                   '(|Integer|) #3#))
                               #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#)))))
          (LETT |lst| (SPADCALL |lst| (QREFELT % 14))) (LETT |sig| 1)
          (COND
           ((< (LENGTH |fac1|) 1)
            (|error| "attempt to construct empty facet")))
          (COND ((< (|SPADfirst| |fac1|) 0) (LETT |sig| -1)))
          (EXIT (CONS |sig| (SPADCALL |lst| (QREFELT % 8))))))) 

(SDEFUN |OFACET;orientedFacet;I2%;4|
        ((|mul| (|Integer|)) (|fac1| (|OrientedFacet|)) (% (%)))
        (CONS |mul| (SPADCALL |fac1| (QREFELT % 19)))) 

(SDEFUN |OFACET;orientedFacetIfCan;LU;5|
        ((|boundary| (|List| %)) (% (|Union| % "failed")))
        (SPROG
         ((|b| (|List| %)) (|subFacet| NIL) (#1=#:G78 NIL)
          (|indexLst| (|List| (|List| (|NonNegativeInteger|)))) (|i| NIL)
          (#2=#:G79 NIL) (|indexes| (|List| (|NonNegativeInteger|)))
          (|res| (%)) (|expected| (|List| %)) (#3=#:G80 NIL) (|e| NIL)
          (#4=#:G81 NIL) (|mm| (|Integer|)) (#5=#:G77 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |indexLst| NIL)
                (COND
                 ((< (SPADCALL |boundary| (QREFELT % 22)) 1)
                  (PROGN (LETT #5# (CONS 1 "failed")) (GO #6=#:G76))))
                (LETT |b| (SPADCALL |boundary| (QREFELT % 23)))
                (SEQ (LETT |subFacet| NIL) (LETT #1# |b|) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |subFacet| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |indexLst|
                             (SPADCALL |indexLst|
                                       (SPADCALL |subFacet| (QREFELT % 24))
                                       (QREFELT % 26)))))
                     (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                (LETT |indexes| NIL)
                (SEQ (LETT |i| NIL) (LETT #2# |indexLst|) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |indexes|
                             (SPADCALL |indexes| |i| (QREFELT % 27)))))
                     (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                (LETT |indexes| (SPADCALL |indexes| (QREFELT % 14)))
                (LETT |indexes| (SPADCALL |indexes| (QREFELT % 8)))
                (LETT |res| (SPADCALL 1 |indexes| (QREFELT % 13)))
                (LETT |expected| (SPADCALL |res| (QREFELT % 29)))
                (LETT |mm|
                      (SPADCALL (SPADCALL |boundary| (QREFELT % 30)) |expected|
                                (QREFELT % 31)))
                (COND
                 ((< |mm| 0)
                  (SEQ (LETT |res| (SPADCALL -1 |indexes| (QREFELT % 13)))
                       (EXIT
                        (LETT |expected| (SPADCALL |res| (QREFELT % 29)))))))
                (SEQ (LETT |e| NIL) (LETT #3# |expected|) G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |e| (CAR #3#)) NIL))
                       (GO G191)))
                     (SEQ (LETT |mm| (SPADCALL |e| |boundary| (QREFELT % 31)))
                          (EXIT
                           (COND
                            ((<= |mm| 0)
                             (PROGN (LETT #5# (CONS 1 "failed")) (GO #6#))))))
                     (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                (SEQ (LETT |e| NIL) (LETT #4# |boundary|) G190
                     (COND
                      ((OR (ATOM #4#) (PROGN (LETT |e| (CAR #4#)) NIL))
                       (GO G191)))
                     (SEQ (LETT |mm| (SPADCALL |e| |expected| (QREFELT % 31)))
                          (EXIT
                           (COND
                            ((<= |mm| 0)
                             (PROGN (LETT #5# (CONS 1 "failed")) (GO #6#))))))
                     (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 |res|))))
          #6# (EXIT #5#)))) 

(SDEFUN |OFACET;order;%Nni;6| ((|f| (%)) (% (|NonNegativeInteger|)))
        (SPROG ((|facet| (|List| (|NonNegativeInteger|))))
               (SEQ (LETT |facet| (SPADCALL |f| (QREFELT % 24)))
                    (EXIT (SPADCALL |facet| (QREFELT % 34)))))) 

(MAKEPROP '|OFACET;getIndexes;%L;7| '|SPADreplace| 'QCDR) 

(SDEFUN |OFACET;getIndexes;%L;7|
        ((|orf| (%)) (% (|List| (|NonNegativeInteger|)))) (QCDR |orf|)) 

(SDEFUN |OFACET;minIndex;%Nni;8| ((|orf| (%)) (% (|NonNegativeInteger|)))
        (SPROG
         ((|inds| (|List| (|NonNegativeInteger|))) (|i| NIL) (#1=#:G89 NIL)
          (|m| (|NonNegativeInteger|)))
         (SEQ (LETT |m| 0) (LETT |inds| (SPADCALL |orf| (QREFELT % 24)))
              (SEQ (LETT |i| NIL) (LETT #1# |inds|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND ((OR (EQL |m| 0) (< |i| |m|)) (LETT |m| |i|)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |m|)))) 

(SDEFUN |OFACET;maxIndex;%Nni;9| ((|orf| (%)) (% (|NonNegativeInteger|)))
        (SPROG
         ((|inds| (|List| (|NonNegativeInteger|))) (|i| NIL) (#1=#:G94 NIL)
          (|m| (|NonNegativeInteger|)))
         (SEQ (LETT |m| 0) (LETT |inds| (SPADCALL |orf| (QREFELT % 24)))
              (SEQ (LETT |i| NIL) (LETT #1# |inds|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (COND ((> |i| |m|) (LETT |m| |i|)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |m|)))) 

(SDEFUN |OFACET;getIndexesSigned;%L;10| ((|orf| (%)) (% (|List| (|Integer|))))
        (SPROG
         ((|i| NIL) (#1=#:G101 NIL) (|i2| (|Integer|))
          (|res| (|List| (|Integer|))) (|neg| (|Boolean|)))
         (SEQ (LETT |res| NIL)
              (LETT |neg| (EQL (SPADCALL (QCAR |orf|) (QREFELT % 38)) -1))
              (SEQ (LETT |i| NIL) (LETT #1# (QCDR |orf|)) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |i2| (COND (|neg| (- |i|)) ('T |i|)))
                        (LETT |res| (SPADCALL |res| |i2| (QREFELT % 39)))
                        (EXIT (LETT |neg| (NULL |neg|))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(MAKEPROP '|OFACET;getMult;%I;11| '|SPADreplace| 'QCAR) 

(SDEFUN |OFACET;getMult;%I;11| ((|orf| (%)) (% (|Integer|))) (QCAR |orf|)) 

(SDEFUN |OFACET;setMult!;%I%;12| ((|orf| (%)) (|m| (|Integer|)) (% (%)))
        (SEQ (PROGN (RPLACA |orf| |m|) (QCAR |orf|)) (EXIT |orf|))) 

(SDEFUN |OFACET;boundary;%L;13| ((|orf| (%)) (% (|List| %)))
        (SPROG
         ((|facet| (|List| (|NonNegativeInteger|)))
          (|revFacet| (|List| (|NonNegativeInteger|))) (|mult| #1=(|Integer|))
          (|x| NIL) (#2=#:G110 NIL) (|r| (|List| (|NonNegativeInteger|)))
          (|m| #1#) (|even| (|Boolean|)) (|r1| (%)) (|res| (|List| %)))
         (SEQ (LETT |facet| (QCDR |orf|)) (LETT |revFacet| (REVERSE |facet|))
              (LETT |mult| (QCAR |orf|)) (LETT |res| NIL) (LETT |even| NIL)
              (SEQ (LETT |x| NIL) (LETT #2# |revFacet|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |r| (SPADCALL |x| |facet| (QREFELT % 43)))
                        (LETT |m| (COND (|even| (- |mult|)) ('T |mult|)))
                        (LETT |even| (NULL |even|))
                        (LETT |r1| (SPADCALL |m| |r| (QREFELT % 13)))
                        (EXIT
                         (LETT |res| (SPADCALL |res| |r1| (QREFELT % 44)))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |OFACET;addIfNew| ((|lst| (|List| %)) (|orf| (%)) (% (|List| %)))
        (SPROG ((#1=#:G115 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((NULL (SPADCALL |orf| (QREFELT % 45)))
                    (COND
                     ((SPADCALL |orf| |lst| (QREFELT % 46))
                      (PROGN (LETT #1# |lst|) (GO #2=#:G114))))))
                  (EXIT (SPADCALL |lst| |orf| (QREFELT % 44)))))
                #2# (EXIT #1#)))) 

(SDEFUN |OFACET;addIfNew2|
        ((|lst| (|List| %)) (|orfs| (|List| %)) (% (|List| %)))
        (SPROG ((#1=#:G123 NIL) (|orf| NIL) (#2=#:G124 NIL) (|res| (|List| %)))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL |orfs| (QREFELT % 47))
                    (PROGN (LETT #1# |lst|) (GO #3=#:G122))))
                  (LETT |res| (SPADCALL |lst| (QREFELT % 48)))
                  (SEQ (LETT |orf| NIL) (LETT #2# |orfs|) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |orf| (CAR #2#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((NULL (SPADCALL |orf| (QREFELT % 45)))
                           (COND
                            ((NULL (SPADCALL |orf| |res| (QREFELT % 46)))
                             (LETT |res|
                                   (SPADCALL |res| |orf| (QREFELT % 44)))))))))
                       (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                  (EXIT |res|)))
                #3# (EXIT #1#)))) 

(SDEFUN |OFACET;allSubsets;%NniL;16|
        ((|orf| (%)) (|minDim| (|NonNegativeInteger|)) (% (|List| %)))
        (SPROG
         ((|facet| (|List| (|NonNegativeInteger|))) (#1=#:G133 NIL) (|x| NIL)
          (#2=#:G134 NIL) (|r| (|List| (|NonNegativeInteger|))) (|r1| (%))
          (|sub| (|List| %)) (|res| (|List| %)))
         (SEQ
          (EXIT
           (SEQ (LETT |facet| (QCDR |orf|)) (LETT |res| NIL)
                (COND
                 ((<= (SPADCALL |orf| (QREFELT % 35)) |minDim|)
                  (PROGN (LETT #1# |res|) (GO #3=#:G132))))
                (SEQ (LETT |x| NIL) (LETT #2# |facet|) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ (LETT |r| (SPADCALL |x| |facet| (QREFELT % 43)))
                          (LETT |r1| (SPADCALL 1 |r| (QREFELT % 13)))
                          (LETT |res| (|OFACET;addIfNew| |res| |r1| %))
                          (EXIT
                           (COND
                            ((> (SPADCALL |r1| (QREFELT % 35)) |minDim|)
                             (SEQ
                              (LETT |sub|
                                    (SPADCALL |r1| |minDim| (QREFELT % 49)))
                              (EXIT
                               (COND
                                ((NULL (SPADCALL |sub| (QREFELT % 47)))
                                 (LETT |res|
                                       (|OFACET;addIfNew2| |res| |sub|
                                        %))))))))))
                     (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                (EXIT |res|)))
          #3# (EXIT #1#)))) 

(SDEFUN |OFACET;allSubsets;%2NniL;17|
        ((|orf| (%)) (|minDim| (|NonNegativeInteger|))
         (|maxDim| (|NonNegativeInteger|)) (% (|List| %)))
        (SPROG
         ((|res| (|List| %)) (|y| NIL) (#1=#:G141 NIL) (|res2| (|List| %)))
         (SEQ (LETT |res| (SPADCALL |orf| |minDim| (QREFELT % 49)))
              (LETT |res2| NIL)
              (SEQ (LETT |y| NIL) (LETT #1# |res|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |y| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((<= (SPADCALL |y| (QREFELT % 35)) |maxDim|)
                       (LETT |res2| (SPADCALL |res2| |y| (QREFELT % 44)))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res2|)))) 

(SDEFUN |OFACET;isSubsetOf?;2%B;18| ((|sa| (%)) (|sb| (%)) (% (|Boolean|)))
        (SPROG
         ((|all| (|List| %)) (|vertex| NIL) (#1=#:G147 NIL) (#2=#:G146 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |all| (SPADCALL |sb| 1 (QREFELT % 49)))
                (SEQ (LETT |vertex| NIL) (LETT #1# |all|) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |vertex| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL |vertex| |sa| (QREFELT % 51))
                         (PROGN (LETT #2# 'T) (GO #3=#:G145))))))
                     (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                (EXIT NIL)))
          #3# (EXIT #2#)))) 

(SDEFUN |OFACET;join;3%;19| ((|sa| (%)) (|sb| (%)) (% (%)))
        (SPROG
         ((|lst| (|List| (|NonNegativeInteger|)))
          (|lst2| (|List| (|NonNegativeInteger|))) (|mult| (|Integer|)))
         (SEQ (LETT |lst| (SPADCALL (QCDR |sa|) (QCDR |sb|) (QREFELT % 27)))
              (LETT |lst2|
                    (SPADCALL (SPADCALL |lst| (QREFELT % 14)) (QREFELT % 8)))
              (LETT |mult| (* (QCAR |sa|) (QCAR |sb|)))
              (EXIT (CONS |mult| |lst2|))))) 

(SDEFUN |OFACET;subtract;3%;20| ((|sa| (%)) (|sb| (%)) (% (%)))
        (SPROG ((|lst| (|List| (|NonNegativeInteger|))))
               (SEQ
                (LETT |lst| (SPADCALL (QCDR |sb|) (QCDR |sa|) (QREFELT % 54)))
                (EXIT (CONS 1 |lst|))))) 

(SDEFUN |OFACET;reindex;2%;21| ((|sa| (%)) (% (%)))
        (SPROG
         ((|facet| (|List| (|NonNegativeInteger|))) (#1=#:G160 NIL)
          (|oldval| (|List| (|NonNegativeInteger|)))
          (|newval| (|List| (|NonNegativeInteger|)))
          (|i| (|NonNegativeInteger|)) (|v| NIL) (#2=#:G161 NIL)
          (|ptr| (|Integer|)) (|res| (|List| (|NonNegativeInteger|))))
         (SEQ (LETT |facet| (QCDR |sa|)) (LETT |oldval| NIL)
              (LETT |newval| NIL) (LETT |i| 1)
              (SEQ (LETT |v| NIL) (LETT #1# |facet|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |oldval| (SPADCALL |oldval| |v| (QREFELT % 56)))
                        (LETT |newval| (SPADCALL |newval| |i| (QREFELT % 56)))
                        (EXIT (LETT |i| (+ |i| 1))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (LETT |res| NIL)
              (SEQ (LETT |v| NIL) (LETT #2# |facet|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |v| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |ptr| (SPADCALL |v| |oldval| (QREFELT % 57)))
                        (COND ((< |ptr| 1) (|error| "error in reindex")))
                        (EXIT
                         (LETT |res|
                               (SPADCALL |res|
                                         (SPADCALL |newval| |ptr|
                                                   (QREFELT % 58))
                                         (QREFELT % 56)))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS 1 |res|))))) 

(SDEFUN |OFACET;boolWordPermute;2NniL;22|
        ((|numZeros| (|NonNegativeInteger|)) (|numOnes| (|NonNegativeInteger|))
         (% (|List| (|List| (|Boolean|)))))
        (SPADCALL NIL |numZeros| |numOnes| (QREFELT % 61))) 

(SDEFUN |OFACET;boolWordPermute;L2NniL;23|
        ((|wordIn| (|List| (|List| (|Boolean|))))
         (|numZeros| (|NonNegativeInteger|)) (|numOnes| (|NonNegativeInteger|))
         (% (|List| (|List| (|Boolean|)))))
        (SPROG
         ((#1=#:G178 NIL) (#2=#:G179 NIL)
          (|word0| (|List| (|List| (|Boolean|)))) (#3=#:G164 NIL)
          (|z| (|NonNegativeInteger|)) (|x| NIL) (#4=#:G180 NIL)
          (|subWord| (|List| (|Boolean|)))
          (|word1| (|List| (|List| (|Boolean|))))
          (|res| (|List| (|List| (|Boolean|)))))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((< |numZeros| 1)
              (COND
               ((< |numOnes| 1) (PROGN (LETT #1# |wordIn|) (GO #5=#:G177))))))
            (LETT |res| NIL)
            (COND
             ((> |numZeros| 0)
              (SEQ
               (LETT |z|
                     (PROG2 (LETT #3# (SPADCALL |numZeros| 1 (QREFELT % 63)))
                         (QCDR #3#)
                       (|check_union2| (QEQCAR #3# 0) (|NonNegativeInteger|)
                                       (|Union| (|NonNegativeInteger|)
                                                #6="failed")
                                       #3#)))
               (LETT |word0| NIL)
               (COND ((NULL |wordIn|) (LETT |word0| (LIST (LIST NIL)))))
               (SEQ (LETT |x| NIL) (LETT #2# |wordIn|) G190
                    (COND
                     ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#)) NIL))
                      (GO G191)))
                    (SEQ (LETT |subWord| (SPADCALL |x| NIL (QREFELT % 65)))
                         (EXIT
                          (LETT |word0|
                                (SPADCALL |word0| |subWord| (QREFELT % 66)))))
                    (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
               (EXIT
                (LETT |res|
                      (SPADCALL |res|
                                (SPADCALL |word0| |z| |numOnes| (QREFELT % 61))
                                (QREFELT % 67)))))))
            (COND
             ((> |numOnes| 0)
              (SEQ
               (LETT |z|
                     (PROG2 (LETT #3# (SPADCALL |numOnes| 1 (QREFELT % 63)))
                         (QCDR #3#)
                       (|check_union2| (QEQCAR #3# 0) (|NonNegativeInteger|)
                                       (|Union| (|NonNegativeInteger|) #6#)
                                       #3#)))
               (LETT |word1| NIL)
               (COND ((NULL |wordIn|) (LETT |word1| (LIST (LIST 'T)))))
               (SEQ (LETT |x| NIL) (LETT #4# |wordIn|) G190
                    (COND
                     ((OR (ATOM #4#) (PROGN (LETT |x| (CAR #4#)) NIL))
                      (GO G191)))
                    (SEQ (LETT |subWord| (SPADCALL |x| 'T (QREFELT % 65)))
                         (EXIT
                          (LETT |word1|
                                (SPADCALL |word1| |subWord| (QREFELT % 66)))))
                    (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
               (EXIT
                (LETT |res|
                      (SPADCALL |res|
                                (SPADCALL |word1| |numZeros| |z|
                                          (QREFELT % 61))
                                (QREFELT % 67)))))))
            (EXIT |res|)))
          #5# (EXIT #1#)))) 

(SDEFUN |OFACET;product;2%L;24|
        ((|a| (%)) (|b| (%)) (% (|List| (|ProductFacet|))))
        (SPROG
         ((|indA| #1=(|List| (|NonNegativeInteger|))) (|indB| #1#)
          (|lenA| (|NonNegativeInteger|)) (#2=#:G182 NIL)
          (|lenB| (|NonNegativeInteger|))
          (|perms| (|List| (|List| (|Boolean|)))) (|perm| NIL) (#3=#:G197 NIL)
          (#4=#:G198 NIL) (|rightIndex| #5=(|NonNegativeInteger|))
          (|leftIndex| #5#)
          (|i|
           #6=(|Record| (|:| |left| (|NonNegativeInteger|))
                        (|:| |right| (|NonNegativeInteger|))))
          (|i2| (|List| #6#)) (|pf| (|ProductFacet|))
          (|res| (|List| (|ProductFacet|))))
         (SEQ (LETT |res| NIL) (LETT |indA| (SPADCALL |a| (QREFELT % 24)))
              (LETT |indB| (SPADCALL |b| (QREFELT % 24)))
              (LETT |lenA|
                    (PROG2
                        (LETT #2#
                              (SPADCALL (SPADCALL |indA| (QREFELT % 34)) 1
                                        (QREFELT % 63)))
                        (QCDR #2#)
                      (|check_union2| (QEQCAR #2# 0) (|NonNegativeInteger|)
                                      (|Union| (|NonNegativeInteger|)
                                               #7="failed")
                                      #2#)))
              (LETT |lenB|
                    (PROG2
                        (LETT #2#
                              (SPADCALL (SPADCALL |indB| (QREFELT % 34)) 1
                                        (QREFELT % 63)))
                        (QCDR #2#)
                      (|check_union2| (QEQCAR #2# 0) (|NonNegativeInteger|)
                                      (|Union| (|NonNegativeInteger|) #7#)
                                      #2#)))
              (LETT |perms| (REVERSE (SPADCALL |lenA| |lenB| (QREFELT % 62))))
              (SEQ (LETT |perm| NIL) (LETT #3# |perms|) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |perm| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |leftIndex| 1) (LETT |rightIndex| 1)
                        (LETT |i|
                              (CONS
                               (SPADCALL |indA| |leftIndex| (QREFELT % 68))
                               (SPADCALL |indB| |rightIndex| (QREFELT % 68))))
                        (LETT |i2| (LIST |i|))
                        (SEQ (LETT #4# |perm|) G190
                             (COND
                              ((OR (ATOM #4#) (PROGN (LETT |b| (CAR #4#)) NIL))
                               (GO G191)))
                             (SEQ
                              (COND
                               (|b| (LETT |rightIndex| (+ |rightIndex| 1)))
                               ('T (LETT |leftIndex| (+ |leftIndex| 1))))
                              (COND
                               ((> |leftIndex|
                                   (SPADCALL |indA| (QREFELT % 34)))
                                (|error| "leftIndex too high in product")))
                              (COND
                               ((> |rightIndex|
                                   (SPADCALL |indB| (QREFELT % 34)))
                                (|error| "rightIndex too high in product")))
                              (LETT |i|
                                    (CONS
                                     (SPADCALL |indA| |leftIndex|
                                               (QREFELT % 68))
                                     (SPADCALL |indB| |rightIndex|
                                               (QREFELT % 68))))
                              (EXIT
                               (LETT |i2| (SPADCALL |i2| |i| (QREFELT % 71)))))
                             (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                        (LETT |pf| (SPADCALL 1 |i2| (QREFELT % 73)))
                        (EXIT
                         (LETT |res| (SPADCALL |res| |pf| (QREFELT % 75)))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |OFACET;position;%LI;25| ((|e| (%)) (|lst| (|List| %)) (% (|Integer|)))
        (SPROG ((|x| NIL) (#1=#:G209 NIL) (|res| (|Integer|)) (#2=#:G208 NIL))
               (SEQ
                (EXIT
                 (SEQ (LETT |res| 1)
                      (SEQ (LETT |x| NIL) (LETT #1# |lst|) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (COND
                             ((SPADCALL (QCDR |e|) (QCDR |x|) (QREFELT % 77))
                              (SEQ
                               (COND
                                ((EQL (QCAR |e|) (QCAR |x|))
                                 (PROGN (LETT #2# |res|) (GO #3=#:G207))))
                               (EXIT (PROGN (LETT #2# (- |res|)) (GO #3#))))))
                            (EXIT (LETT |res| (+ |res| 1))))
                           (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                      (EXIT (PROGN (LETT #2# 0) (GO #3#)))))
                #3# (EXIT #2#)))) 

(SDEFUN |OFACET;addVertex;%Nni%;26|
        ((|sa| (%)) (|v| (|NonNegativeInteger|)) (% (%)))
        (SPROG ((|f| (|List| (|NonNegativeInteger|))))
               (SEQ (LETT |f| (QCDR |sa|))
                    (LETT |f| (SPADCALL |f| |v| (QREFELT % 56)))
                    (EXIT (SPADCALL 1 |f| (QREFELT % 13)))))) 

(SDEFUN |OFACET;refactorIndexes;%Nni%;27|
        ((|a| (%)) (|n| (|NonNegativeInteger|)) (% (%)))
        (SPROG
         ((|facet| (|List| (|NonNegativeInteger|))) (|v| NIL) (#1=#:G216 NIL)
          (|newval| (|List| (|NonNegativeInteger|))))
         (SEQ (LETT |facet| (QCDR |a|)) (LETT |newval| NIL)
              (SEQ (LETT |v| NIL) (LETT #1# |facet|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |newval|
                           (SPADCALL |newval| (+ |v| |n|) (QREFELT % 56)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS (QCAR |a|) |newval|))))) 

(SDEFUN |OFACET;sameFace?;2%B;28| ((|a| (%)) (|b| (%)) (% (|Boolean|)))
        (SPROG ((|vertsa| #1=(|List| (|NonNegativeInteger|))) (|vertsb| #1#))
               (SEQ (LETT |vertsa| (QCDR |a|)) (LETT |vertsb| (QCDR |b|))
                    (EXIT (NULL (SPADCALL |vertsa| |vertsb| (QREFELT % 80))))))) 

(SDEFUN |OFACET;ltLocal|
        ((|a| (|List| (|NonNegativeInteger|)))
         (|b| (|List| (|NonNegativeInteger|))) (% (|Boolean|)))
        (SPROG ((|a1| #1=(|NonNegativeInteger|)) (|b1| #1#) (#2=#:G226 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL |a| |b| (QREFELT % 77))
                    (PROGN (LETT #2# NIL) (GO #3=#:G225))))
                  (COND
                   ((< (SPADCALL |a| (QREFELT % 34)) 1)
                    (PROGN (LETT #2# 'T) (GO #3#))))
                  (COND
                   ((< (SPADCALL |b| (QREFELT % 34)) 1)
                    (PROGN (LETT #2# NIL) (GO #3#))))
                  (LETT |a1| (|SPADfirst| |a|)) (LETT |b1| (|SPADfirst| |b|))
                  (COND ((< |a1| |b1|) (PROGN (LETT #2# 'T) (GO #3#))))
                  (COND ((> |a1| |b1|) (PROGN (LETT #2# NIL) (GO #3#))))
                  (COND
                   ((< (SPADCALL |a| (QREFELT % 34)) 2)
                    (PROGN (LETT #2# 'T) (GO #3#))))
                  (COND
                   ((< (SPADCALL |b| (QREFELT % 34)) 2)
                    (PROGN (LETT #2# NIL) (GO #3#))))
                  (EXIT (|OFACET;ltLocal| (CDR |a|) (CDR |b|) %))))
                #3# (EXIT #2#)))) 

(SDEFUN |OFACET;<;2%B;30| ((|ain| (%)) (|bin| (%)) (% (|Boolean|)))
        (SPROG ((|a| #1=(|List| (|NonNegativeInteger|))) (|b| #1#))
               (SEQ (LETT |a| (QCDR |ain|)) (LETT |b| (QCDR |bin|))
                    (EXIT (|OFACET;ltLocal| |a| |b| %))))) 

(SDEFUN |OFACET;<=;2%B;31| ((|ain| (%)) (|bin| (%)) (% (|Boolean|)))
        (SPROG
         ((|a| #1=(|List| (|NonNegativeInteger|))) (|b| #1#) (#2=#:G231 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |a| (QCDR |ain|)) (LETT |b| (QCDR |bin|))
                (COND
                 ((SPADCALL |a| |b| (QREFELT % 77))
                  (PROGN (LETT #2# 'T) (GO #3=#:G230))))
                (EXIT (|OFACET;ltLocal| |a| |b| %))))
          #3# (EXIT #2#)))) 

(SDEFUN |OFACET;=;2%B;32| ((|a| (%)) (|b| (%)) (% (|Boolean|)))
        (SPROG ((#1=#:G236 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL (QCAR |a|) (QCAR |b|) (QREFELT % 84))
                    (PROGN (LETT #1# NIL) (GO #2=#:G235))))
                  (EXIT (SPADCALL (QCDR |a|) (QCDR |b|) (QREFELT % 77)))))
                #2# (EXIT #1#)))) 

(SDEFUN |OFACET;coerce;%Of;33| ((|s| (%)) (% (|OutputForm|)))
        (SPROG
         ((|m| (|Integer|)) (|prefix| (|OutputForm|)) (#1=#:G244 NIL) (|x| NIL)
          (#2=#:G245 NIL) (|elements| (|List| (|OutputForm|)))
          (|body| (|OutputForm|)))
         (SEQ (LETT |prefix| (SPADCALL "" (QREFELT % 87)))
              (LETT |m| (QCAR |s|))
              (COND
               ((SPADCALL (ABS |m|) 1 (QREFELT % 84))
                (LETT |prefix|
                      (SPADCALL (SPADCALL |m| (QREFELT % 88))
                                (SPADCALL "*" (QREFELT % 87))
                                (QREFELT % 89)))))
              (COND
               ((EQL |m| -1) (LETT |prefix| (SPADCALL "-" (QREFELT % 87)))))
              (LETT |elements|
                    (PROGN
                     (LETT #1# NIL)
                     (SEQ (LETT |x| NIL) (LETT #2# (QCDR |s|)) G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #1#
                                  (CONS (SPADCALL |x| (QREFELT % 90)) #1#))))
                          (LETT #2# (CDR #2#)) (GO G190) G191
                          (EXIT (NREVERSE #1#)))))
              (LETT |body| (SPADCALL |elements| (QREFELT % 91)))
              (EXIT (SPADCALL |prefix| |body| (QREFELT % 89)))))) 

(DECLAIM (NOTINLINE |OrientedFacet;|)) 

(DEFUN |OrientedFacet;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|OrientedFacet|))
          (LETT % (GETREFV 93))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|OrientedFacet| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (AND (|HasCategory| % '(|SetWithZero|)) (|augmentPredVector| % 1))
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 6
                    (|Record| (|:| |mul| (|Integer|))
                              (|:| |fac| (|List| (|NonNegativeInteger|)))))
          %))) 

(DEFUN |OrientedFacet| ()
  (SPROG NIL
         (PROG (#1=#:G247)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|OrientedFacet|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|OrientedFacet|
                             (LIST (CONS NIL (CONS 1 (|OrientedFacet;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|OrientedFacet|)))))))))) 

(MAKEPROP '|OrientedFacet| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|List| 10) (0 . |sort|)
              (|Boolean|) (|NonNegativeInteger|) (5 . ~=) (|Integer|)
              |OFACET;orientedFacet;IL%;1| (11 . |removeDuplicates|)
              (|List| 12) |OFACET;orientedFacetUnsigned;L%;2|
              |OFACET;orientedFacetSigned;L%;3| (|OrientedFacet|)
              (16 . |getIndexes|) |OFACET;orientedFacet;I2%;4| (|List| $$)
              (21 . |#|) (26 . |sort|) |OFACET;getIndexes;%L;7| (|List| 7)
              (31 . |concat|) (37 . |concat|) (|List| %)
              |OFACET;boundary;%L;13| (43 . |first|) |OFACET;position;%LI;25|
              (|Union| % '"failed") |OFACET;orientedFacetIfCan;LU;5| (48 . |#|)
              |OFACET;order;%Nni;6| |OFACET;minIndex;%Nni;8|
              |OFACET;maxIndex;%Nni;9| (53 . |sign|) (58 . |concat|)
              |OFACET;getIndexesSigned;%L;10| |OFACET;getMult;%I;11|
              |OFACET;setMult!;%I%;12| (64 . |remove|) (70 . |concat|)
              (76 . |empty?|) (81 . |member?|) (87 . |empty?|) (92 . |copy|)
              |OFACET;allSubsets;%NniL;16| |OFACET;allSubsets;%2NniL;17|
              |OFACET;=;2%B;32| |OFACET;isSubsetOf?;2%B;18| |OFACET;join;3%;19|
              (97 . |setDifference|) |OFACET;subtract;3%;20| (103 . |concat|)
              (109 . |position|) (115 . |qelt|) |OFACET;reindex;2%;21|
              (|List| 64) |OFACET;boolWordPermute;L2NniL;23|
              |OFACET;boolWordPermute;2NniL;22| (121 . |subtractIfCan|)
              (|List| 9) (127 . |concat|) (133 . |concat|) (139 . |concat|)
              (145 . |elt|) (|Record| (|:| |left| 10) (|:| |right| 10))
              (|List| 69) (151 . |concat|) (|ProductFacet|)
              (157 . |productFacet|) (|List| 72) (163 . |concat|)
              |OFACET;product;2%L;24| (169 . =) |OFACET;addVertex;%Nni%;26|
              |OFACET;refactorIndexes;%Nni%;27| (175 . ~=)
              |OFACET;sameFace?;2%B;28| |OFACET;<;2%B;30| |OFACET;<=;2%B;31|
              (181 . ~=) (|String|) (|OutputForm|) (187 . |message|)
              (192 . |coerce|) (197 . |hconcat|) (203 . |coerce|)
              (208 . |paren|) |OFACET;coerce;%Of;33|)
           '#(~= 213 |subtract| 219 |smaller?| 225 |sign| 231 |setMult!| 236
              |sameFace?| 242 |reindex| 248 |refactorIndexes| 253 |product| 259
              |positive?| 265 |position| 270 |orientedFacetUnsigned| 276
              |orientedFacetSigned| 281 |orientedFacetIfCan| 286
              |orientedFacet| 291 |order| 303 |negative?| 308 |minIndex| 313
              |min| 318 |maxIndex| 324 |max| 329 |latex| 335 |join| 340
              |isSubsetOf?| 346 |getMult| 352 |getIndexesSigned| 357
              |getIndexes| 362 |empty?| 367 |coerce| 372 |boundary| 377
              |boolWordPermute| 382 |allSubsets| 395 |addVertex| 408 >= 414 >
              420 = 426 <= 432 < 438)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0))
                 (CONS
                  '#(|FacetCategory&| |OrderedSet&| NIL NIL |SetCategory&| NIL
                     |BasicType&| |PartialOrder&|)
                  (CONS
                   '#((|FacetCategory|) (|OrderedSet|) (|Comparable|)
                      (|ComparableRepresentation|) (|SetCategory|)
                      (|CoercibleTo| 86) (|BasicType|) (|PartialOrder|))
                   (|makeByteWordVec2| 92
                                       '(1 7 0 0 8 2 10 9 0 0 11 1 7 0 0 14 1
                                         18 7 0 19 1 21 10 0 22 1 21 0 0 23 2
                                         25 0 0 7 26 2 7 0 0 0 27 1 21 2 0 30 1
                                         7 10 0 34 1 12 12 0 38 2 15 0 0 12 39
                                         2 7 0 10 0 43 2 21 0 0 2 44 1 0 9 0 45
                                         2 21 9 2 0 46 1 21 9 0 47 1 21 0 0 48
                                         2 7 0 0 0 54 2 7 0 0 10 56 2 7 12 10 0
                                         57 2 7 10 0 12 58 2 10 32 0 0 63 2 64
                                         0 0 9 65 2 60 0 0 64 66 2 60 0 0 0 67
                                         2 7 10 0 12 68 2 70 0 0 69 71 2 72 0
                                         12 70 73 2 74 0 0 72 75 2 7 9 0 0 77 2
                                         7 9 0 0 80 2 12 9 0 0 84 1 86 0 85 87
                                         1 12 86 0 88 2 86 0 0 0 89 1 10 86 0
                                         90 1 86 0 28 91 2 0 9 0 0 1 2 0 0 0 0
                                         55 2 0 9 0 0 1 1 1 12 0 1 2 0 0 0 12
                                         42 2 0 9 0 0 81 1 0 0 0 59 2 0 0 0 10
                                         79 2 0 74 0 0 76 1 1 9 0 1 2 0 12 0 28
                                         31 1 0 0 15 16 1 0 0 15 17 1 0 32 28
                                         33 2 0 0 12 7 13 2 0 0 12 18 20 1 0 10
                                         0 35 1 1 9 0 1 1 0 10 0 36 2 0 0 0 0 1
                                         1 0 10 0 37 2 0 0 0 0 1 1 0 85 0 1 2 0
                                         0 0 0 53 2 0 9 0 0 52 1 0 12 0 41 1 0
                                         15 0 40 1 0 7 0 24 1 0 9 0 45 1 0 86 0
                                         92 1 0 28 0 29 3 0 60 60 10 10 61 2 0
                                         60 10 10 62 2 0 28 0 10 49 3 0 28 0 10
                                         10 50 2 0 0 0 10 78 2 0 9 0 0 1 2 0 9
                                         0 0 1 2 0 9 0 0 51 2 0 9 0 0 83 2 0 9
                                         0 0 82)))))
           '|lookupComplete|)) 
