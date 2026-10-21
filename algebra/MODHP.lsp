
(SDEFUN |MODHP;VSUPI_to_VPA;VIV;1|
        ((|vps| (|Vector| (|SparseUnivariatePolynomial| (|Integer|))))
         (|p| (|Integer|)) (% (|Vector| (|U32Vector|))))
        (SPROG
         ((|m| (|NonNegativeInteger|)) (|vpa| (|Vector| (|U32Vector|)))
          (|i| NIL) (#1=#:G36 NIL))
         (SEQ (LETT |m| (QVSIZE |vps|))
              (LETT |vpa| (MAKEARR1 |m| (GETREFV_U32 0 0)))
              (SEQ (LETT |i| 1) (LETT #1# |m|) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |vpa| |i|
                               (SPADCALL (SPADCALL |vps| |i| (QREFELT % 9)) |p|
                                         (QREFELT % 12))
                               (QREFELT % 14))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |vpa|)))) 

(SDEFUN |MODHP;SUPPI_to_PA|
        ((|poli| (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|))))
         (|vars| (|List| (|Symbol|))) (|pts| (|List| (|Integer|)))
         (|p| (|Integer|)) (% (|U32Vector|)))
        (SPROG
         ((|n| #1=(|NonNegativeInteger|)) (|pa| (|U32Vector|)) (|m| #1#)
          (|nlc| (|Integer|)))
         (SEQ (LETT |n| (SPADCALL |poli| (QREFELT % 18)))
              (LETT |pa| (GETREFV_U32 (+ |n| 1) 0))
              (SEQ G190
                   (COND
                    ((NULL (NULL (SPADCALL |poli| (QREFELT % 21)))) (GO G191)))
                   (SEQ (LETT |m| (SPADCALL |poli| (QREFELT % 18)))
                        (LETT |nlc|
                              (SPADCALL (SPADCALL |poli| (QREFELT % 23)) |vars|
                                        |pts| |p| (QREFELT % 27)))
                        (SETELT_U32 |pa| |m| |nlc|)
                        (EXIT (LETT |poli| (SPADCALL |poli| (QREFELT % 28)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |pa|)))) 

(SDEFUN |MODHP;VSUPPI_to_VPA;VLLIV;3|
        ((|vps|
          (|Vector| (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|)))))
         (|vars| (|List| (|Symbol|))) (|pts| (|List| (|Integer|)))
         (|p| (|Integer|)) (% (|Vector| (|U32Vector|))))
        (SPROG
         ((|m| (|NonNegativeInteger|)) (|vpa| (|Vector| (|U32Vector|)))
          (|i| NIL) (#1=#:G47 NIL))
         (SEQ (LETT |m| (QVSIZE |vps|))
              (LETT |vpa| (MAKEARR1 |m| (GETREFV_U32 0 0)))
              (SEQ (LETT |i| 1) (LETT #1# |m|) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |vpa| |i|
                               (|MODHP;SUPPI_to_PA|
                                (SPADCALL |vps| |i| (QREFELT % 30)) |vars|
                                |pts| |p| %)
                               (QREFELT % 14))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |vpa|)))) 

(SDEFUN |MODHP;LLFI_to_LPA;L2IU;4|
        ((|llfi| (|List| (|List| (|Fraction| (|Integer|))))) (|n| (|Integer|))
         (|prime| (|Integer|)) (% (|Union| (|List| (|U32Vector|)) "failed")))
        (SPROG
         ((|lfi| NIL) (#1=#:G64 NIL) (|nn| (|Integer|)) (|pa| (|U32Vector|))
          (|el| NIL) (#2=#:G66 NIL) (|j| NIL) (#3=#:G65 NIL)
          (|nm| #4=(|Integer|)) (|dm| #4#) (#5=#:G63 NIL)
          (|dms| (|SingleInteger|)) (|nlc| (|Integer|))
          (|resl| (|List| (|U32Vector|))))
         (SEQ
          (EXIT
           (SEQ (LETT |resl| NIL)
                (SEQ (LETT |lfi| NIL) (LETT #1# |llfi|) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |lfi| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |nn| (COND ((> |n| 0) |n|) ('T (LENGTH |lfi|))))
                      (LETT |pa| (GETREFV_U32 |nn| 0))
                      (SEQ (LETT |el| NIL) (LETT #2# |lfi|) (LETT |j| 0)
                           (LETT #3# (- |nn| 1)) G190
                           (COND
                            ((OR (|greater_SI| |j| #3#) (ATOM #2#)
                                 (PROGN (LETT |el| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ
                            (LETT |nm|
                                  (SPADCALL (SPADCALL |el| (QREFELT % 35))
                                            |prime| (QREFELT % 36)))
                            (LETT |dm|
                                  (SPADCALL (SPADCALL |el| (QREFELT % 37))
                                            |prime| (QREFELT % 36)))
                            (EXIT
                             (COND
                              ((EQL |dm| 0)
                               (PROGN
                                (LETT #5# (CONS 1 "failed"))
                                (GO #6=#:G62)))
                              ('T
                               (SEQ (LETT |dms| |dm|)
                                    (LETT |nlc|
                                          (QSMULMOD32 |nm|
                                                      (SPADCALL |dms| |prime|
                                                                (QREFELT % 39))
                                                      |prime|))
                                    (EXIT (SETELT_U32 |pa| |j| |nlc|)))))))
                           (LETT |j|
                                 (PROG1 (|inc_SI| |j|) (LETT #2# (CDR #2#))))
                           (GO G190) G191 (EXIT NIL))
                      (EXIT (LETT |resl| (CONS |pa| |resl|))))
                     (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 (NREVERSE |resl|)))))
          #6# (EXIT #5#)))) 

(SDEFUN |MODHP;LLFPI_to_LPA;LILLIU;5|
        ((|llfi| (|List| (|List| (|Fraction| (|Polynomial| (|Integer|))))))
         (|n| (|Integer|)) (|vars| (|List| (|Symbol|)))
         (|pts| (|List| (|Integer|))) (|prime| (|Integer|))
         (% (|Union| (|List| (|U32Vector|)) "failed")))
        (SPROG
         ((|lfi| NIL) (#1=#:G80 NIL) (|pa| (|U32Vector|)) (|el| NIL)
          (#2=#:G82 NIL) (|j| NIL) (#3=#:G81 NIL) (|nm| #4=(|Integer|))
          (|dm| #4#) (#5=#:G79 NIL) (|dms| (|SingleInteger|))
          (|nlc| (|Integer|)) (|resl| (|List| (|U32Vector|))))
         (SEQ
          (EXIT
           (SEQ (LETT |resl| NIL)
                (SEQ (LETT |lfi| NIL) (LETT #1# |llfi|) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |lfi| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ (LETT |pa| (GETREFV_U32 |n| 0))
                          (SEQ (LETT |el| NIL) (LETT #2# |lfi|) (LETT |j| 0)
                               (LETT #3# (- |n| 1)) G190
                               (COND
                                ((OR (|greater_SI| |j| #3#) (ATOM #2#)
                                     (PROGN (LETT |el| (CAR #2#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (LETT |nm|
                                      (SPADCALL (SPADCALL |el| (QREFELT % 45))
                                                |vars| |pts| |prime|
                                                (QREFELT % 27)))
                                (LETT |dm|
                                      (SPADCALL (SPADCALL |el| (QREFELT % 46))
                                                |vars| |pts| |prime|
                                                (QREFELT % 27)))
                                (EXIT
                                 (COND
                                  ((EQL |dm| 0)
                                   (PROGN
                                    (LETT #5# (CONS 1 "failed"))
                                    (GO #6=#:G78)))
                                  ('T
                                   (SEQ (LETT |dms| |dm|)
                                        (LETT |nlc|
                                              (QSMULMOD32 |nm|
                                                          (SPADCALL |dms|
                                                                    |prime|
                                                                    (QREFELT %
                                                                             39))
                                                          |prime|))
                                        (EXIT (SETELT_U32 |pa| |j| |nlc|)))))))
                               (LETT |j|
                                     (PROG1 (|inc_SI| |j|)
                                       (LETT #2# (CDR #2#))))
                               (GO G190) G191 (EXIT NIL))
                          (EXIT (LETT |resl| (CONS |pa| |resl|))))
                     (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 (NREVERSE |resl|)))))
          #6# (EXIT #5#)))) 

(SDEFUN |MODHP;PPFtoPA|
        ((|pfi| (|SparseUnivariatePolynomial| (|Integer|)))
         (|sigma| (|NonNegativeInteger|)) (|psi| (|SingleInteger|))
         (% (|Union| (|U32Vector|) "failed")))
        (SPROG
         ((|pa| (|U32Vector|)) (|prime| (|Integer|))
          (|m| (|NonNegativeInteger|)) (|nlcq| (|Integer|)) (|nc| (|Integer|)))
         (SEQ (LETT |pa| (GETREFV_U32 |sigma| 0)) (LETT |prime| |psi|)
              (SEQ G190
                   (COND
                    ((NULL (NULL (SPADCALL |pfi| (QREFELT % 51)))) (GO G191)))
                   (SEQ (LETT |m| (SPADCALL |pfi| (QREFELT % 52)))
                        (COND
                         ((< |m| |sigma|)
                          (SEQ (LETT |nlcq| (SPADCALL |pfi| (QREFELT % 53)))
                               (LETT |nc|
                                     (SPADCALL |nlcq| |prime| (QREFELT % 36)))
                               (EXIT (SETELT_U32 |pa| |m| |nc|)))))
                        (EXIT (LETT |pfi| (SPADCALL |pfi| (QREFELT % 54)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT (CONS 0 |pa|))))) 

(SDEFUN |MODHP;LPPFtoVPA|
        ((|lpi| (|List| (|SparseUnivariatePolynomial| (|Integer|))))
         (|sigma| (|NonNegativeInteger|)) (|psi| (|SingleInteger|))
         (% (|Union| (|Vector| (|U32Vector|)) "failed")))
        (SPROG
         ((|m| (|NonNegativeInteger|)) (|vpa| (|Vector| (|U32Vector|)))
          (|p| NIL) (#1=#:G103 NIL) (|i| NIL) (#2=#:G102 NIL)
          (|vpp| (|Union| (|U32Vector|) "failed")) (#3=#:G101 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |m| (LENGTH |lpi|))
                (LETT |vpa| (MAKEARR1 |m| (GETREFV_U32 0 0)))
                (SEQ (LETT |p| NIL) (LETT #1# |lpi|) (LETT |i| 1)
                     (LETT #2# |m|) G190
                     (COND
                      ((OR (|greater_SI| |i| #2#) (ATOM #1#)
                           (PROGN (LETT |p| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ (LETT |vpp| (|MODHP;PPFtoPA| |p| |sigma| |psi| %))
                          (EXIT
                           (COND
                            ((QEQCAR |vpp| 1)
                             (PROGN
                              (LETT #3# (CONS 1 "failed"))
                              (GO #4=#:G100)))
                            ('T
                             (SPADCALL |vpa| |i| (QCDR |vpp|)
                                       (QREFELT % 14))))))
                     (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #1# (CDR #1#))))
                     (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 |vpa|))))
          #4# (EXIT #3#)))) 

(SDEFUN |MODHP;intpoly_to_PFI|
        ((|p| (|SparseUnivariatePolynomial| (|Integer|)))
         (% (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
        (SPADCALL (ELT % 55) |p| (QREFELT % 59))) 

(SDEFUN |MODHP;check_sol1a;VLM3IUv;9|
        ((|nres| (|Vector| (|U32Vector|))) (|gv0| (|List| (|U32Vector|)))
         (|gen|
          (|Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
                     (|Integer|) (|Integer|)))
         (|sigma| (|Integer|)) (|qval| (|Integer|)) (|p| (|Integer|))
         (% (|U32Vector|)))
        (SPROG
         ((|m| (|NonNegativeInteger|)) (|gvp| (|Vector| (|U32Vector|)))
          (|res| (|U32Vector|)) (|i| NIL) (#1=#:G111 NIL))
         (SEQ (LETT |m| (QVSIZE |nres|))
              (LETT |gvp| (SPADCALL |gv0| |p| |qval| |gen|))
              (LETT |res| (GETREFV_U32 |sigma| 0))
              (SEQ (LETT |i| 1) (LETT #1# |m|) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL (SPADCALL |gvp| |i| (QREFELT % 60))
                               (SPADCALL |nres| |i| (QREFELT % 60)) |res|
                               (- |sigma| 1) |p| (QREFELT % 63))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |MODHP;HP_solve_I;LLSNniMMU;10|
        ((|list| (|List| (|List| (|Fraction| (|Integer|)))))
         (|degs| (|List| (|Integer|))) (|kind| (|Symbol|))
         (|sigma| (|NonNegativeInteger|))
         (|gen|
          (|Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
                     (|Integer|) (|Integer|)))
         (|check|
          (|Mapping| (|Union| #1="good" #2="reject" #3="no_solution")
                     (|List| (|SparseUnivariatePolynomial| (|Integer|)))))
         (%
          (|Union| (|Matrix| (|SparseUnivariatePolynomial| (|Integer|)))
                   (|Boolean|))))
        (SPROG
         ((|m| (|NonNegativeInteger|)) (|degs_sum| (|NonNegativeInteger|))
          (#4=#:G230 NIL) (|d| NIL) (#5=#:G231 NIL)
          (|ve| (|Vector| (|Integer|))) (|pts0| #6=(|U32Vector|))
          (#7=#:G232 NIL) (#8=#:G223 NIL) (|pts| (|U32Vector|))
          (|prime| (|Integer|)) (#9=#:G227 NIL) (|lp| (|List| (|Integer|)))
          (|ok| #10=(|Boolean|)) (|nprimes| (|Integer|))
          (|psi| (|SingleInteger|))
          (|gv0p| (|Union| (|List| (|U32Vector|)) "failed"))
          (|gv0| (|List| (|U32Vector|))) (|gv2| (|Vector| (|U32Vector|)))
          (|blr|
           (|Union|
            (|Record| (|:| |basis| #11=(|TwoDimensionalArray| (|U32Vector|)))
                      (|:| |defects| #12=(|Vector| (|Integer|)))
                      (|:| |cinds| #13=(|Vector| (|Integer|))))
            "no_solution"))
          (|rblr|
           (|Record| (|:| |basis| (|TwoDimensionalArray| (|U32Vector|)))
                     (|:| |defects| (|Vector| (|Integer|)))
                     (|:| |cinds| (|Vector| (|Integer|)))))
          (|bm| #11#) (|va| #12#) (|civ| #13#) (#14=#:G233 NIL)
          (|all_bad| (|Boolean|)) (|is_bad| #10#) (#15=#:G226 NIL)
          (|nsols| (|Integer|)) (|oldva| #12#) (|oldciv| #13#)
          (|rstate| (|VectorIntegerReconstructor|)) (#16=#:G158 NIL) (|rv| #6#)
          (#17=#:G234 NIL) (#18=#:G235 NIL) (|cp| (|U32Vector|))
          (#19=#:G236 NIL) (#20=#:G171 NIL) (|offsets| (|Vector| (|Integer|)))
          (#21=#:G237 NIL) (|empty_offsets| #10#)
          (|pp| (|Union| (|PrimitiveArray| (|Integer|)) "failed"))
          (#22=#:G228 NIL) (|ppr| (|PrimitiveArray| (|Integer|)))
          (#23=#:G183 NIL)
          (|resv|
           (|Vector| (|Vector| (|SparseUnivariatePolynomial| (|Integer|)))))
          (#24=#:G238 NIL)
          (|resvi| (|Vector| (|SparseUnivariatePolynomial| (|Integer|))))
          (|j| (|Integer|)) (#25=#:G239 NIL) (|mm| (|Integer|))
          (#26=#:G240 NIL) (|s| (|SparseUnivariatePolynomial| (|Integer|)))
          (|k| (|Integer|)) (|sol_okp| (|Union| #1# #2# #3#)) (#27=#:G224 NIL)
          (|sol_ok| #10#) (#28=#:G225 NIL) (|ii| (|Integer|)) (#29=#:G199 NIL)
          (|mress| (|Matrix| (|SparseUnivariatePolynomial| (|Integer|))))
          (|i| NIL) (#30=#:G241 NIL) (|l| NIL) (#31=#:G242 NIL)
          (#32=#:G229 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |lp| NIL)
                (COND
                 ((OR (EQUAL |kind| '|qdiffHP|) (EQUAL |kind| '|qshiftHP|))
                  (EXIT (CONS 1 'T))))
                (LETT |m| (LENGTH |degs|))
                (LETT |degs_sum|
                      (+ (SPADCALL (ELT % 67) |degs| (QREFELT % 69)) |m|))
                (LETT |ve|
                      (SPADCALL
                       (PROGN
                        (LETT #4# NIL)
                        (SEQ (LETT |d| NIL) (LETT #5# |degs|) G190
                             (COND
                              ((OR (ATOM #5#) (PROGN (LETT |d| (CAR #5#)) NIL))
                               (GO G191)))
                             (SEQ (EXIT (LETT #4# (CONS |d| #4#))))
                             (LETT #5# (CDR #5#)) (GO G190) G191
                             (EXIT (NREVERSE #4#))))
                       (QREFELT % 71)))
                (LETT |pts|
                      (COND ((EQUAL |kind| '|diffHP|) (GETREFV_U32 0 0))
                            ('T
                             (SEQ
                              (EXIT
                               (COND
                                ((EQUAL |kind| '|shiftHP|)
                                 (PROGN
                                  (LETT #8#
                                        (SEQ
                                         (LETT |pts0| (GETREFV_U32 |sigma| 0))
                                         (SEQ (LETT |i| 0)
                                              (LETT #7# (- |sigma| 1)) G190
                                              (COND
                                               ((|greater_SI| |i| #7#)
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (SETELT_U32 |pts0| |i| |i|)))
                                              (LETT |i| (|inc_SI| |i|))
                                              (GO G190) G191 (EXIT NIL))
                                         (EXIT |pts0|)))
                                  (GO #33=#:G128)))))
                              #33# (EXIT #8#)))))
                (LETT |nsols| -1) (LETT |nprimes| 0) (LETT |nsols| (+ |m| 1))
                (LETT |empty_offsets| 'T)
                (SEQ G190 NIL
                     (SEQ
                      (EXIT
                       (SEQ (LETT |ok| NIL)
                            (SEQ (LETT |k| 1) G190
                                 (COND
                                  ((OR (|greater_SI| |k| 100)
                                       (NULL (NULL |ok|)))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (SEQ
                                    (LETT |prime|
                                          (SPADCALL
                                           (+ (RANDOM 2000000) 2000000)
                                           (QREFELT % 74)))
                                    (EXIT
                                     (COND
                                      ((SPADCALL |prime| |lp| (QREFELT % 75))
                                       (PROGN
                                        (LETT #9# |$NoValue|)
                                        (GO #34=#:G131)))
                                      ('T
                                       (SEQ (LETT |lp| (CONS |prime| |lp|))
                                            (EXIT (LETT |ok| 'T))))))))
                                  #34# (EXIT #9#))
                                 (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT
                             (COND
                              (|ok|
                               (SEQ (LETT |nprimes| (+ |nprimes| 1))
                                    (LETT |psi|
                                          (SPADCALL |prime| (QREFELT % 76)))
                                    (LETT |gv0p|
                                          (SPADCALL |list| 0 |psi|
                                                    (QREFELT % 42)))
                                    (EXIT
                                     (COND
                                      ((QEQCAR |gv0p| 1)
                                       (PROGN
                                        (LETT #22# |$NoValue|)
                                        (GO #35=#:G130)))
                                      ('T
                                       (SEQ (LETT |gv0| (QCDR |gv0p|))
                                            (LETT |gv2|
                                                  (SPADCALL |gv0| |prime| 1
                                                            |gen|))
                                            (LETT |blr|
                                                  (SPADCALL |gv2| |ve| |sigma|
                                                            |pts| |prime|
                                                            |kind|
                                                            (QREFELT % 81)))
                                            (EXIT
                                             (COND
                                              ((QEQCAR |blr| 1)
                                               (PROGN
                                                (LETT #32# (CONS 1 NIL))
                                                (GO #36=#:G222)))
                                              ('T
                                               (SEQ (LETT |rblr| (QCDR |blr|))
                                                    (LETT |bm|
                                                          (QVELT |rblr| 0))
                                                    (LETT |va|
                                                          (QVELT |rblr| 1))
                                                    (LETT |civ|
                                                          (QVELT |rblr| 2))
                                                    (EXIT
                                                     (COND
                                                      ((> (QVSIZE |va|)
                                                          |nsols|)
                                                       (PROGN
                                                        (LETT #22# |$NoValue|)
                                                        (GO #35#)))
                                                      ('T
                                                       (SEQ (LETT |is_bad| NIL)
                                                            (LETT |all_bad|
                                                                  (<
                                                                   (QVSIZE
                                                                    |va|)
                                                                   |nsols|))
                                                            (COND
                                                             ((EQL
                                                               (QVSIZE |va|)
                                                               |nsols|)
                                                              (SEQ
                                                               (EXIT
                                                                (SEQ
                                                                 (LETT |i| 1)
                                                                 (LETT #14#
                                                                       |nsols|)
                                                                 G190
                                                                 (COND
                                                                  ((|greater_SI|
                                                                    |i| #14#)
                                                                   (GO G191)))
                                                                 (SEQ
                                                                  (EXIT
                                                                   (COND
                                                                    ((<
                                                                      (SPADCALL
                                                                       |va| |i|
                                                                       (QREFELT
                                                                        % 82))
                                                                      (SPADCALL
                                                                       |oldva|
                                                                       |i|
                                                                       (QREFELT
                                                                        % 82)))
                                                                     (SEQ
                                                                      (LETT
                                                                       |all_bad|
                                                                       'T)
                                                                      (EXIT
                                                                       (PROGN
                                                                        (LETT
                                                                         #15#
                                                                         1)
                                                                        (GO
                                                                         #37=#:G155)))))
                                                                    ((>
                                                                      (SPADCALL
                                                                       |va| |i|
                                                                       (QREFELT
                                                                        % 82))
                                                                      (SPADCALL
                                                                       |oldva|
                                                                       |i|
                                                                       (QREFELT
                                                                        % 82)))
                                                                     (SEQ
                                                                      (LETT
                                                                       |is_bad|
                                                                       'T)
                                                                      (EXIT
                                                                       (PROGN
                                                                        (LETT
                                                                         #15#
                                                                         1)
                                                                        (GO
                                                                         #37#)))))
                                                                    ((<
                                                                      (SPADCALL
                                                                       |civ|
                                                                       |i|
                                                                       (QREFELT
                                                                        % 82))
                                                                      (SPADCALL
                                                                       |oldciv|
                                                                       |i|
                                                                       (QREFELT
                                                                        % 82)))
                                                                     (SEQ
                                                                      (LETT
                                                                       |all_bad|
                                                                       'T)
                                                                      (EXIT
                                                                       (PROGN
                                                                        (LETT
                                                                         #15#
                                                                         1)
                                                                        (GO
                                                                         #37#)))))
                                                                    ((>
                                                                      (SPADCALL
                                                                       |civ|
                                                                       |i|
                                                                       (QREFELT
                                                                        % 82))
                                                                      (SPADCALL
                                                                       |oldciv|
                                                                       |i|
                                                                       (QREFELT
                                                                        % 82)))
                                                                     (SEQ
                                                                      (LETT
                                                                       |is_bad|
                                                                       'T)
                                                                      (EXIT
                                                                       (PROGN
                                                                        (LETT
                                                                         #15#
                                                                         1)
                                                                        (GO
                                                                         #37#))))))))
                                                                 (LETT |i|
                                                                       (|inc_SI|
                                                                        |i|))
                                                                 (GO G190) G191
                                                                 (EXIT NIL)))
                                                               #37#
                                                               (EXIT #15#))))
                                                            (EXIT
                                                             (COND
                                                              (|is_bad|
                                                               (PROGN
                                                                (LETT #22#
                                                                      |$NoValue|)
                                                                (GO #35#)))
                                                              ('T
                                                               (SEQ
                                                                (COND
                                                                 (|all_bad|
                                                                  (SEQ
                                                                   (LETT
                                                                    |nsols|
                                                                    (QVSIZE
                                                                     |va|))
                                                                   (LETT
                                                                    |oldva|
                                                                    |va|)
                                                                   (LETT
                                                                    |oldciv|
                                                                    |civ|)
                                                                   (LETT
                                                                    |rstate|
                                                                    (SPADCALL
                                                                     (* |nsols|
                                                                        |degs_sum|)
                                                                     (QREFELT %
                                                                              84)))
                                                                   (LETT |rv|
                                                                         (GETREFV_U32
                                                                          (*
                                                                           (PROG1
                                                                               (LETT
                                                                                #16#
                                                                                |nsols|)
                                                                             (|check_subtype2|
                                                                              (>
                                                                               #16#
                                                                               0)
                                                                              '(|PositiveInteger|)
                                                                              '(|Integer|)
                                                                              #16#))
                                                                           |degs_sum|)
                                                                          0))
                                                                   (EXIT
                                                                    (LETT
                                                                     |empty_offsets|
                                                                     'T)))))
                                                                (LETT |k| 0)
                                                                (COND
                                                                 ((EQL
                                                                   (SPADCALL
                                                                    |nprimes|
                                                                    100
                                                                    (QREFELT %
                                                                             36))
                                                                   0)
                                                                  (SEQ
                                                                   (SPADCALL
                                                                    (SPADCALL
                                                                     "number of primes"
                                                                     (QREFELT %
                                                                              87))
                                                                    (QREFELT %
                                                                             89))
                                                                   (EXIT
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      |nprimes|
                                                                      (QREFELT
                                                                       % 90))
                                                                     (QREFELT %
                                                                              89))))))
                                                                (SEQ
                                                                 (LETT |i| 1)
                                                                 (LETT #17#
                                                                       |nsols|)
                                                                 G190
                                                                 (COND
                                                                  ((|greater_SI|
                                                                    |i| #17#)
                                                                   (GO G191)))
                                                                 (SEQ
                                                                  (EXIT
                                                                   (SEQ
                                                                    (LETT |j|
                                                                          1)
                                                                    (LETT #18#
                                                                          |m|)
                                                                    G190
                                                                    (COND
                                                                     ((|greater_SI|
                                                                       |j|
                                                                       #18#)
                                                                      (GO
                                                                       G191)))
                                                                    (SEQ
                                                                     (LETT |mm|
                                                                           (SPADCALL
                                                                            |ve|
                                                                            |j|
                                                                            (QREFELT
                                                                             %
                                                                             82)))
                                                                     (LETT |cp|
                                                                           (SPADCALL
                                                                            |bm|
                                                                            |i|
                                                                            |j|
                                                                            (QREFELT
                                                                             %
                                                                             92)))
                                                                     (EXIT
                                                                      (SEQ
                                                                       (LETT
                                                                        |l| 0)
                                                                       (LETT
                                                                        #19#
                                                                        |mm|)
                                                                       G190
                                                                       (COND
                                                                        ((|greater_SI|
                                                                          |l|
                                                                          #19#)
                                                                         (GO
                                                                          G191)))
                                                                       (SEQ
                                                                        (SETELT_U32
                                                                         |rv|
                                                                         |k|
                                                                         (ELT_U32
                                                                          |cp|
                                                                          |l|))
                                                                        (EXIT
                                                                         (LETT
                                                                          |k|
                                                                          (+
                                                                           |k|
                                                                           1))))
                                                                       (LETT
                                                                        |l|
                                                                        (|inc_SI|
                                                                         |l|))
                                                                       (GO
                                                                        G190)
                                                                       G191
                                                                       (EXIT
                                                                        NIL))))
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
                                                                (SPADCALL |rv|
                                                                          |prime|
                                                                          |rstate|
                                                                          (QREFELT
                                                                           %
                                                                           93))
                                                                (COND
                                                                 (|empty_offsets|
                                                                  (SEQ
                                                                   (LETT
                                                                    |offsets|
                                                                    (MAKEARR1
                                                                     (PROG1
                                                                         (LETT
                                                                          #20#
                                                                          |nsols|)
                                                                       (|check_subtype2|
                                                                        (>=
                                                                         #20#
                                                                         0)
                                                                        '(|NonNegativeInteger|)
                                                                        '(|Integer|)
                                                                        #20#))
                                                                     0))
                                                                   (LETT |j| 0)
                                                                   (SEQ
                                                                    (LETT |i|
                                                                          1)
                                                                    (LETT #21#
                                                                          |nsols|)
                                                                    G190
                                                                    (COND
                                                                     ((|greater_SI|
                                                                       |i|
                                                                       #21#)
                                                                      (GO
                                                                       G191)))
                                                                    (SEQ
                                                                     (SPADCALL
                                                                      |offsets|
                                                                      |i| |j|
                                                                      (QREFELT
                                                                       % 94))
                                                                     (EXIT
                                                                      (LETT |j|
                                                                            (+
                                                                             |j|
                                                                             |degs_sum|))))
                                                                    (LETT |i|
                                                                          (|inc_SI|
                                                                           |i|))
                                                                    (GO G190)
                                                                    G191
                                                                    (EXIT NIL))
                                                                   (EXIT
                                                                    (LETT
                                                                     |empty_offsets|
                                                                     NIL)))))
                                                                (LETT |pp|
                                                                      (SPADCALL
                                                                       |rstate|
                                                                       |offsets|
                                                                       (QREFELT
                                                                        % 96)))
                                                                (EXIT
                                                                 (COND
                                                                  ((QEQCAR |pp|
                                                                           1)
                                                                   (PROGN
                                                                    (LETT #22#
                                                                          |$NoValue|)
                                                                    (GO #35#)))
                                                                  ('T
                                                                   (SEQ
                                                                    (LETT |ppr|
                                                                          (QCDR
                                                                           |pp|))
                                                                    (LETT |k|
                                                                          0)
                                                                    (LETT
                                                                     |resv|
                                                                     (MAKEARR1
                                                                      (PROG1
                                                                          (LETT
                                                                           #23#
                                                                           |nsols|)
                                                                        (|check_subtype2|
                                                                         (>=
                                                                          #23#
                                                                          0)
                                                                         '(|NonNegativeInteger|)
                                                                         '(|Integer|)
                                                                         #23#))
                                                                      (MAKE-ARRAY
                                                                       0)))
                                                                    (LETT |ii|
                                                                          1)
                                                                    (LETT
                                                                     |sol_ok|
                                                                     'T)
                                                                    (SEQ
                                                                     (EXIT
                                                                      (SEQ
                                                                       (LETT
                                                                        |i| 1)
                                                                       (LETT
                                                                        #24#
                                                                        |nsols|)
                                                                       G190
                                                                       (COND
                                                                        ((|greater_SI|
                                                                          |i|
                                                                          #24#)
                                                                         (GO
                                                                          G191)))
                                                                       (SEQ
                                                                        (EXIT
                                                                         (SEQ
                                                                          (LETT
                                                                           |resvi|
                                                                           (MAKEARR1
                                                                            |m|
                                                                            (|spadConstant|
                                                                             %
                                                                             50)))
                                                                          (SEQ
                                                                           (LETT
                                                                            |j|
                                                                            1)
                                                                           (LETT
                                                                            #25#
                                                                            |m|)
                                                                           G190
                                                                           (COND
                                                                            ((|greater_SI|
                                                                              |j|
                                                                              #25#)
                                                                             (GO
                                                                              G191)))
                                                                           (SEQ
                                                                            (LETT
                                                                             |mm|
                                                                             (SPADCALL
                                                                              |ve|
                                                                              |j|
                                                                              (QREFELT
                                                                               %
                                                                               82)))
                                                                            (LETT
                                                                             |s|
                                                                             (|spadConstant|
                                                                              %
                                                                              50))
                                                                            (SEQ
                                                                             (LETT
                                                                              |l|
                                                                              0)
                                                                             (LETT
                                                                              #26#
                                                                              |mm|)
                                                                             G190
                                                                             (COND
                                                                              ((|greater_SI|
                                                                                |l|
                                                                                #26#)
                                                                               (GO
                                                                                G191)))
                                                                             (SEQ
                                                                              (LETT
                                                                               |s|
                                                                               (SPADCALL
                                                                                |s|
                                                                                (SPADCALL
                                                                                 (QAREF1
                                                                                  |ppr|
                                                                                  |k|)
                                                                                 |l|
                                                                                 (QREFELT
                                                                                  %
                                                                                  97))
                                                                                (QREFELT
                                                                                 %
                                                                                 98)))
                                                                              (EXIT
                                                                               (LETT
                                                                                |k|
                                                                                (+
                                                                                 |k|
                                                                                 1))))
                                                                             (LETT
                                                                              |l|
                                                                              (|inc_SI|
                                                                               |l|))
                                                                             (GO
                                                                              G190)
                                                                             G191
                                                                             (EXIT
                                                                              NIL))
                                                                            (EXIT
                                                                             (SPADCALL
                                                                              |resvi|
                                                                              |j|
                                                                              |s|
                                                                              (QREFELT
                                                                               %
                                                                               99))))
                                                                           (LETT
                                                                            |j|
                                                                            (|inc_SI|
                                                                             |j|))
                                                                           (GO
                                                                            G190)
                                                                           G191
                                                                           (EXIT
                                                                            NIL))
                                                                          (LETT
                                                                           |sol_okp|
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             |resvi|
                                                                             (QREFELT
                                                                              %
                                                                              101))
                                                                            |check|))
                                                                          (EXIT
                                                                           (COND
                                                                            ((QEQCAR
                                                                              |sol_okp|
                                                                              1)
                                                                             (PROGN
                                                                              (LETT
                                                                               #27#
                                                                               |$NoValue|)
                                                                              (GO
                                                                               #38=#:G184)))
                                                                            ((QEQCAR
                                                                              |sol_okp|
                                                                              2)
                                                                             (SEQ
                                                                              (LETT
                                                                               |sol_ok|
                                                                               NIL)
                                                                              (EXIT
                                                                               (PROGN
                                                                                (LETT
                                                                                 #28#
                                                                                 |$NoValue|)
                                                                                (GO
                                                                                 #39=#:G198)))))
                                                                            ('T
                                                                             (SEQ
                                                                              (SPADCALL
                                                                               |resv|
                                                                               |ii|
                                                                               |resvi|
                                                                               (QREFELT
                                                                                %
                                                                                103))
                                                                              (EXIT
                                                                               (LETT
                                                                                |ii|
                                                                                (+
                                                                                 |ii|
                                                                                 1)))))))))
                                                                        #38#
                                                                        (EXIT
                                                                         #27#))
                                                                       (LETT
                                                                        |i|
                                                                        (|inc_SI|
                                                                         |i|))
                                                                       (GO
                                                                        G190)
                                                                       G191
                                                                       (EXIT
                                                                        NIL)))
                                                                     #39#
                                                                     (EXIT
                                                                      #28#))
                                                                    (EXIT
                                                                     (COND
                                                                      (|sol_ok|
                                                                       (SEQ
                                                                        (LETT
                                                                         |mress|
                                                                         (MAKE_MATRIX1
                                                                          |m|
                                                                          (PROG1
                                                                              (LETT
                                                                               #29#
                                                                               (-
                                                                                |ii|
                                                                                1))
                                                                            (|check_subtype2|
                                                                             (>=
                                                                              #29#
                                                                              0)
                                                                             '(|NonNegativeInteger|)
                                                                             '(|Integer|)
                                                                             #29#))
                                                                          (|spadConstant|
                                                                           %
                                                                           50)))
                                                                        (SEQ
                                                                         (LETT
                                                                          |i|
                                                                          1)
                                                                         (LETT
                                                                          #30#
                                                                          (-
                                                                           |ii|
                                                                           1))
                                                                         G190
                                                                         (COND
                                                                          ((|greater_SI|
                                                                            |i|
                                                                            #30#)
                                                                           (GO
                                                                            G191)))
                                                                         (SEQ
                                                                          (EXIT
                                                                           (SEQ
                                                                            (LETT
                                                                             |l|
                                                                             1)
                                                                            (LETT
                                                                             #31#
                                                                             |m|)
                                                                            G190
                                                                            (COND
                                                                             ((|greater_SI|
                                                                               |l|
                                                                               #31#)
                                                                              (GO
                                                                               G191)))
                                                                            (SEQ
                                                                             (EXIT
                                                                              (SPADCALL
                                                                               |mress|
                                                                               |l|
                                                                               |i|
                                                                               (SPADCALL
                                                                                (SPADCALL
                                                                                 |resv|
                                                                                 |i|
                                                                                 (QREFELT
                                                                                  %
                                                                                  104))
                                                                                |l|
                                                                                (QREFELT
                                                                                 %
                                                                                 9))
                                                                               (QREFELT
                                                                                %
                                                                                106))))
                                                                            (LETT
                                                                             |l|
                                                                             (|inc_SI|
                                                                              |l|))
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
                                                                        (EXIT
                                                                         (PROGN
                                                                          (LETT
                                                                           #32#
                                                                           (CONS
                                                                            0
                                                                            |mress|))
                                                                          (GO
                                                                           #36#)))))))))))))))))))))))))))))
                              ('T (|error| "Run out of primes"))))))
                      #35# (EXIT #22#))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT (PROGN (LETT #32# (CONS 1 'T)) (GO #36#)))))
          #36# (EXIT #32#)))) 

(SDEFUN |MODHP;get_variables2|
        ((|llpi| (|List| (|List| (|Fraction| (|Polynomial| (|Integer|))))))
         (% (|List| (|Symbol|))))
        (SPROG
         ((|lpi| NIL) (#1=#:G250 NIL) (|p| NIL) (#2=#:G251 NIL)
          (|res| (|List| (|Symbol|))))
         (SEQ (LETT |res| NIL)
              (SEQ (LETT |lpi| NIL) (LETT #1# |llpi|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |lpi| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |p| NIL) (LETT #2# |lpi|) G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ
                           (LETT |res|
                                 (SPADCALL |res|
                                           (SPADCALL
                                            (SPADCALL |p| (QREFELT % 45))
                                            (QREFELT % 111))
                                           (QREFELT % 112)))
                           (EXIT
                            (LETT |res|
                                  (SPADCALL |res|
                                            (SPADCALL
                                             (SPADCALL |p| (QREFELT % 46))
                                             (QREFELT % 111))
                                            (QREFELT % 112)))))
                          (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |MODHP;unpack_poly;LSevPa2ISup;12|
        ((|vars| (|List| (|Symbol|))) (|exps| (|SortedExponentVector|))
         (|coeffs| (|PrimitiveArray| (|Integer|))) (|lo| (|Integer|))
         (|hi| (|Integer|))
         (% (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|)))))
        (SPROG
         ((|nvars| (|NonNegativeInteger|)) (|nn| (|NonNegativeInteger|))
          (|i0| NIL) (#1=#:G268 NIL) (|jj| (|Integer|)) (#2=#:G254 NIL)
          (|j| (|Integer|)) (|var| NIL) (#3=#:G270 NIL) (|k| NIL)
          (#4=#:G269 NIL) (#5=#:G259 NIL) (|term1| (|Polynomial| (|Integer|)))
          (|term| (|Polynomial| (|Integer|))) (|i| (|Integer|)) (#6=#:G265 NIL)
          (|res| (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|)))))
         (SEQ (LETT |res| (|spadConstant| % 113))
              (LETT |nvars| (LENGTH |vars|)) (LETT |nn| (+ |nvars| 1))
              (LETT |vars| (REVERSE |vars|)) (LETT |j| -1)
              (LETT |i| (* |lo| |nn|))
              (SEQ (LETT |i0| |lo|) (LETT #1# |hi|) G190
                   (COND ((> |i0| #1#) (GO G191)))
                   (SEQ (LETT |jj| (ELT_U32 |exps| |i|))
                        (EXIT
                         (COND
                          ((< |jj| |j|)
                           (|error|
                            "Internal error: inconsistent exponent vector"))
                          ('T
                           (SEQ
                            (COND
                             ((> |jj| |j|)
                              (SEQ
                               (COND
                                ((>= |j| 0)
                                 (LETT |res|
                                       (SPADCALL |res|
                                                 (SPADCALL |term|
                                                           (PROG1
                                                               (LETT #2# |j|)
                                                             (|check_subtype2|
                                                              (>= #2# 0)
                                                              '(|NonNegativeInteger|)
                                                              '(|Integer|)
                                                              #2#))
                                                           (QREFELT % 114))
                                                 (QREFELT % 115)))))
                               (LETT |j| |jj|)
                               (EXIT (LETT |term| (|spadConstant| % 116))))))
                            (LETT |term1|
                                  (SPADCALL (QAREF1 |coeffs| |i0|)
                                            (QREFELT % 117)))
                            (SEQ (LETT |var| NIL) (LETT #3# |vars|)
                                 (LETT |k| 1) (LETT #4# |nvars|) G190
                                 (COND
                                  ((OR (|greater_SI| |k| #4#) (ATOM #3#)
                                       (PROGN (LETT |var| (CAR #3#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT |term1|
                                         (SPADCALL |term1|
                                                   (SPADCALL
                                                    (|spadConstant| % 118)
                                                    |var|
                                                    (PROG1
                                                        (LETT #5#
                                                              (ELT_U32 |exps|
                                                                       (+ |i|
                                                                          |k|)))
                                                      (|check_subtype2|
                                                       (>= #5# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #5#))
                                                    (QREFELT % 119))
                                                   (QREFELT % 120)))))
                                 (LETT |k|
                                       (PROG1 (|inc_SI| |k|)
                                         (LETT #3# (CDR #3#))))
                                 (GO G190) G191 (EXIT NIL))
                            (LETT |term|
                                  (SPADCALL |term1| |term| (QREFELT % 121)))
                            (EXIT (LETT |i| (+ |i| |nn|))))))))
                   (LETT |i0| (+ |i0| 1)) (GO G190) G191 (EXIT NIL))
              (COND
               ((>= |j| 0)
                (LETT |res|
                      (SPADCALL |res|
                                (SPADCALL |term|
                                          (PROG1 (LETT #6# |j|)
                                            (|check_subtype2| (>= #6# 0)
                                                              '(|NonNegativeInteger|)
                                                              '(|Integer|)
                                                              #6#))
                                          (QREFELT % 114))
                                (QREFELT % 115)))))
              (EXIT |res|)))) 

(SDEFUN |MODHP;intpoly_to_PFPI|
        ((|p| (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|))))
         (%
          (|SparseUnivariatePolynomial|
           (|Fraction| (|Polynomial| (|Integer|))))))
        (SPADCALL (ELT % 125) |p| (QREFELT % 129))) 

(SDEFUN |MODHP;PFPI_to_PFI|
        ((|p|
          (|SparseUnivariatePolynomial|
           (|Fraction| (|Polynomial| (|Integer|)))))
         (% (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
        (SPROG
         ((|m| (|NonNegativeInteger|))
          (|q| (|Fraction| (|Polynomial| (|Integer|))))
          (|iq| (|Fraction| (|Integer|)))
          (|res| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|)))))
         (SEQ (LETT |res| (|spadConstant| % 72))
              (SEQ G190
                   (COND
                    ((NULL (NULL (SPADCALL |p| (QREFELT % 130)))) (GO G191)))
                   (SEQ (LETT |m| (SPADCALL |p| (QREFELT % 131)))
                        (LETT |q| (SPADCALL |p| (QREFELT % 132)))
                        (LETT |p| (SPADCALL |p| (QREFELT % 133)))
                        (LETT |iq| (SPADCALL |q| (QREFELT % 134)))
                        (EXIT
                         (LETT |res|
                               (SPADCALL (SPADCALL |iq| |m| (QREFELT % 135))
                                         |res| (QREFELT % 136)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |MODHP;PI_to_PPI|
        ((|p| (|SparseUnivariatePolynomial| (|Integer|)))
         (% (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|)))))
        (SPROG
         ((|m| (|NonNegativeInteger|)) (|q| (|Integer|))
          (|mq| (|Polynomial| (|Integer|)))
          (|res| (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|)))))
         (SEQ (LETT |res| (|spadConstant| % 113))
              (SEQ G190
                   (COND
                    ((NULL (NULL (SPADCALL |p| (QREFELT % 51)))) (GO G191)))
                   (SEQ (LETT |m| (SPADCALL |p| (QREFELT % 52)))
                        (LETT |q| (SPADCALL |p| (QREFELT % 53)))
                        (LETT |p| (SPADCALL |p| (QREFELT % 54)))
                        (LETT |mq| (SPADCALL |q| (QREFELT % 117)))
                        (EXIT
                         (LETT |res|
                               (SPADCALL (SPADCALL |mq| |m| (QREFELT % 114))
                                         |res| (QREFELT % 115)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |MODHP;LPI_to_LPPI|
        ((|lp| (|List| (|SparseUnivariatePolynomial| (|Integer|))))
         (%
          (|List| (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|))))))
        (SPROG ((#1=#:G288 NIL) (|p| NIL) (#2=#:G289 NIL))
               (SEQ
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |p| NIL) (LETT #2# |lp|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT (LETT #1# (CONS (|MODHP;PI_to_PPI| |p| %) #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#))))))) 

(SDEFUN |MODHP;trivial_poly_solve|
        ((|list| (|List| (|List| (|Fraction| (|Polynomial| (|Integer|))))))
         (|degs| (|List| (|Integer|))) (|kind| (|Symbol|))
         (|sigma| (|NonNegativeInteger|))
         (|gen|
          (|Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
                     (|Integer|) (|Integer|)))
         (|check|
          (|Mapping| (|Union| "good" "reject" "no_solution")
                     (|List|
                      (|SparseUnivariatePolynomial|
                       (|Polynomial| (|Integer|))))))
         (%
          (|Union|
           (|Matrix| (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|))))
           (|Boolean|))))
        (SPROG
         ((#1=#:G318 NIL) (|li| NIL) (#2=#:G319 NIL) (#3=#:G320 NIL) (|q| NIL)
          (#4=#:G321 NIL) (|nlist| (|List| (|List| (|Fraction| (|Integer|)))))
          (|pres|
           (|Union| (|Matrix| (|SparseUnivariatePolynomial| (|Integer|)))
                    (|Boolean|)))
          (#5=#:G317 NIL)
          (|resi| (|Matrix| (|SparseUnivariatePolynomial| (|Integer|))))
          (|nr| (|NonNegativeInteger|)) (|nc| (|NonNegativeInteger|))
          (|res|
           (|Matrix|
            (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|)))))
          (|i| NIL) (#6=#:G322 NIL) (|j| NIL) (#7=#:G323 NIL))
         (SEQ
          (EXIT
           (COND
            ((EQUAL |kind| '|qshiftHP|)
             (PROGN (LETT #5# (CONS 1 'T)) (GO #8=#:G316)))
            (#9='T
             (SEQ (COND ((EQUAL |kind| '|qdiffHP|) (LETT |kind| '|diffHP|)))
                  (LETT |nlist|
                        (PROGN
                         (LETT #1# NIL)
                         (SEQ (LETT |li| NIL) (LETT #2# |list|) G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |li| (CAR #2#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #1#
                                      (CONS
                                       (PROGN
                                        (LETT #3# NIL)
                                        (SEQ (LETT |q| NIL) (LETT #4# |li|)
                                             G190
                                             (COND
                                              ((OR (ATOM #4#)
                                                   (PROGN
                                                    (LETT |q| (CAR #4#))
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT #3#
                                                     (CONS
                                                      (SPADCALL |q|
                                                                (QREFELT %
                                                                         134))
                                                      #3#))))
                                             (LETT #4# (CDR #4#)) (GO G190)
                                             G191 (EXIT (NREVERSE #3#))))
                                       #1#))))
                              (LETT #2# (CDR #2#)) (GO G190) G191
                              (EXIT (NREVERSE #1#)))))
                  (LETT |pres|
                        (SPADCALL |nlist| |degs| |kind| |sigma| |gen|
                                  (CONS #'|MODHP;trivial_poly_solve!0|
                                        (VECTOR |check| %))
                                  (QREFELT % 110)))
                  (EXIT
                   (COND
                    ((QEQCAR |pres| 1)
                     (PROGN (LETT #5# (CONS 1 (QCDR |pres|))) (GO #8#)))
                    (#9#
                     (SEQ (LETT |resi| (QCDR |pres|))
                          (LETT |nr| (ANROWS |resi|))
                          (LETT |nc| (ANCOLS |resi|))
                          (LETT |res|
                                (MAKE_MATRIX1 |nr| |nc|
                                              (|spadConstant| % 113)))
                          (SEQ (LETT |i| 1) (LETT #6# |nr|) G190
                               (COND ((|greater_SI| |i| #6#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (SEQ (LETT |j| 1) (LETT #7# |nc|) G190
                                      (COND ((|greater_SI| |j| #7#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SPADCALL |res| |i| |j|
                                                  (|MODHP;PI_to_PPI|
                                                   (SPADCALL |resi| |i| |j|
                                                             (QREFELT % 138))
                                                   %)
                                                  (QREFELT % 140))))
                                      (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                      (EXIT NIL))))
                               (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                               (EXIT NIL))
                          (EXIT (CONS 0 |res|))))))))))
          #8# (EXIT #5#)))) 

(SDEFUN |MODHP;trivial_poly_solve!0| ((|x| NIL) ($$ NIL))
        (PROG (% |check|)
          (LETT % (QREFELT $$ 1))
          (LETT |check| (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL (|MODHP;LPI_to_LPPI| |x| %) |check|))))) 

(SDEFUN |MODHP;get_variables;L2SL;18|
        ((|list| (|List| (|List| (|Fraction| (|Polynomial| (|Integer|))))))
         (|kind| (|Symbol|)) (|qvar| (|Symbol|)) (% (|List| (|Symbol|))))
        (SPROG ((|vars| (|List| (|Symbol|))))
               (SEQ (LETT |vars| (|MODHP;get_variables2| |list| %))
                    (COND
                     ((OR (EQUAL |kind| '|qdiffHP|)
                          (OR (EQUAL |kind| '|qshiftHP|)
                              (EQUAL |kind| '|qmixed|)))
                      (LETT |vars|
                            (COND
                             ((SPADCALL |qvar| |vars| (QREFELT % 141)) |vars|)
                             ('T (CONS |qvar| |vars|))))))
                    (EXIT (SPADCALL |vars| (QREFELT % 142)))))) 

(SDEFUN |MODHP;HP_solve_P;LL2SNniMMU;19|
        ((|list| (|List| (|List| (|Fraction| (|Polynomial| (|Integer|))))))
         (|degs| (|List| (|Integer|))) (|kind| (|Symbol|)) (|qvar| (|Symbol|))
         (|sigma| (|NonNegativeInteger|))
         (|gen|
          (|Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
                     (|Integer|) (|Integer|)))
         (|check|
          (|Mapping| #1=(|Union| "good" "reject" "no_solution")
                     (|List|
                      (|SparseUnivariatePolynomial|
                       (|Polynomial| (|Integer|))))))
         (%
          (|Union|
           (|Matrix| (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|))))
           (|Boolean|))))
        (SPROG
         ((|m| (|NonNegativeInteger|)) (#2=#:G397 NIL) (|d| NIL)
          (#3=#:G398 NIL) (|ve| (|Vector| (|Integer|))) (|pts0| (|U32Vector|))
          (#4=#:G399 NIL) (#5=#:G393 NIL) (|pts| (|U32Vector|))
          (|vars| (|List| (|Symbol|))) (#6=#:G400 NIL) (|li| NIL)
          (#7=#:G401 NIL)
          (|gv0|
           (|List| (|PrimitiveArray| (|Fraction| (|Polynomial| (|Integer|))))))
          (|pp|
           (|Union|
            (|Record| (|:| |defects| (|Vector| (|Integer|)))
                      (|:| |cinds| (|Vector| (|Integer|)))
                      (|:| |rowlen| (|Integer|))
                      (|:| |offsetdata| #8=(|Vector| (|Integer|)))
                      (|:| |expdata| #9=(|SortedExponentVector|))
                      (|:| |coeffdata| #10=(|PrimitiveArray| (|Integer|))))
            "no_solution"))
          (|ppr|
           (|Record| (|:| |defects| (|Vector| (|Integer|)))
                     (|:| |cinds| (|Vector| (|Integer|)))
                     (|:| |rowlen| (|Integer|))
                     (|:| |offsetdata| (|Vector| (|Integer|)))
                     (|:| |expdata| (|SortedExponentVector|))
                     (|:| |coeffdata| (|PrimitiveArray| (|Integer|)))))
          (|offsets| #8#) (|oc| (|NonNegativeInteger|)) (|exps| #9#)
          (|coeffs| #10#) (|cc| (|NonNegativeInteger|))
          (|nsols| (|NonNegativeInteger|))
          (|resv|
           (|Vector|
            (|Vector|
             (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|))))))
          (#11=#:G402 NIL)
          (|resvi|
           (|Vector|
            (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|)))))
          (|j| NIL) (#12=#:G403 NIL) (|lo| #13=(|Integer|)) (|kk| (|Integer|))
          (|ohi| #13#) (|hi| (|Integer|)) (|sol_okp| #1#) (#14=#:G394 NIL)
          (|ok| (|Boolean|)) (#15=#:G395 NIL) (|ii| (|Integer|))
          (#16=#:G376 NIL)
          (|mress|
           (|Matrix|
            (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|)))))
          (|i| NIL) (#17=#:G404 NIL) (|l| NIL) (#18=#:G405 NIL)
          (#19=#:G396 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |m| (LENGTH |degs|))
                (LETT |ve|
                      (SPADCALL
                       (PROGN
                        (LETT #2# NIL)
                        (SEQ (LETT |d| NIL) (LETT #3# |degs|) G190
                             (COND
                              ((OR (ATOM #3#) (PROGN (LETT |d| (CAR #3#)) NIL))
                               (GO G191)))
                             (SEQ (EXIT (LETT #2# (CONS |d| #2#))))
                             (LETT #3# (CDR #3#)) (GO G190) G191
                             (EXIT (NREVERSE #2#))))
                       (QREFELT % 71)))
                (LETT |pts|
                      (SEQ
                       (EXIT
                        (COND
                         ((OR (EQUAL |kind| '|diffHP|)
                              (EQUAL |kind| '|qdiffHP|))
                          (GETREFV_U32 0 0))
                         ((OR (EQUAL |kind| '|shiftHP|)
                              (EQUAL |kind| '|qmixed|))
                          (SEQ (LETT |pts0| (GETREFV_U32 |sigma| 0))
                               (SEQ (LETT |i| 0) (LETT #4# (- |sigma| 1)) G190
                                    (COND ((|greater_SI| |i| #4#) (GO G191)))
                                    (SEQ (EXIT (SETELT_U32 |pts0| |i| |i|)))
                                    (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT |pts0|)))
                         ('T
                          (COND
                           ((EQUAL |kind| '|qshiftHP|)
                            (PROGN
                             (LETT #5# (GETREFV_U32 |sigma| 0))
                             (GO #20=#:G344)))))))
                       #20# (EXIT #5#)))
                (LETT |vars| (SPADCALL |list| |kind| |qvar| (QREFELT % 143)))
                (EXIT
                 (COND
                  ((NULL |vars|)
                   (|MODHP;trivial_poly_solve| |list| |degs| |kind| |sigma|
                    |gen| |check| %))
                  ('T
                   (SEQ
                    (LETT |gv0|
                          (PROGN
                           (LETT #6# NIL)
                           (SEQ (LETT |li| NIL) (LETT #7# |list|) G190
                                (COND
                                 ((OR (ATOM #7#)
                                      (PROGN (LETT |li| (CAR #7#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #6#
                                        (CONS (SPADCALL |li| (QREFELT % 147))
                                              #6#))))
                                (LETT #7# (CDR #7#)) (GO G190) G191
                                (EXIT (NREVERSE #6#)))))
                    (EXIT
                     (SEQ G190 NIL
                          (SEQ
                           (LETT |pp|
                                 (SPADCALL |vars| |gv0| |ve| |sigma| |pts|
                                           |kind| |qvar| |gen|
                                           (QREFELT % 151)))
                           (EXIT
                            (COND
                             ((QEQCAR |pp| 1)
                              (PROGN (LETT #19# (CONS 1 NIL)) (GO #21=#:G392)))
                             ('T
                              (SEQ (LETT |ppr| (QCDR |pp|))
                                   (LETT |offsets| (QVELT |ppr| 3))
                                   (LETT |oc| (QVSIZE |offsets|))
                                   (LETT |exps| (QVELT |ppr| 4))
                                   (LETT |coeffs| (QVELT |ppr| 5))
                                   (LETT |cc| (QVSIZE |coeffs|))
                                   (LETT |nsols|
                                         (|quotient_INT| (QVSIZE |offsets|)
                                                         |m|))
                                   (LETT |ok| 'T) (LETT |kk| 1)
                                   (LETT |ohi|
                                         (SPADCALL |offsets| 1 (QREFELT % 82)))
                                   (LETT |resv|
                                         (MAKEARR1 |nsols| (MAKE-ARRAY 0)))
                                   (LETT |ii| 1)
                                   (SEQ
                                    (EXIT
                                     (SEQ (LETT |i| 1) (LETT #11# |nsols|) G190
                                          (COND
                                           ((|greater_SI| |i| #11#) (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (SEQ
                                             (LETT |resvi|
                                                   (MAKEARR1 |m|
                                                             (|spadConstant| %
                                                                             113)))
                                             (SEQ (LETT |j| 1) (LETT #12# |m|)
                                                  G190
                                                  (COND
                                                   ((|greater_SI| |j| #12#)
                                                    (GO G191)))
                                                  (SEQ (LETT |lo| |ohi|)
                                                       (LETT |ohi|
                                                             (SEQ
                                                              (LETT |kk|
                                                                    (+ |kk| 1))
                                                              (EXIT
                                                               (COND
                                                                ((<= |kk| |oc|)
                                                                 (SPADCALL
                                                                  |offsets|
                                                                  |kk|
                                                                  (QREFELT %
                                                                           82)))
                                                                ('T |cc|)))))
                                                       (LETT |hi| (- |ohi| 1))
                                                       (EXIT
                                                        (SPADCALL |resvi| |j|
                                                                  (SPADCALL
                                                                   |vars|
                                                                   |exps|
                                                                   |coeffs|
                                                                   |lo| |hi|
                                                                   (QREFELT %
                                                                            124))
                                                                  (QREFELT %
                                                                           152))))
                                                  (LETT |j| (|inc_SI| |j|))
                                                  (GO G190) G191 (EXIT NIL))
                                             (LETT |sol_okp|
                                                   (SPADCALL
                                                    (SPADCALL |resvi|
                                                              (QREFELT % 154))
                                                    |check|))
                                             (EXIT
                                              (COND
                                               ((QEQCAR |sol_okp| 1)
                                                (PROGN
                                                 (LETT #14# |$NoValue|)
                                                 (GO #22=#:G367)))
                                               ((QEQCAR |sol_okp| 2)
                                                (SEQ (LETT |ok| NIL)
                                                     (EXIT
                                                      (PROGN
                                                       (LETT #15# |$NoValue|)
                                                       (GO #23=#:G375)))))
                                               ('T
                                                (SEQ
                                                 (SPADCALL |resv| |ii| |resvi|
                                                           (QREFELT % 156))
                                                 (EXIT
                                                  (LETT |ii| (+ |ii| 1)))))))))
                                           #22# (EXIT #14#))
                                          (LETT |i| (|inc_SI| |i|)) (GO G190)
                                          G191 (EXIT NIL)))
                                    #23# (EXIT #15#))
                                   (EXIT
                                    (COND
                                     (|ok|
                                      (SEQ
                                       (LETT |mress|
                                             (MAKE_MATRIX1 |m|
                                                           (PROG1
                                                               (LETT #16#
                                                                     (- |ii|
                                                                        1))
                                                             (|check_subtype2|
                                                              (>= #16# 0)
                                                              '(|NonNegativeInteger|)
                                                              '(|Integer|)
                                                              #16#))
                                                           (|spadConstant| %
                                                                           113)))
                                       (SEQ (LETT |i| 1) (LETT #17# (- |ii| 1))
                                            G190
                                            (COND
                                             ((|greater_SI| |i| #17#)
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (SEQ (LETT |l| 1) (LETT #18# |m|)
                                                   G190
                                                   (COND
                                                    ((|greater_SI| |l| #18#)
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (SPADCALL |mress| |l| |i|
                                                               (SPADCALL
                                                                (SPADCALL
                                                                 |resv| |i|
                                                                 (QREFELT %
                                                                          157))
                                                                |l|
                                                                (QREFELT % 30))
                                                               (QREFELT %
                                                                        140))))
                                                   (LETT |l| (|inc_SI| |l|))
                                                   (GO G190) G191 (EXIT NIL))))
                                            (LETT |i| (|inc_SI| |i|)) (GO G190)
                                            G191 (EXIT NIL))
                                       (EXIT
                                        (PROGN
                                         (LETT #19# (CONS 0 |mress|))
                                         (GO #21#)))))
                                     ('T
                                      (SEQ
                                       (SPADCALL
                                        (SPADCALL
                                         "check_sol_poly rejected solution"
                                         (QREFELT % 87))
                                        (QREFELT % 89))
                                       (SPADCALL
                                        (SPADCALL |resvi| (QREFELT % 158))
                                        (QREFELT % 89))
                                       (EXIT (|error| "giving up")))))))))))
                          NIL (GO G190) G191 (EXIT NIL)))))))))
          #21# (EXIT #19#)))) 

(SDEFUN |MODHP;HP_solve_M;LLSINniMMU;20|
        ((|list| (|List| (|List| (|Integer|)))) (|degs| (|List| (|Integer|)))
         (|kind| (|Symbol|)) (|prime| (|Integer|))
         (|sigma| (|NonNegativeInteger|))
         (|gen|
          (|Mapping| #1=(|Vector| (|U32Vector|)) (|List| (|U32Vector|))
                     (|Integer|) (|Integer|)))
         (|check|
          (|Mapping| #2=(|Union| "good" "reject" "no_solution")
                     (|List| (|SparseUnivariatePolynomial| (|Integer|)))))
         (%
          (|Union| (|Matrix| (|SparseUnivariatePolynomial| (|Integer|)))
                   (|Boolean|))))
        (SPROG
         ((|m| (|NonNegativeInteger|)) (#3=#:G448 NIL) (|d| NIL)
          (#4=#:G449 NIL) (|ve| (|Vector| (|Integer|))) (|pts0| (|U32Vector|))
          (#5=#:G450 NIL) (#6=#:G445 NIL) (|pts| (|U32Vector|)) (#7=#:G451 NIL)
          (|li| NIL) (#8=#:G452 NIL) (|gv0| (|List| (|U32Vector|))) (|gv| #1#)
          (|blr|
           (|Union|
            (|Record| (|:| |basis| #9=(|TwoDimensionalArray| (|U32Vector|)))
                      (|:| |defects| #10=(|Vector| (|Integer|)))
                      (|:| |cinds| (|Vector| (|Integer|))))
            "no_solution"))
          (|rblr|
           (|Record| (|:| |basis| (|TwoDimensionalArray| (|U32Vector|)))
                     (|:| |defects| (|Vector| (|Integer|)))
                     (|:| |cinds| (|Vector| (|Integer|)))))
          (|bm| #9#) (|va| #10#) (|nsols| (|NonNegativeInteger|))
          (|resv|
           (|Vector| (|Vector| (|SparseUnivariatePolynomial| (|Integer|)))))
          (#11=#:G453 NIL)
          (|resvi| (|Vector| (|SparseUnivariatePolynomial| (|Integer|))))
          (|j| NIL) (#12=#:G454 NIL) (|mm| (|Integer|)) (|bmij| (|U32Vector|))
          (#13=#:G455 NIL) (|s| (|SparseUnivariatePolynomial| (|Integer|)))
          (|sol_okp| #2#) (#14=#:G446 NIL) (|ii| (|Integer|)) (#15=#:G437 NIL)
          (|mress| (|Matrix| (|SparseUnivariatePolynomial| (|Integer|))))
          (|i| NIL) (#16=#:G456 NIL) (|l| NIL) (#17=#:G457 NIL)
          (#18=#:G447 NIL))
         (SEQ
          (EXIT
           (COND
            ((OR (EQUAL |kind| '|qdiffHP|) (EQUAL |kind| '|qshiftHP|))
             (CONS 1 'T))
            ('T
             (SEQ (LETT |m| (LENGTH |degs|))
                  (LETT |ve|
                        (SPADCALL
                         (PROGN
                          (LETT #3# NIL)
                          (SEQ (LETT |d| NIL) (LETT #4# |degs|) G190
                               (COND
                                ((OR (ATOM #4#)
                                     (PROGN (LETT |d| (CAR #4#)) NIL))
                                 (GO G191)))
                               (SEQ (EXIT (LETT #3# (CONS |d| #3#))))
                               (LETT #4# (CDR #4#)) (GO G190) G191
                               (EXIT (NREVERSE #3#))))
                         (QREFELT % 71)))
                  (LETT |pts|
                        (COND ((EQUAL |kind| '|diffHP|) (GETREFV_U32 0 0))
                              (#19='T
                               (SEQ
                                (EXIT
                                 (COND
                                  ((EQUAL |kind| '|shiftHP|)
                                   (PROGN
                                    (LETT #6#
                                          (SEQ
                                           (LETT |pts0|
                                                 (GETREFV_U32 |sigma| 0))
                                           (SEQ (LETT |i| 0)
                                                (LETT #5# (- |sigma| 1)) G190
                                                (COND
                                                 ((|greater_SI| |i| #5#)
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (SETELT_U32 |pts0| |i| |i|)))
                                                (LETT |i| (|inc_SI| |i|))
                                                (GO G190) G191 (EXIT NIL))
                                           (EXIT |pts0|)))
                                    (GO #20=#:G416)))))
                                #20# (EXIT #6#)))))
                  (LETT |gv0|
                        (PROGN
                         (LETT #7# NIL)
                         (SEQ (LETT |li| NIL) (LETT #8# |list|) G190
                              (COND
                               ((OR (ATOM #8#)
                                    (PROGN (LETT |li| (CAR #8#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #7#
                                      (CONS (SPADCALL |li| (QREFELT % 162))
                                            #7#))))
                              (LETT #8# (CDR #8#)) (GO G190) G191
                              (EXIT (NREVERSE #7#)))))
                  (LETT |gv| (SPADCALL |gv0| |prime| 1 |gen|))
                  (LETT |blr|
                        (SPADCALL |gv| |ve| |sigma| |pts| |prime| |kind|
                                  (QREFELT % 81)))
                  (EXIT
                   (COND
                    ((QEQCAR |blr| 1)
                     (PROGN (LETT #18# (CONS 1 NIL)) (GO #21=#:G444)))
                    (#19#
                     (SEQ (LETT |rblr| (QCDR |blr|))
                          (LETT |bm| (QVELT |rblr| 0))
                          (LETT |va| (QVELT |rblr| 1))
                          (LETT |nsols| (QVSIZE |va|))
                          (LETT |resv| (MAKEARR1 |nsols| (MAKE-ARRAY 0)))
                          (LETT |ii| 1)
                          (SEQ (LETT |i| 1) (LETT #11# |nsols|) G190
                               (COND ((|greater_SI| |i| #11#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (SEQ
                                  (LETT |resvi|
                                        (MAKEARR1 |m| (|spadConstant| % 50)))
                                  (SEQ (LETT |j| 1) (LETT #12# |m|) G190
                                       (COND
                                        ((|greater_SI| |j| #12#) (GO G191)))
                                       (SEQ
                                        (LETT |mm|
                                              (SPADCALL |ve| |j|
                                                        (QREFELT % 82)))
                                        (LETT |bmij|
                                              (SPADCALL |bm| |i| |j|
                                                        (QREFELT % 92)))
                                        (LETT |s| (|spadConstant| % 50))
                                        (SEQ (LETT |l| 0) (LETT #13# |mm|) G190
                                             (COND
                                              ((|greater_SI| |l| #13#)
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT |s|
                                                     (SPADCALL |s|
                                                               (SPADCALL
                                                                (ELT_U32 |bmij|
                                                                         |l|)
                                                                |l|
                                                                (QREFELT % 97))
                                                               (QREFELT %
                                                                        98)))))
                                             (LETT |l| (|inc_SI| |l|))
                                             (GO G190) G191 (EXIT NIL))
                                        (EXIT
                                         (SPADCALL |resvi| |j| |s|
                                                   (QREFELT % 99))))
                                       (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                       (EXIT NIL))
                                  (LETT |sol_okp|
                                        (SPADCALL
                                         (SPADCALL |resvi| (QREFELT % 101))
                                         |check|))
                                  (EXIT
                                   (COND
                                    ((QEQCAR |sol_okp| 1)
                                     (PROGN
                                      (LETT #14# |$NoValue|)
                                      (GO #22=#:G424)))
                                    ((QEQCAR |sol_okp| 2)
                                     (|error|
                                      "HP_solve_M: check should never return no_solution for finite fields"))
                                    ('T
                                     (SEQ
                                      (SPADCALL |resv| |ii| |resvi|
                                                (QREFELT % 103))
                                      (EXIT (LETT |ii| (+ |ii| 1)))))))))
                                #22# (EXIT #14#))
                               (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                               (EXIT NIL))
                          (LETT |mress|
                                (MAKE_MATRIX1 |m|
                                              (PROG1 (LETT #15# (- |ii| 1))
                                                (|check_subtype2| (>= #15# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  '(|Integer|)
                                                                  #15#))
                                              (|spadConstant| % 50)))
                          (SEQ (LETT |i| 1) (LETT #16# (- |ii| 1)) G190
                               (COND ((|greater_SI| |i| #16#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (SEQ (LETT |l| 1) (LETT #17# |m|) G190
                                      (COND
                                       ((|greater_SI| |l| #17#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SPADCALL |mress| |l| |i|
                                                  (SPADCALL
                                                   (SPADCALL |resv| |i|
                                                             (QREFELT % 104))
                                                   |l| (QREFELT % 9))
                                                  (QREFELT % 106))))
                                      (LETT |l| (|inc_SI| |l|)) (GO G190) G191
                                      (EXIT NIL))))
                               (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                               (EXIT NIL))
                          (EXIT
                           (PROGN
                            (LETT #18# (CONS 0 |mress|))
                            (GO #21#)))))))))))
          #21# (EXIT #18#)))) 

(SDEFUN |MODHP;HP_solve_A;LLSNniMMU;21|
        ((|list| (|List| (|List| (|AlgebraicNumber|))))
         (|degs| (|List| (|Integer|))) (|kind| (|Symbol|))
         (|sigma| (|NonNegativeInteger|))
         (|gen|
          (|Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
                     (|Integer|) (|Integer|)))
         (|check|
          (|Mapping| (|Union| "good" "reject" "no_solution")
                     (|List|
                      (|SparseUnivariatePolynomial| (|AlgebraicNumber|)))))
         (%
          (|Union|
           (|Matrix| (|SparseUnivariatePolynomial| (|AlgebraicNumber|)))
           (|Boolean|))))
        (CONS 1 'T)) 

(SDEFUN |MODHP;HP_solve_PA;LL2SNniMMU;22|
        ((|list|
          (|List| (|List| (|Fraction| (|Polynomial| (|AlgebraicNumber|))))))
         (|degs| (|List| (|Integer|))) (|kind| (|Symbol|)) (|qvar| (|Symbol|))
         (|sigma| (|NonNegativeInteger|))
         (|gen|
          (|Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
                     (|Integer|) (|Integer|)))
         (|check|
          (|Mapping| (|Union| "good" "reject" "no_solution")
                     (|List|
                      (|SparseUnivariatePolynomial|
                       (|Polynomial| (|AlgebraicNumber|))))))
         (%
          (|Union|
           (|Matrix|
            (|SparseUnivariatePolynomial| (|Polynomial| (|AlgebraicNumber|))))
           (|Boolean|))))
        (CONS 1 'T)) 

(DECLAIM (NOTINLINE |ModularHermitePade;|)) 

(DEFUN |ModularHermitePade;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|ModularHermitePade|))
          (LETT % (GETREFV 173))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|ModularHermitePade| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |ModularHermitePade| ()
  (SPROG NIL
         (PROG (#1=#:G475)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|ModularHermitePade|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|ModularHermitePade|
                             (LIST
                              (CONS NIL (CONS 1 (|ModularHermitePade;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|ModularHermitePade|)))))))))) 

(MAKEPROP '|ModularHermitePade| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|SparseUnivariatePolynomial| 7)
              (|Integer|) (|Vector| 6) (0 . |elt|) (|U32Vector|)
              (|U32VectorPolynomialOperations|) (6 . |to_mod_pa|) (|Vector| 10)
              (12 . |setelt!|) |MODHP;VSUPI_to_VPA;VIV;1|
              (|NonNegativeInteger|) (|SparseUnivariatePolynomial| 22)
              (19 . |degree|) (24 . |1|) (|Boolean|) (28 . |zero?|)
              (|Polynomial| 7) (33 . |leadingCoefficient|) (|List| 79)
              (|List| 7) (|PolynomialEvaluationUtilities|) (38 . |modpeval|)
              (46 . |reductum|) (|Vector| 17) (51 . |elt|)
              |MODHP;VSUPPI_to_VPA;VLLIV;3| (|Fraction| 7) (57 . |0|)
              (61 . |1|) (65 . |numer|) (70 . |positiveRemainder|)
              (76 . |denom|) (|SingleInteger|) (81 . |invmod|)
              (|Union| 64 '"failed") (|List| (|List| 32))
              |MODHP;LLFI_to_LPA;L2IU;4| (|Fraction| 22) (87 . |1|)
              (91 . |numer|) (96 . |denom|) (101 . |0|) (|List| 145)
              |MODHP;LLFPI_to_LPA;LILLIU;5| (105 . |0|) (109 . |zero?|)
              (114 . |degree|) (119 . |leadingCoefficient|) (124 . |reductum|)
              (129 . |coerce|) (|SparseUnivariatePolynomial| 32)
              (|Mapping| 32 7) (|SparseUnivariatePolynomialFunctions2| 7 32)
              (134 . |map|) (140 . |elt|) (146 . |1|) (|Void|)
              (150 . |truncated_mul_add|) (|List| 10) (|Mapping| 13 64 7 7)
              |MODHP;check_sol1a;VLM3IUv;9| (159 . +) (|Mapping| 7 7 7)
              (165 . |reduce|) (|Vector| 7) (171 . |vector|) (176 . |0|)
              (|IntegerPrimesPackage| 7) (180 . |nextPrime|) (185 . |member?|)
              (191 . |coerce|)
              (|Record| (|:| |basis| 91) (|:| |defects| 70) (|:| |cinds| 70))
              (|Union| 77 '"no_solution") (|Symbol|)
              (|InnerModularHermitePade|) (196 . |do_modular_solve|)
              (206 . |elt|) (|VectorIntegerReconstructor|) (212 . |empty|)
              (|String|) (|OutputForm|) (217 . |message|) (|PrintPackage|)
              (222 . |print|) (227 . |coerce|) (|TwoDimensionalArray| 10)
              (232 . |elt|) (239 . |chinese_update|) (246 . |setelt!|)
              (|Union| 123 '"failed") (253 . |reconstruct|) (259 . |monomial|)
              (265 . +) (271 . |setelt!|) (|List| 6) (278 . |entries|)
              (|Vector| 8) (283 . |setelt!|) (290 . |elt|) (|Matrix| 6)
              (296 . |setelt!|) (|Union| 105 20)
              (|Union| '#1="good" '#2="reject" '#3="no_solution")
              (|Mapping| 108 100) |MODHP;HP_solve_I;LLSNniMMU;10|
              (304 . |variables|) (309 . |setUnion|) (315 . |0|)
              (319 . |monomial|) (325 . +) (331 . |0|) (335 . |coerce|)
              (340 . |1|) (344 . |monomial|) (351 . *) (357 . +)
              (|SortedExponentVector|) (|PrimitiveArray| 7)
              |MODHP;unpack_poly;LSevPa2ISup;12| (363 . |coerce|)
              (|SparseUnivariatePolynomial| 43) (|Mapping| 43 22)
              (|SparseUnivariatePolynomialFunctions2| 22 43) (368 . |map|)
              (374 . |zero?|) (379 . |degree|) (384 . |leadingCoefficient|)
              (389 . |reductum|) (394 . |retract|) (399 . |monomial|) (405 . +)
              (411 . |0|) (415 . |elt|) (|Matrix| 17) (422 . |setelt!|)
              (430 . |member?|) (436 . |sort|) |MODHP;get_variables;L2SL;18|
              (441 . |1|) (|List| 43) (|PrimitiveArray| 43) (445 . |construct|)
              (|Record| (|:| |defects| 70) (|:| |cinds| 70) (|:| |rowlen| 7)
                        (|:| |offsetdata| 70) (|:| |expdata| 122)
                        (|:| |coeffdata| 123))
              (|Union| 148 '"no_solution") (|List| 146)
              (450 . |do_poly_integer|) (462 . |setelt!|) (|List| 17)
              (469 . |entries|) (|Vector| 29) (474 . |setelt!|) (481 . |elt|)
              (487 . |coerce|) (|Union| 139 20) (|Mapping| 108 153)
              |MODHP;HP_solve_P;LL2SNniMMU;19| (492 . |construct|) (|List| 25)
              |MODHP;HP_solve_M;LLSINniMMU;20|
              (|Union|
               (|Matrix| (|SparseUnivariatePolynomial| (|AlgebraicNumber|)))
               20)
              (|List| (|List| (|AlgebraicNumber|)))
              (|Mapping| 108
                         (|List|
                          (|SparseUnivariatePolynomial| (|AlgebraicNumber|))))
              |MODHP;HP_solve_A;LLSNniMMU;21|
              (|Union|
               (|Matrix|
                (|SparseUnivariatePolynomial|
                 (|Polynomial| (|AlgebraicNumber|))))
               20)
              (|List| (|List| (|Fraction| (|Polynomial| (|AlgebraicNumber|)))))
              (|Mapping| 108
                         (|List|
                          (|SparseUnivariatePolynomial|
                           (|Polynomial| (|AlgebraicNumber|)))))
              |MODHP;HP_solve_PA;LL2SNniMMU;22|)
           '#(|unpack_poly| 497 |get_variables| 506 |check_sol1a| 513
              |VSUPPI_to_VPA| 523 |VSUPI_to_VPA| 531 |LLFPI_to_LPA| 537
              |LLFI_to_LPA| 546 |HP_solve_PA| 553 |HP_solve_P| 564 |HP_solve_M|
              575 |HP_solve_I| 586 |HP_solve_A| 596)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|HP_solve_I|
                                 ((|Union|
                                   (|Matrix|
                                    (|SparseUnivariatePolynomial| (|Integer|)))
                                   (|Boolean|))
                                  (|List| (|List| (|Fraction| (|Integer|))))
                                  (|List| (|Integer|)) (|Symbol|)
                                  (|NonNegativeInteger|)
                                  (|Mapping| (|Vector| (|U32Vector|))
                                             (|List| (|U32Vector|)) (|Integer|)
                                             (|Integer|))
                                  (|Mapping| (|Union| #1# #2# #3#)
                                             (|List|
                                              (|SparseUnivariatePolynomial|
                                               (|Integer|))))))
                                T)
                              '((|HP_solve_A|
                                 ((|Union|
                                   (|Matrix|
                                    (|SparseUnivariatePolynomial|
                                     (|AlgebraicNumber|)))
                                   (|Boolean|))
                                  (|List| (|List| (|AlgebraicNumber|)))
                                  (|List| (|Integer|)) (|Symbol|)
                                  (|NonNegativeInteger|)
                                  (|Mapping| (|Vector| (|U32Vector|))
                                             (|List| (|U32Vector|)) (|Integer|)
                                             (|Integer|))
                                  (|Mapping| (|Union| #1# #2# #3#)
                                             (|List|
                                              (|SparseUnivariatePolynomial|
                                               (|AlgebraicNumber|))))))
                                T)
                              '((|HP_solve_P|
                                 ((|Union|
                                   (|Matrix|
                                    (|SparseUnivariatePolynomial|
                                     (|Polynomial| (|Integer|))))
                                   (|Boolean|))
                                  (|List|
                                   (|List|
                                    (|Fraction| (|Polynomial| (|Integer|)))))
                                  (|List| (|Integer|)) (|Symbol|) (|Symbol|)
                                  (|NonNegativeInteger|)
                                  (|Mapping| (|Vector| (|U32Vector|))
                                             (|List| (|U32Vector|)) (|Integer|)
                                             (|Integer|))
                                  (|Mapping| (|Union| #1# #2# #3#)
                                             (|List|
                                              (|SparseUnivariatePolynomial|
                                               (|Polynomial| (|Integer|)))))))
                                T)
                              '((|HP_solve_PA|
                                 ((|Union|
                                   (|Matrix|
                                    (|SparseUnivariatePolynomial|
                                     (|Polynomial| (|AlgebraicNumber|))))
                                   (|Boolean|))
                                  (|List|
                                   (|List|
                                    (|Fraction|
                                     (|Polynomial| (|AlgebraicNumber|)))))
                                  (|List| (|Integer|)) (|Symbol|) (|Symbol|)
                                  (|NonNegativeInteger|)
                                  (|Mapping| (|Vector| (|U32Vector|))
                                             (|List| (|U32Vector|)) (|Integer|)
                                             (|Integer|))
                                  (|Mapping| (|Union| #1# #2# #3#)
                                             (|List|
                                              (|SparseUnivariatePolynomial|
                                               (|Polynomial|
                                                (|AlgebraicNumber|)))))))
                                T)
                              '((|HP_solve_M|
                                 ((|Union|
                                   (|Matrix|
                                    (|SparseUnivariatePolynomial| (|Integer|)))
                                   (|Boolean|))
                                  (|List| (|List| (|Integer|)))
                                  (|List| (|Integer|)) (|Symbol|) (|Integer|)
                                  (|NonNegativeInteger|)
                                  (|Mapping| (|Vector| (|U32Vector|))
                                             (|List| (|U32Vector|)) (|Integer|)
                                             (|Integer|))
                                  (|Mapping| (|Union| #1# #2# #3#)
                                             (|List|
                                              (|SparseUnivariatePolynomial|
                                               (|Integer|))))))
                                T)
                              '((|check_sol1a|
                                 ((|U32Vector|) (|Vector| (|U32Vector|))
                                  (|List| (|U32Vector|))
                                  (|Mapping| (|Vector| (|U32Vector|))
                                             (|List| (|U32Vector|)) (|Integer|)
                                             (|Integer|))
                                  (|Integer|) (|Integer|) (|Integer|)))
                                T)
                              '((|VSUPI_to_VPA|
                                 ((|Vector| (|U32Vector|))
                                  (|Vector|
                                   (|SparseUnivariatePolynomial| (|Integer|)))
                                  (|Integer|)))
                                T)
                              '((|VSUPPI_to_VPA|
                                 ((|Vector| (|U32Vector|))
                                  (|Vector|
                                   (|SparseUnivariatePolynomial|
                                    (|Polynomial| (|Integer|))))
                                  (|List| (|Symbol|)) (|List| (|Integer|))
                                  (|Integer|)))
                                T)
                              '((|LLFI_to_LPA|
                                 ((|Union| (|List| (|U32Vector|)) "failed")
                                  (|List| (|List| (|Fraction| (|Integer|))))
                                  (|Integer|) (|Integer|)))
                                T)
                              '((|LLFPI_to_LPA|
                                 ((|Union| (|List| (|U32Vector|)) "failed")
                                  (|List|
                                   (|List|
                                    (|Fraction| (|Polynomial| (|Integer|)))))
                                  (|Integer|) (|List| (|Symbol|))
                                  (|List| (|Integer|)) (|Integer|)))
                                T)
                              '((|get_variables|
                                 ((|List| (|Symbol|))
                                  (|List|
                                   (|List|
                                    (|Fraction| (|Polynomial| (|Integer|)))))
                                  (|Symbol|) (|Symbol|)))
                                T)
                              '((|unpack_poly|
                                 ((|SparseUnivariatePolynomial|
                                   (|Polynomial| (|Integer|)))
                                  (|List| (|Symbol|)) (|SortedExponentVector|)
                                  (|PrimitiveArray| (|Integer|)) (|Integer|)
                                  (|Integer|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 172
                                            '(2 8 6 0 7 9 2 11 10 6 7 12 3 13
                                              10 0 7 10 14 1 17 16 0 18 0 17 0
                                              19 1 17 20 0 21 1 17 22 0 23 4 26
                                              7 22 24 25 7 27 1 17 0 0 28 2 29
                                              17 0 7 30 0 32 0 33 0 32 0 34 1
                                              32 7 0 35 2 7 0 0 0 36 1 32 7 0
                                              37 2 38 0 0 0 39 0 43 0 44 1 43
                                              22 0 45 1 43 22 0 46 0 43 0 47 0
                                              6 0 50 1 6 20 0 51 1 6 16 0 52 1
                                              6 7 0 53 1 6 0 0 54 1 32 0 7 55 2
                                              58 56 57 6 59 2 13 10 0 7 60 0 56
                                              0 61 5 11 62 10 10 10 7 7 63 2 7
                                              0 0 0 67 2 25 7 68 0 69 1 70 0 25
                                              71 0 56 0 72 1 73 7 7 74 2 25 20
                                              7 0 75 1 38 0 7 76 6 80 78 13 70
                                              16 10 7 79 81 2 70 7 0 7 82 1 83
                                              0 7 84 1 86 0 85 87 1 88 62 86 89
                                              1 7 86 0 90 3 91 10 0 7 7 92 3 83
                                              62 10 7 0 93 3 70 7 0 7 7 94 2 83
                                              95 0 70 96 2 6 0 7 16 97 2 6 0 0
                                              0 98 3 8 6 0 7 6 99 1 8 100 0 101
                                              3 102 8 0 7 8 103 2 102 8 0 7 104
                                              4 105 6 0 7 7 6 106 1 22 24 0 111
                                              2 24 0 0 0 112 0 17 0 113 2 17 0
                                              22 16 114 2 17 0 0 0 115 0 22 0
                                              116 1 22 0 7 117 0 22 0 118 3 22
                                              0 0 79 16 119 2 22 0 0 0 120 2 22
                                              0 0 0 121 1 43 0 22 125 2 128 126
                                              127 17 129 1 126 20 0 130 1 126
                                              16 0 131 1 126 43 0 132 1 126 0 0
                                              133 1 43 32 0 134 2 56 0 32 16
                                              135 2 56 0 0 0 136 0 126 0 137 3
                                              105 6 0 7 7 138 4 139 17 0 7 7 17
                                              140 2 24 20 79 0 141 1 24 0 0 142
                                              0 126 0 144 1 146 0 145 147 8 80
                                              149 24 150 70 16 10 79 79 65 151
                                              3 29 17 0 7 17 152 1 29 153 0 154
                                              3 155 29 0 7 29 156 2 155 29 0 7
                                              157 1 29 86 0 158 1 10 0 25 162 5
                                              0 17 24 122 123 7 7 124 3 0 24 48
                                              79 79 143 6 0 10 13 64 65 7 7 7
                                              66 4 0 13 29 24 25 7 31 2 0 13 8
                                              7 15 5 0 40 48 7 24 25 7 49 3 0
                                              40 41 7 7 42 7 0 169 170 25 79 79
                                              16 65 171 172 7 0 159 48 25 79 79
                                              16 65 160 161 7 0 107 163 25 79 7
                                              16 65 109 164 6 0 107 41 25 79 16
                                              65 109 110 6 0 165 166 25 79 16
                                              65 167 168)))))
           '|lookupComplete|)) 
