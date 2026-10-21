
(SDEFUN |GROEBSOL;testPower|
        ((|uf|
          (|SparseUnivariatePolynomial|
           (|DistributedMultivariatePolynomial| |lv| F)))
         (|x| (|OrderedVariableList| |lv|))
         (|lpol| (|List| (|DistributedMultivariatePolynomial| |lv| F)))
         (%
          (|Union| (|DistributedMultivariatePolynomial| |lv| F) #1="failed")))
        (SPROG
         ((|df| (|NonNegativeInteger|)) (#2=#:G21 NIL)
          (|testquo|
           (|Union| (|DistributedMultivariatePolynomial| |lv| F) "failed"))
          (|gg| (|DistributedMultivariatePolynomial| |lv| F))
          (|trailp| (|DistributedMultivariatePolynomial| |lv| F))
          (#3=#:G19 NIL) (|lc| (|DistributedMultivariatePolynomial| |lv| F))
          (|linp|
           (|SparseUnivariatePolynomial|
            (|DistributedMultivariatePolynomial| |lv| F)))
          (|g| (|DistributedMultivariatePolynomial| |lv| F)))
         (SEQ (LETT |df| (SPADCALL |uf| (QREFELT % 12)))
              (LETT |trailp|
                    (SPADCALL |uf|
                              (PROG1 (LETT #2# (- |df| 1))
                                (|check_subtype2| (>= #2# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #2#))
                              (QREFELT % 16)))
              (LETT |testquo|
                    (SPADCALL |trailp| (SPADCALL |df| (QREFELT % 18))
                              (QREFELT % 20)))
              (EXIT
               (COND ((QEQCAR |testquo| 1) (CONS 1 "failed"))
                     (#4='T
                      (SEQ (LETT |trailp| (QCDR |testquo|))
                           (LETT |gg|
                                 (SPADCALL
                                  (LETT |lc| (SPADCALL |uf| (QREFELT % 21)))
                                  |trailp| (QREFELT % 22)))
                           (LETT |trailp|
                                 (PROG2
                                     (LETT #3#
                                           (SPADCALL |trailp| |gg|
                                                     (QREFELT % 23)))
                                     (QCDR #3#)
                                   (|check_union2| (QEQCAR #3# 0)
                                                   (|DistributedMultivariatePolynomial|
                                                    (QREFELT % 6)
                                                    (QREFELT % 7))
                                                   (|Union|
                                                    (|DistributedMultivariatePolynomial|
                                                     (QREFELT % 6)
                                                     (QREFELT % 7))
                                                    #1#)
                                                   #3#)))
                           (LETT |lc|
                                 (PROG2
                                     (LETT #3#
                                           (SPADCALL |lc| |gg| (QREFELT % 23)))
                                     (QCDR #3#)
                                   (|check_union2| (QEQCAR #3# 0)
                                                   (|DistributedMultivariatePolynomial|
                                                    (QREFELT % 6)
                                                    (QREFELT % 7))
                                                   (|Union|
                                                    (|DistributedMultivariatePolynomial|
                                                     (QREFELT % 6)
                                                     (QREFELT % 7))
                                                    #1#)
                                                   #3#)))
                           (LETT |linp|
                                 (SPADCALL (SPADCALL |lc| 1 (QREFELT % 24))
                                           (SPADCALL |trailp| 0 (QREFELT % 24))
                                           (QREFELT % 25)))
                           (LETT |g|
                                 (SPADCALL
                                  (SPADCALL |uf|
                                            (SPADCALL |linp| |df|
                                                      (QREFELT % 26))
                                            (QREFELT % 27))
                                  |x| (QREFELT % 30)))
                           (EXIT
                            (COND
                             ((SPADCALL (SPADCALL |g| |lpol| (QREFELT % 33))
                                        (|spadConstant| % 34) (QREFELT % 36))
                              (CONS 1 "failed"))
                             (#4#
                              (CONS 0
                                    (SPADCALL |linp| |x|
                                              (QREFELT % 30))))))))))))) 

(SDEFUN |GROEBSOL;testGenPos|
        ((|lpol| (|List| (|DistributedMultivariatePolynomial| |lv| F)))
         (|lvar| (|List| (|OrderedVariableList| |lv|)))
         (%
          (|Union| (|List| (|DistributedMultivariatePolynomial| |lv| F))
                   "failed")))
        (SPROG
         ((|rlpol| (|List| (|DistributedMultivariatePolynomial| |lv| F)))
          (|f| #1=(|DistributedMultivariatePolynomial| |lv| F)) (#2=#:G47 NIL)
          (|x| (|OrderedVariableList| |lv|))
          (|fi|
           (|SparseUnivariatePolynomial|
            (|DistributedMultivariatePolynomial| |lv| F)))
          (|g| (|Union| (|DistributedMultivariatePolynomial| |lv| F) "failed"))
          (|newlpol| (|List| #1#))
          (|rlvar| (|List| (|OrderedVariableList| |lv|))) (#3=#:G46 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |rlpol| (REVERSE |lpol|))
                (LETT |f| (|SPADfirst| |rlpol|))
                (EXIT
                 (COND ((EQL (LENGTH |lvar|) 1) (CONS 0 (LIST |f|)))
                       ('T
                        (SEQ (LETT |rlvar| (CDR (REVERSE |lvar|)))
                             (LETT |newlpol| (LIST |f|))
                             (SEQ (LETT #2# (CDR |rlpol|)) G190
                                  (COND
                                   ((OR (ATOM #2#)
                                        (PROGN (LETT |f| (CAR #2#)) NIL))
                                    (GO G191)))
                                  (SEQ (LETT |x| (|SPADfirst| |rlvar|))
                                       (LETT |fi|
                                             (SPADCALL |f| |x| (QREFELT % 37)))
                                       (EXIT
                                        (COND
                                         ((QEQCAR
                                           (SPADCALL
                                            (SPADCALL |fi| (QREFELT % 21))
                                            (QREFELT % 39))
                                           1)
                                          (SEQ
                                           (SEQ
                                            (LETT |g|
                                                  (|GROEBSOL;testPower| |fi|
                                                   |x| |newlpol| %))
                                            (EXIT
                                             (COND
                                              ((QEQCAR |g| 1)
                                               (PROGN
                                                (LETT #3# (CONS 1 "failed"))
                                                (GO #4=#:G45))))))
                                           (LETT |newlpol|
                                                 (CONS
                                                  (SPADCALL (QCDR |g|)
                                                            |newlpol|
                                                            (QREFELT % 33))
                                                  |newlpol|))
                                           (EXIT
                                            (LETT |rlvar| (CDR |rlvar|)))))
                                         ((SPADCALL
                                           (SPADCALL |f| |newlpol|
                                                     (QREFELT % 33))
                                           (|spadConstant| % 34)
                                           (QREFELT % 36))
                                          (PROGN
                                           (LETT #3# (CONS 1 "failed"))
                                           (GO #4#))))))
                                  (LETT #2# (CDR #2#)) (GO G190) G191
                                  (EXIT NIL))
                             (EXIT (CONS 0 |newlpol|))))))))
          #4# (EXIT #3#)))) 

(SDEFUN |GROEBSOL;genPos|
        ((|lp| (|List| (|DistributedMultivariatePolynomial| |lv| F)))
         (|lvar| (|List| (|OrderedVariableList| |lv|)))
         (%
          (|Record|
           (|:| |polys|
                (|List|
                 (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
           (|:| |lpolys| (|List| (|DistributedMultivariatePolynomial| |lv| F)))
           (|:| |coord| (|List| (|Integer|)))
           (|:| |univp|
                (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))))
        (SPROG
         ((#1=#:G63 NIL) (|f| NIL) (#2=#:G64 NIL)
          (|lnp|
           (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
          (|x| (|OrderedVariableList| |lv|))
          (|rlvar| (|List| (|OrderedVariableList| |lv|))) (|count| NIL)
          (#3=#:G65 NIL) (#4=#:G66 NIL) (|ranvals| (|List| (|Integer|)))
          (|rv| NIL) (#5=#:G68 NIL) (|vv| NIL) (#6=#:G67 NIL)
          (#7=#:G56 #8=(|HomogeneousDistributedMultivariatePolynomial| |lv| F))
          (#9=#:G54 #8#) (#10=#:G55 NIL) (|val| #8#) (#11=#:G69 NIL) (|p| NIL)
          (#12=#:G70 NIL)
          (|gb|
           (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
          (|gbt| (|List| (|DistributedMultivariatePolynomial| |lv| F)))
          (|gb1|
           (|Union| (|List| (|DistributedMultivariatePolynomial| |lv| F))
                    #13="failed"))
          (|testfail| (|Boolean|)) (#14=#:G29 NIL))
         (SEQ (LETT |rlvar| (REVERSE |lvar|))
              (LETT |lnp|
                    (PROGN
                     (LETT #1# NIL)
                     (SEQ (LETT |f| NIL) (LETT #2# |lp|) G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT |f| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #1#
                                  (CONS (SPADCALL |f| (QREFELT % 42)) #1#))))
                          (LETT #2# (CDR #2#)) (GO G190) G191
                          (EXIT (NREVERSE #1#)))))
              (LETT |x| (|SPADfirst| |rlvar|)) (LETT |rlvar| (CDR |rlvar|))
              (LETT |testfail| 'T)
              (SEQ (LETT |count| 1) G190 (COND ((NULL |testfail|) (GO G191)))
                   (SEQ
                    (LETT |ranvals|
                          (PROGN
                           (LETT #3# NIL)
                           (SEQ (LETT |vv| NIL) (LETT #4# |rlvar|) G190
                                (COND
                                 ((OR (ATOM #4#)
                                      (PROGN (LETT |vv| (CAR #4#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #3#
                                        (CONS
                                         (+ 1
                                            (RANDOM
                                             (* |count| (LENGTH |lvar|))))
                                         #3#))))
                                (LETT #4# (CDR #4#)) (GO G190) G191
                                (EXIT (NREVERSE #3#)))))
                    (LETT |val|
                          (PROGN
                           (LETT #10# NIL)
                           (SEQ (LETT |rv| NIL) (LETT #5# |ranvals|)
                                (LETT |vv| NIL) (LETT #6# |rlvar|) G190
                                (COND
                                 ((OR (ATOM #6#)
                                      (PROGN (LETT |vv| (CAR #6#)) NIL)
                                      (ATOM #5#)
                                      (PROGN (LETT |rv| (CAR #5#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (PROGN
                                   (LETT #7#
                                         (SPADCALL |rv|
                                                   (SPADCALL |vv|
                                                             (QREFELT % 43))
                                                   (QREFELT % 44)))
                                   (COND
                                    (#10#
                                     (LETT #9#
                                           (SPADCALL #9# #7# (QREFELT % 45))))
                                    ('T
                                     (PROGN (LETT #9# #7#) (LETT #10# 'T)))))))
                                (LETT #6#
                                      (PROG1 (CDR #6#) (LETT #5# (CDR #5#))))
                                (GO G190) G191 (EXIT NIL))
                           (COND (#10# #9#) ('T (|spadConstant| % 46)))))
                    (LETT |val|
                          (SPADCALL |val| (SPADCALL |x| (QREFELT % 43))
                                    (QREFELT % 45)))
                    (LETT |gb|
                          (PROGN
                           (LETT #11# NIL)
                           (SEQ (LETT |p| NIL) (LETT #12# |lnp|) G190
                                (COND
                                 ((OR (ATOM #12#)
                                      (PROGN (LETT |p| (CAR #12#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #11#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL |p| |x| (QREFELT % 47))
                                          |val| (QREFELT % 49))
                                         #11#))))
                                (LETT #12# (CDR #12#)) (GO G190) G191
                                (EXIT (NREVERSE #11#)))))
                    (LETT |gb| (SPADCALL |gb| (QREFELT % 52)))
                    (LETT |gbt| (SPADCALL |gb| (QREFELT % 54)))
                    (LETT |gb1| (|GROEBSOL;testGenPos| |gbt| |lvar| %))
                    (EXIT
                     (COND ((QEQCAR |gb1| 1) "try again")
                           ('T (LETT |testfail| NIL)))))
                   (LETT |count| (|inc_SI| |count|)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (VECTOR |gb| |gbt| |ranvals|
                       (SPADCALL
                        (SPADCALL
                         (PROG2 (LETT #14# |gb1|)
                             (QCDR #14#)
                           (|check_union2| (QEQCAR #14# 0)
                                           (|List|
                                            (|DistributedMultivariatePolynomial|
                                             (QREFELT % 6) (QREFELT % 7)))
                                           (|Union|
                                            (|List|
                                             (|DistributedMultivariatePolynomial|
                                              (QREFELT % 6) (QREFELT % 7)))
                                            #13#)
                                           #14#))
                         (QREFELT % 55))
                        (QREFELT % 42))))))) 

(SDEFUN |GROEBSOL;genericPosition;LLR;4|
        ((|lp| (|List| (|DistributedMultivariatePolynomial| |lv| F)))
         (|lvar| (|List| (|OrderedVariableList| |lv|)))
         (%
          (|Record|
           (|:| |dpolys| (|List| (|DistributedMultivariatePolynomial| |lv| F)))
           (|:| |coords| (|List| (|Integer|))))))
        (SPROG
         ((|nans|
           (|Record|
            (|:| |polys|
                 (|List|
                  (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
            (|:| |lpolys|
                 (|List| (|DistributedMultivariatePolynomial| |lv| F)))
            (|:| |coord| (|List| (|Integer|)))
            (|:| |univp|
                 (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))))
         (SEQ (LETT |nans| (|GROEBSOL;genPos| |lp| |lvar| %))
              (EXIT (CONS (QVELT |nans| 1) (QVELT |nans| 2)))))) 

(SDEFUN |GROEBSOL;select|
        ((|lup|
          (|List|
           (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))))
         (%
          #1=(|List|
              (|List|
               (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))))
        (SPROG
         ((|f| NIL) (#2=#:G81 NIL) (#3=#:G82 NIL) (|lsel| NIL) (#4=#:G83 NIL)
          (#5=#:G77 #1#) (#6=#:G75 #1#) (#7=#:G76 NIL))
         (SEQ
          (COND
           ((SPADCALL |lup| NIL (QREFELT % 60)) (SPADCALL NIL (QREFELT % 61)))
           (#8='T
            (PROGN
             (LETT #7# NIL)
             (SEQ (LETT |f| NIL) (LETT #2# (|SPADfirst| |lup|)) G190
                  (COND
                   ((OR (ATOM #2#) (PROGN (LETT |f| (CAR #2#)) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #5#
                           (PROGN
                            (LETT #3# NIL)
                            (SEQ (LETT |lsel| NIL)
                                 (LETT #4# (|GROEBSOL;select| (CDR |lup|) %))
                                 G190
                                 (COND
                                  ((OR (ATOM #4#)
                                       (PROGN (LETT |lsel| (CAR #4#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #3# (CONS (CONS |f| |lsel|) #3#))))
                                 (LETT #4# (CDR #4#)) (GO G190) G191
                                 (EXIT (NREVERSE #3#)))))
                     (COND (#7# (LETT #6# (SPADCALL #6# #5# (QREFELT % 62))))
                           ('T (PROGN (LETT #6# #5#) (LETT #7# 'T)))))))
                  (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
             (COND (#7# #6#) (#8# NIL)))))))) 

(SDEFUN |GROEBSOL;findCompon|
        ((|leq|
          (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
         (|lvar| (|List| (|OrderedVariableList| |lv|)))
         (% (|List| (|List| (|DistributedMultivariatePolynomial| |lv| F)))))
        (SPROG
         ((|teq| #1=(|List| (|DistributedMultivariatePolynomial| |lv| F)))
          (|gp|
           (|Record|
            (|:| |polys|
                 (|List|
                  (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
            (|:| |lpolys|
                 (|List| (|DistributedMultivariatePolynomial| |lv| F)))
            (|:| |coord| (|List| (|Integer|)))
            (|:| |univp|
                 (|HomogeneousDistributedMultivariatePolynomial| |lv| F))))
          (|lgp|
           (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
          (|g| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
          (|fg|
           (|Factored|
            (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
          (#2=#:G110 NIL) (|ff| NIL) (#3=#:G111 NIL)
          (|lfact|
           (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
          (|tfact| NIL) (#4=#:G112 NIL)
          (|tlfact|
           (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
          (|result|
           (|List|
            (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))))
          (|ranvals| (|List| (|Integer|))) (|x| (|OrderedVariableList| |lv|))
          (|rlvar| (|List| (|OrderedVariableList| |lv|))) (|rv| NIL)
          (#5=#:G114 NIL) (|vv| NIL) (#6=#:G113 NIL)
          (#7=#:G99 #8=(|HomogeneousDistributedMultivariatePolynomial| |lv| F))
          (#9=#:G97 #8#) (#10=#:G98 NIL) (|val| #8#) (#11=#:G115 NIL)
          (|lp| NIL) (#12=#:G116 NIL) (#13=#:G117 NIL) (|p| NIL)
          (#14=#:G118 NIL) (|ans| (|List| #1#)) (#15=#:G119 NIL) (|ll| NIL)
          (#16=#:G120 NIL))
         (SEQ (LETT |teq| (SPADCALL |leq| (QREFELT % 54)))
              (EXIT
               (COND ((EQL (LENGTH |teq|) (LENGTH |lvar|)) (LIST |teq|))
                     (#17='T
                      (SEQ (LETT |gp| (|GROEBSOL;genPos| |teq| |lvar| %))
                           (LETT |lgp| (QVELT |gp| 0))
                           (LETT |g| (QVELT |gp| 3))
                           (LETT |fg| (SPADCALL |g| (QREFELT % 65)))
                           (LETT |lfact|
                                 (PROGN
                                  (LETT #2# NIL)
                                  (SEQ (LETT |ff| NIL)
                                       (LETT #3#
                                             (SPADCALL |fg| (QREFELT % 69)))
                                       G190
                                       (COND
                                        ((OR (ATOM #3#)
                                             (PROGN (LETT |ff| (CAR #3#)) NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #2# (CONS (QVELT |ff| 1) #2#))))
                                       (LETT #3# (CDR #3#)) (GO G190) G191
                                       (EXIT (NREVERSE #2#)))))
                           (LETT |result| NIL)
                           (EXIT
                            (COND ((EQL (LENGTH |lfact|) 1) (LIST |teq|))
                                  (#17#
                                   (SEQ
                                    (SEQ (LETT |tfact| NIL) (LETT #4# |lfact|)
                                         G190
                                         (COND
                                          ((OR (ATOM #4#)
                                               (PROGN
                                                (LETT |tfact| (CAR #4#))
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (LETT |tlfact| (CONS |tfact| |lgp|))
                                          (EXIT
                                           (LETT |result|
                                                 (CONS |tlfact| |result|))))
                                         (LETT #4# (CDR #4#)) (GO G190) G191
                                         (EXIT NIL))
                                    (LETT |ranvals| (QVELT |gp| 2))
                                    (LETT |rlvar| (REVERSE |lvar|))
                                    (LETT |x| (|SPADfirst| |rlvar|))
                                    (LETT |rlvar| (CDR |rlvar|))
                                    (LETT |val|
                                          (PROGN
                                           (LETT #10# NIL)
                                           (SEQ (LETT |rv| NIL)
                                                (LETT #5# |ranvals|)
                                                (LETT |vv| NIL)
                                                (LETT #6# |rlvar|) G190
                                                (COND
                                                 ((OR (ATOM #6#)
                                                      (PROGN
                                                       (LETT |vv| (CAR #6#))
                                                       NIL)
                                                      (ATOM #5#)
                                                      (PROGN
                                                       (LETT |rv| (CAR #5#))
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (PROGN
                                                   (LETT #7#
                                                         (SPADCALL |rv|
                                                                   (SPADCALL
                                                                    |vv|
                                                                    (QREFELT %
                                                                             43))
                                                                   (QREFELT %
                                                                            44)))
                                                   (COND
                                                    (#10#
                                                     (LETT #9#
                                                           (SPADCALL #9# #7#
                                                                     (QREFELT %
                                                                              45))))
                                                    ('T
                                                     (PROGN
                                                      (LETT #9# #7#)
                                                      (LETT #10# 'T)))))))
                                                (LETT #6#
                                                      (PROG1 (CDR #6#)
                                                        (LETT #5# (CDR #5#))))
                                                (GO G190) G191 (EXIT NIL))
                                           (COND (#10# #9#)
                                                 (#17#
                                                  (|spadConstant| % 46)))))
                                    (LETT |val|
                                          (SPADCALL
                                           (SPADCALL |x| (QREFELT % 43)) |val|
                                           (QREFELT % 70)))
                                    (LETT |ans|
                                          (PROGN
                                           (LETT #11# NIL)
                                           (SEQ (LETT |lp| NIL)
                                                (LETT #12# |result|) G190
                                                (COND
                                                 ((OR (ATOM #12#)
                                                      (PROGN
                                                       (LETT |lp| (CAR #12#))
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT #11#
                                                        (CONS
                                                         (SPADCALL
                                                          (SPADCALL
                                                           (PROGN
                                                            (LETT #13# NIL)
                                                            (SEQ (LETT |p| NIL)
                                                                 (LETT #14#
                                                                       |lp|)
                                                                 G190
                                                                 (COND
                                                                  ((OR
                                                                    (ATOM #14#)
                                                                    (PROGN
                                                                     (LETT |p|
                                                                           (CAR
                                                                            #14#))
                                                                     NIL))
                                                                   (GO G191)))
                                                                 (SEQ
                                                                  (EXIT
                                                                   (LETT #13#
                                                                         (CONS
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            |p|
                                                                            |x|
                                                                            (QREFELT
                                                                             %
                                                                             47))
                                                                           |val|
                                                                           (QREFELT
                                                                            %
                                                                            49))
                                                                          #13#))))
                                                                 (LETT #14#
                                                                       (CDR
                                                                        #14#))
                                                                 (GO G190) G191
                                                                 (EXIT
                                                                  (NREVERSE
                                                                   #13#))))
                                                           (QREFELT % 52))
                                                          (QREFELT % 54))
                                                         #11#))))
                                                (LETT #12# (CDR #12#))
                                                (GO G190) G191
                                                (EXIT (NREVERSE #11#)))))
                                    (EXIT
                                     (PROGN
                                      (LETT #15# NIL)
                                      (SEQ (LETT |ll| NIL) (LETT #16# |ans|)
                                           G190
                                           (COND
                                            ((OR (ATOM #16#)
                                                 (PROGN
                                                  (LETT |ll| (CAR #16#))
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (COND
                                              ((SPADCALL |ll|
                                                         (LIST
                                                          (|spadConstant| %
                                                                          71))
                                                         (QREFELT % 72))
                                               (LETT #15# (CONS |ll| #15#))))))
                                           (LETT #16# (CDR #16#)) (GO G190)
                                           G191
                                           (EXIT (NREVERSE #15#)))))))))))))))) 

(SDEFUN |GROEBSOL;zeroDim?|
        ((|lp|
          (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
         (|lvar| #1=(|List| (|OrderedVariableList| |lv|))) (% (|Boolean|)))
        (SPROG
         ((|n| (|NonNegativeInteger|)) (|f| NIL) (#2=#:G132 NIL)
          (|g| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
          (#3=#:G124 NIL) (|x| (|OrderedVariableList| |lv|)) (|lvint1| #1#))
         (SEQ
          (COND ((NULL |lp|) NIL)
                (#4='T
                 (SEQ (LETT |n| (LENGTH |lvar|))
                      (EXIT
                       (COND ((< (LENGTH |lp|) |n|) NIL)
                             (#4#
                              (SEQ (LETT |lvint1| |lvar|)
                                   (SEQ (LETT |f| NIL) (LETT #2# |lp|) G190
                                        (COND
                                         ((OR (ATOM #2#)
                                              (PROGN (LETT |f| (CAR #2#)) NIL)
                                              (NULL (NULL (NULL |lvint1|))))
                                          (GO G191)))
                                        (SEQ
                                         (LETT |g|
                                               (SPADCALL |f|
                                                         (SPADCALL |f|
                                                                   (QREFELT %
                                                                            73))
                                                         (QREFELT % 70)))
                                         (LETT |x|
                                               (PROG2
                                                   (LETT #3#
                                                         (SPADCALL |g|
                                                                   (QREFELT %
                                                                            74)))
                                                   (QCDR #3#)
                                                 (|check_union2| (QEQCAR #3# 0)
                                                                 (|OrderedVariableList|
                                                                  (QREFELT %
                                                                           6))
                                                                 (|Union|
                                                                  (|OrderedVariableList|
                                                                   (QREFELT %
                                                                            6))
                                                                  "failed")
                                                                 #3#)))
                                         (EXIT
                                          (COND
                                           ((SPADCALL
                                             (SPADCALL
                                              (SPADCALL |g| |x| (QREFELT % 47))
                                              (QREFELT % 75))
                                             (QREFELT % 76))
                                            (LETT |lvint1|
                                                  (SPADCALL |x| |lvint1|
                                                            (QREFELT %
                                                                     77)))))))
                                        (LETT #2# (CDR #2#)) (GO G190) G191
                                        (EXIT NIL))
                                   (EXIT (NULL |lvint1|)))))))))))) 

(SDEFUN |GROEBSOL;groebSolve;LLL;8|
        ((|leq| (|List| (|DistributedMultivariatePolynomial| |lv| F)))
         (|lvar| (|List| (|OrderedVariableList| |lv|)))
         (% (|List| (|List| (|DistributedMultivariatePolynomial| |lv| F)))))
        (SPROG
         ((#1=#:G152 NIL) (|f| NIL) (#2=#:G153 NIL)
          (|lnp|
           (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
          (|leq1|
           #3=(|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
          (|basis|
           (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
          (|x| NIL) (#4=#:G154 NIL)
          (|g| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
          (|fg|
           (|Factored|
            (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
          (|llfact|
           (|List|
            (|Factored|
             (|HomogeneousDistributedMultivariatePolynomial| |lv| F))))
          (#5=#:G151 NIL) (#6=#:G155 NIL) (|llf| NIL) (#7=#:G156 NIL)
          (#8=#:G157 NIL) (|ff| NIL) (#9=#:G158 NIL)
          (|lfact|
           (|List|
            (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))))
          (#10=#:G159 NIL) (|tfact| #3#)
          (|result|
           (|List| (|List| (|DistributedMultivariatePolynomial| |lv| F)))))
         (SEQ
          (LETT |lnp|
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |f| NIL) (LETT #2# |leq|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |f| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1# (CONS (SPADCALL |f| (QREFELT % 42)) #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#)))))
          (LETT |leq1| (SPADCALL |lnp| (QREFELT % 52)))
          (COND
           ((EQL (LENGTH |leq1|) 1)
            (COND
             ((SPADCALL (|SPADfirst| |leq1|) (|spadConstant| % 78)
                        (QREFELT % 79))
              (EXIT NIL)))))
          (COND
           ((NULL (|GROEBSOL;zeroDim?| |leq1| |lvar| %))
            (EXIT
             (|error| "system does not have a finite number of solutions"))))
          (LETT |basis| (SPADCALL |leq1| (QREFELT % 80))) (LETT |llfact| NIL)
          (SEQ
           (EXIT
            (SEQ (LETT |x| NIL) (LETT #4# |lvar|) G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |x| (CAR #4#)) NIL)) (GO G191)))
                 (SEQ (LETT |g| (SPADCALL |leq1| |basis| |x| (QREFELT % 81)))
                      (LETT |fg| (SPADCALL |g| (QREFELT % 65)))
                      (LETT |llfact| (CONS |fg| |llfact|))
                      (EXIT
                       (COND
                        ((EQL (SPADCALL |g| |x| (QREFELT % 82))
                              (LENGTH |basis|))
                         (PROGN (LETT #5# 1) (GO #11=#:G140))))))
                 (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL)))
           #11# (EXIT #5#))
          (LETT |result| NIL)
          (LETT |lfact|
                (|GROEBSOL;select|
                 (PROGN
                  (LETT #6# NIL)
                  (SEQ (LETT |llf| NIL) (LETT #7# |llfact|) G190
                       (COND
                        ((OR (ATOM #7#) (PROGN (LETT |llf| (CAR #7#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #6#
                               (CONS
                                (PROGN
                                 (LETT #8# NIL)
                                 (SEQ (LETT |ff| NIL)
                                      (LETT #9#
                                            (SPADCALL |llf| (QREFELT % 69)))
                                      G190
                                      (COND
                                       ((OR (ATOM #9#)
                                            (PROGN (LETT |ff| (CAR #9#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #8# (CONS (QVELT |ff| 1) #8#))))
                                      (LETT #9# (CDR #9#)) (GO G190) G191
                                      (EXIT (NREVERSE #8#))))
                                #6#))))
                       (LETT #7# (CDR #7#)) (GO G190) G191
                       (EXIT (NREVERSE #6#))))
                 %))
          (SEQ (LETT #10# |lfact|) G190
               (COND
                ((OR (ATOM #10#) (PROGN (LETT |tfact| (CAR #10#)) NIL))
                 (GO G191)))
               (SEQ
                (LETT |tfact|
                      (SPADCALL (SPADCALL |tfact| |leq1| (QREFELT % 83))
                                (QREFELT % 52)))
                (EXIT
                 (COND
                  ((SPADCALL |tfact| (LIST (|spadConstant| % 78))
                             (QREFELT % 84))
                   "next value")
                  ('T
                   (LETT |result|
                         (SPADCALL |result|
                                   (|GROEBSOL;findCompon| |tfact| |lvar| %)
                                   (QREFELT % 86)))))))
               (LETT #10# (CDR #10#)) (GO G190) G191 (EXIT NIL))
          (EXIT |result|)))) 

(SDEFUN |GROEBSOL;testDim;LLU;9|
        ((|leq|
          (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
         (|lvar| (|List| (|OrderedVariableList| |lv|)))
         (%
          (|Union|
           (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
           "failed")))
        (SPROG
         ((|leq1|
           (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))))
         (SEQ (LETT |leq1| (SPADCALL |leq| (QREFELT % 52)))
              (COND
               ((EQL (LENGTH |leq1|) 1)
                (COND
                 ((SPADCALL (|SPADfirst| |leq1|) (|spadConstant| % 78)
                            (QREFELT % 79))
                  (EXIT (CONS 0 NIL))))))
              (COND
               ((NULL (|GROEBSOL;zeroDim?| |leq1| |lvar| %))
                (EXIT (CONS 1 "failed"))))
              (EXIT (CONS 0 |leq1|))))) 

(DECLAIM (NOTINLINE |GroebnerSolve;|)) 

(DEFUN |GroebnerSolve;| (|#1| |#2| |#3|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 |#1|)
          (LETT DV$2 (|devaluate| |#2|))
          (LETT DV$3 (|devaluate| |#3|))
          (LETT |dv$| (LIST '|GroebnerSolve| DV$1 DV$2 DV$3))
          (LETT % (GETREFV 90))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|GroebnerSolve|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (QSETREFV % 8 |#3|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 9 (LENGTH |#1|))
          %))) 

(DEFUN |GroebnerSolve| (&REST #1=#:G171)
  (SPROG NIL
         (PROG (#2=#:G172)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluate_sig| #1# '(NIL T T))
                                               (HGET |$ConstructorCache|
                                                     '|GroebnerSolve|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |GroebnerSolve;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|GroebnerSolve|)))))))))) 

(MAKEPROP '|GroebnerSolve| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) '|nv| (|NonNegativeInteger|)
              (|SparseUnivariatePolynomial| 15) (0 . |degree|) (5 . |1|)
              (9 . |1|)
              (|DistributedMultivariatePolynomial| (NRTEVAL (QREFELT % 6)) 7)
              (13 . |coefficient|) (|Integer|) (19 . |coerce|)
              (|Union| % '"failed") (24 . |exquo|) (30 . |leadingCoefficient|)
              (35 . |gcd|) (41 . |exquo|) (47 . |monomial|) (53 . +) (59 . ^)
              (65 . -) (|SparseUnivariatePolynomial| %)
              (|OrderedVariableList| (NRTEVAL (QREFELT % 6)))
              (71 . |multivariate|) (|List| 15)
              (|GroebnerInternalPackage| 7
                                         (|DirectProduct|
                                          (NRTEVAL (LENGTH (QREFELT % 6))) 10)
                                         15)
              (77 . |redPol|) (83 . |0|) (|Boolean|) (87 . ~=)
              (93 . |univariate|) (|Union| 29 '"failed") (99 . |mainVariable|)
              (|HomogeneousDistributedMultivariatePolynomial|
               (NRTEVAL (QREFELT % 6)) 7)
              (|PolToPol| (NRTEVAL (QREFELT % 6)) 7) (104 . |dmpToHdmp|)
              (109 . |coerce|) (114 . *) (120 . +) (126 . |0|)
              (130 . |univariate|) (|SparseUnivariatePolynomial| 40)
              (136 . |elt|) (|List| 40)
              (|GroebnerPackage| 7
                                 (|HomogeneousDirectProduct|
                                  (NRTEVAL (LENGTH (QREFELT % 6))) 10)
                                 40)
              (142 . |groebner|)
              (|LinGroebnerPackage| (NRTEVAL (QREFELT % 6)) 7)
              (147 . |totolex|) (152 . |last|)
              (|Record| (|:| |dpolys| 31) (|:| |coords| (|List| 17)))
              (|List| 29) |GROEBSOL;genericPosition;LLR;4| (|List| 50)
              (157 . =) (163 . |list|) (168 . |append|) (|Factored| 40)
              (|GeneralizedMultivariateFactorize| 29
                                                  (|HomogeneousDirectProduct|
                                                   (NRTEVAL
                                                    (LENGTH (QREFELT % 6)))
                                                   10)
                                                  8 7 40)
              (174 . |factor|) (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 66) (|:| |factor| 40) (|:| |exponent| 10))
              (|List| 67) (179 . |factorList|) (184 . -) (190 . |1|) (194 . ~=)
              (200 . |reductum|) (205 . |mainVariable|)
              (210 . |leadingCoefficient|) (215 . |ground?|) (220 . |remove|)
              (226 . |1|) (230 . =) (236 . |computeBasis|) (241 . |minPol|)
              (248 . |degree|) (254 . |concat|) (260 . =) (|List| 31)
              (266 . |concat|) |GROEBSOL;groebSolve;LLL;8|
              (|Union| 50 '"failed") |GROEBSOL;testDim;LLU;9|)
           '#(|testDim| 272 |groebSolve| 278 |genericPosition| 284) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|groebSolve|
                                 ((|List|
                                   (|List|
                                    (|DistributedMultivariatePolynomial| |#1|
                                                                         |#2|)))
                                  (|List|
                                   (|DistributedMultivariatePolynomial| |#1|
                                                                        |#2|))
                                  (|List| (|OrderedVariableList| |#1|))))
                                T)
                              '((|testDim|
                                 ((|Union|
                                   (|List|
                                    (|HomogeneousDistributedMultivariatePolynomial|
                                     |#1| |#2|))
                                   "failed")
                                  (|List|
                                   (|HomogeneousDistributedMultivariatePolynomial|
                                    |#1| |#2|))
                                  (|List| (|OrderedVariableList| |#1|))))
                                T)
                              '((|genericPosition|
                                 ((|Record|
                                   (|:| |dpolys|
                                        (|List|
                                         (|DistributedMultivariatePolynomial|
                                          |#1| |#2|)))
                                   (|:| |coords| (|List| (|Integer|))))
                                  (|List|
                                   (|DistributedMultivariatePolynomial| |#1|
                                                                        |#2|))
                                  (|List| (|OrderedVariableList| |#1|))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 89
                                            '(1 11 10 0 12 0 7 0 13 0 8 0 14 2
                                              11 15 0 10 16 1 7 0 17 18 2 15 19
                                              0 7 20 1 11 15 0 21 2 15 0 0 0 22
                                              2 15 19 0 0 23 2 11 0 15 10 24 2
                                              11 0 0 0 25 2 11 0 0 10 26 2 11 0
                                              0 0 27 2 15 0 28 29 30 2 32 15 15
                                              31 33 0 15 0 34 2 15 35 0 0 36 2
                                              15 28 0 29 37 1 15 38 0 39 1 41
                                              40 15 42 1 40 0 29 43 2 40 0 17 0
                                              44 2 40 0 0 0 45 0 40 0 46 2 40
                                              28 0 29 47 2 48 40 0 40 49 1 51
                                              50 50 52 1 53 31 50 54 1 31 15 0
                                              55 2 59 35 0 0 60 1 59 0 50 61 2
                                              59 0 0 0 62 1 64 63 40 65 1 63 68
                                              0 69 2 40 0 0 0 70 0 15 0 71 2 31
                                              35 0 0 72 1 40 0 0 73 1 40 38 0
                                              74 1 48 40 0 75 1 40 35 0 76 2 57
                                              0 29 0 77 0 40 0 78 2 40 35 0 0
                                              79 1 53 50 50 80 3 53 40 50 50 29
                                              81 2 40 10 0 29 82 2 50 0 0 0 83
                                              2 50 35 0 0 84 2 85 0 0 0 86 2 0
                                              88 50 57 89 2 0 85 31 57 87 2 0
                                              56 31 57 58)))))
           '|lookupComplete|)) 
