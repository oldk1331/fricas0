
(SDEFUN |MODFACTG;floor_sqrt| ((|n| (|Integer|)) (% (|Integer|)))
        (SPROG ((|res| (|Integer|)))
               (SEQ (LETT |res| (SPADCALL |n| (QREFELT % 13)))
                    (EXIT
                     (COND ((<= |n| (* |res| |res|)) |res|)
                           ('T (+ |res| 1))))))) 

(SDEFUN |MODFACTG;eqfact|
        ((|pol| (PA)) (|l| (|Integer|)) (|pmat1| (MMT)) (|xp1| (PA))
         (|pmat2| (MMT)) (|xp2| (PA)) (|l1| (|NonNegativeInteger|))
         (|k1| (|Integer|)) (|k2| (|Integer|)) (|rdata| (PMD))
         (|res| (|List| PA)) (% (|List| PA)))
        (SPROG
         ((|p| (MD)) (|pp| (|Integer|)) (|n0| (|Integer|))
          (|l2| #1=(|NonNegativeInteger|)) (|rpol| (PA)) (|kk| (|Integer|))
          (|i| NIL) (#2=#:G30 NIL) (|tr| (PA)) (|tr1| (PA))
          (|bad_cnt| (|NonNegativeInteger|)) (#3=#:G28 NIL) (|#G20| (PA))
          (|#G21| (PA)) (|g| (PA)) (|#G22| #4=(|NonNegativeInteger|))
          (|#G23| #5=(|NonNegativeInteger|)) (|dp| #1#) (|dg| #4#) (|n| #5#)
          (#6=#:G29 NIL) (|rdata1| (PMD)) (|rdata2| (PMD)) (|xp11| (PA)))
         (SEQ
          (EXIT
           (COND ((EQL |l| 1) (CONS |pol| |res|))
                 ('T
                  (SEQ (LETT |p| (SPADCALL |rdata| (QREFELT % 14)))
                       (LETT |pp|
                             (EXPT (SPADCALL |p| (QREFELT % 15))
                                   (SPADCALL |p| (QREFELT % 16))))
                       (LETT |dp| (SPADCALL |pol| (QREFELT % 17)))
                       (LETT |pol|
                             (SPADCALL |pol| (+ |dp| 1) |p| (QREFELT % 18)))
                       (LETT |n0| (|quotient_INT| |dp| |l|)) (LETT |bad_cnt| 1)
                       (SEQ G190 (COND ((NULL (> |l| 1)) (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ
                               (LETT |l2| (|quotient_INT| (+ |dp| |l1|) |l1|))
                               (LETT |rpol|
                                     (SPADCALL (- |dp| 1) |p| (QREFELT % 19)))
                               (LETT |tr| |rpol|)
                               (LETT |kk| (MIN (- |n0| 1) |k1|))
                               (SEQ (LETT |i| 1) (LETT #2# (- |n0| 1)) G190
                                    (COND ((|greater_SI| |i| #2#) (GO G191)))
                                    (SEQ
                                     (LETT |tr|
                                           (SPADCALL |tr| |pmat1| |xp1| |l1|
                                                     |rdata| (QREFELT % 21)))
                                     (EXIT
                                      (LETT |tr|
                                            (SPADCALL |tr| |rpol| |p|
                                                      (QREFELT % 22)))))
                                    (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                    (EXIT NIL))
                               (LETT |tr|
                                     (SPADCALL |tr| |rdata| (QREFELT % 23)))
                               (LETT |tr1|
                                     (COND ((EQL |pp| 2) |tr|)
                                           ('T
                                            (SPADCALL |tr|
                                                      (|quotient_INT|
                                                       (- |pp| 1) 2)
                                                      |rdata|
                                                      (QREFELT % 24)))))
                               (LETT |tr1| (SPADCALL |tr1| |p| (QREFELT % 25)))
                               (LETT |g|
                                     (SPADCALL |tr1| |pol| |p| (QREFELT % 26)))
                               (LETT |dg| (SPADCALL |g| (QREFELT % 17)))
                               (COND
                                ((OR (EQL |dg| 0) (EQL |dg| |dp|))
                                 (EXIT
                                  (SEQ (LETT |bad_cnt| (+ |bad_cnt| 1))
                                       (EXIT
                                        (PROGN
                                         (LETT #3# |$NoValue|)
                                         (GO #7=#:G13)))))))
                               (LETT |dp| (- |dp| |dg|))
                               (LETT |pol|
                                     (SPADCALL |pol| |g| |p| (QREFELT % 27)))
                               (COND
                                ((< |dp| |dg|)
                                 (SEQ
                                  (PROGN
                                   (LETT |#G20| |pol|)
                                   (LETT |#G21| |g|)
                                   (LETT |g| |#G20|)
                                   (LETT |pol| |#G21|))
                                  (EXIT
                                   (PROGN
                                    (LETT |#G22| |dg|)
                                    (LETT |#G23| |dp|)
                                    (LETT |dp| |#G22|)
                                    (LETT |dg| |#G23|))))))
                               (LETT |n| |dp|)
                               (EXIT
                                (COND
                                 ((EQL |dg| |n0|)
                                  (SEQ (LETT |res| (CONS |g| |res|))
                                       (EXIT
                                        (COND
                                         ((EQL |dp| |n0|)
                                          (PROGN
                                           (LETT #6# (CONS |pol| |res|))
                                           (GO #8=#:G27)))
                                         ('T
                                          (SEQ
                                           (LETT |rdata|
                                                 (SPADCALL |pol| |p|
                                                           (QREFELT % 28)))
                                           (SPADCALL |pmat1| (+ |dg| |dp|) |dp|
                                                     |rdata| (QREFELT % 30))
                                           (LETT |xp1|
                                                 (SPADCALL |xp1| (+ |dg| |dp|)
                                                           |p| (QREFELT % 18)))
                                           (EXIT
                                            (LETT |xp1|
                                                  (SPADCALL |xp1| |rdata|
                                                            (QREFELT %
                                                                     23))))))))))
                                 ('T
                                  (SEQ
                                   (LETT |rdata1|
                                         (SPADCALL |g| |p| (QREFELT % 28)))
                                   (LETT |rdata2|
                                         (SPADCALL |pol| |p| (QREFELT % 28)))
                                   (SPADCALL |pmat1| (+ |dg| |dp|) |dg| |dp|
                                             |rdata1| |rdata2| (QREFELT % 31))
                                   (LETT |xp11|
                                         (SPADCALL |xp1| (+ |dg| |dp|) |p|
                                                   (QREFELT % 18)))
                                   (LETT |xp11|
                                         (SPADCALL |xp11| |rdata1|
                                                   (QREFELT % 23)))
                                   (LETT |res|
                                         (|MODFACTG;eqfact| |g|
                                          (|quotient_INT| |dg| |n0|) |pmat1|
                                          |xp11| |pmat2| |xp2| |l1| |k1| |k2|
                                          |rdata1| |res| %))
                                   (LETT |l| (|quotient_INT| |dp| |n0|))
                                   (EXIT
                                    (COND
                                     ((> |l| 1)
                                      (SEQ (LETT |rdata| |rdata2|)
                                           (SPADCALL |pmat1| |dg| |dp|
                                                     (QREFELT % 32))
                                           (LETT |xp1|
                                                 (SPADCALL |xp1| (+ |dg| |dp|)
                                                           |p| (QREFELT % 18)))
                                           (EXIT
                                            (LETT |xp1|
                                                  (SPADCALL |xp1| |rdata|
                                                            (QREFELT %
                                                                     23))))))))))))))
                             #7# (EXIT #3#))
                            NIL (GO G190) G191 (EXIT NIL))
                       (EXIT (CONS |pol| |res|))))))
          #8# (EXIT #6#)))) 

(SDEFUN |MODFACTG;do_ddfact|
        ((|pol| (PA)) (|p| (MD)) (|do_eqfact?| (|Boolean|))
         (%
          (|List|
           (|Record| (|:| |poly| PA) (|:| |degree| (|NonNegativeInteger|))
                     (|:| |separate_factors| (|Mapping| (|List| PA)))))))
        (SPROG
         ((|x1| (PA)) (|pp| (|Integer|)) (|xp| (PA))
          (|n0| #1=(|NonNegativeInteger|)) (|l2| (|NonNegativeInteger|))
          (|l1| (|NonNegativeInteger|))
          (|#G29| #2=(|Record| (|:| |matr| MMT) (|:| |poly| PA)))
          (|pmat1| (MMT)) (|n2| (|NonNegativeInteger|))
          (|k1| (|NonNegativeInteger|)) (|k2| (|NonNegativeInteger|))
          (#3=#:G75 NIL) (|lpj| (|List| PA)) (|pj| (PA)) (|#G31| #2#)
          (|#G32| (MMT)) (|#G33| (PA)) (|pmat2| (MMT)) (|i1| NIL)
          (#4=#:G76 NIL) (#5=#:G77 NIL) (|i| (|NonNegativeInteger|))
          (|pk1| (PA)) (|g| (PA)) (|dg| (|Integer|)) (|n| #1#)
          (|l11| (|NonNegativeInteger|)) (|all_done| (|Boolean|))
          (|rdata| (PMD)) (|rdata1| (PMD)) (|rdata2| (PMD)) (|xp11| (PA))
          (|xp21| (PA)) (|res1| (|List| PA)) (|g1| NIL) (#6=#:G78 NIL)
          (|pmat11| (MMT)) (|pmat21| (MMT)) (|xp1| (PA)) (|xp2| (PA))
          (#7=#:G73 NIL) (#8=#:G72 NIL) (#9=#:G74 NIL) (|pk| (PA))
          (|res|
           (|List|
            (|Record| (|:| |poly| PA) (|:| |degree| (|NonNegativeInteger|))
                      (|:| |separate_factors| (|Mapping| (|List| PA)))))))
         (SEQ (LETT |n| (SPADCALL |pol| (QREFELT % 17)))
              (EXIT
               (COND ((EQL |n| 0) NIL)
                     ((EQL |n| 1)
                      (SEQ (LETT |pol| (SPADCALL |pol| 2 |p| (QREFELT % 18)))
                           (EXIT
                            (LIST
                             (VECTOR |pol| 1
                                     (CONS #'|MODFACTG;do_ddfact!0| |pol|))))))
                     (#10='T
                      (SEQ (LETT |rdata| (SPADCALL |pol| |p| (QREFELT % 28)))
                           (LETT |x1| (SPADCALL |p| (QREFELT % 33)))
                           (LETT |pp|
                                 (EXPT (SPADCALL |p| (QREFELT % 15))
                                       (SPADCALL |p| (QREFELT % 16))))
                           (LETT |xp|
                                 (SPADCALL |x1| |pp| |rdata| (QREFELT % 24)))
                           (LETT |n0| |n|)
                           (LETT |l2|
                                 (COND ((< |n| 120) 1) ((< |n| 360) 3)
                                       (#10# (SPADCALL |n| 4 (QREFELT % 34)))))
                           (LETT |l1| (|quotient_INT| (- (+ |n| |l2|) 1) |l2|))
                           (PROGN
                            (LETT |#G29|
                                  (SPADCALL |xp| |l1| |rdata| (QREFELT % 36)))
                            (LETT |pmat1| (QCAR |#G29|))
                            (LETT |xp1| (QCDR |#G29|))
                            |#G29|)
                           (LETT |lpj| (LIST |x1|))
                           (LETT |n2| (|quotient_INT| |n| 2))
                           (LETT |k1|
                                 (COND ((EQL |l2| 1) |l2|)
                                       (#10# (|MODFACTG;floor_sqrt| |n2| %))))
                           (LETT |k2|
                                 (|quotient_INT| (- (+ |n2| |k1|) 1) |k1|))
                           (LETT |pj| |xp|)
                           (SEQ (LETT |i| 1) (LETT #3# (- |k1| 1)) G190
                                (COND ((|greater_SI| |i| #3#) (GO G191)))
                                (SEQ (LETT |lpj| (CONS |pj| |lpj|))
                                     (EXIT
                                      (LETT |pj|
                                            (SPADCALL |pj| |pmat1| |xp1| |l1|
                                                      |rdata|
                                                      (QREFELT % 21)))))
                                (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                (EXIT NIL))
                           (LETT |pk| |pj|)
                           (LETT |pol|
                                 (SPADCALL |pol| (+ |n| 1) |p| (QREFELT % 18)))
                           (LETT |res| NIL)
                           (COND
                            ((> |k1| 1)
                             (PROGN
                              (LETT |#G31|
                                    (SPADCALL |pj| |l1| |rdata|
                                              (QREFELT % 36)))
                              (LETT |pmat2| (QCAR |#G31|))
                              (LETT |xp2| (QCDR |#G31|))
                              |#G31|))
                            (#10#
                             (PROGN
                              (LETT |#G32| (SPADCALL (QREFELT % 37)))
                              (LETT |#G33| (SPADCALL (QREFELT % 38)))
                              (LETT |pmat2| |#G32|)
                              (LETT |xp2| |#G33|))))
                           (LETT |i| 0)
                           (SEQ
                            (EXIT
                             (SEQ (LETT |i1| 1) (LETT #4# |k2|) G190
                                  (COND ((|greater_SI| |i1| #4#) (GO G191)))
                                  (SEQ
                                   (SEQ
                                    (EXIT
                                     (SEQ (LETT #5# |lpj|) G190
                                          (COND
                                           ((OR (ATOM #5#)
                                                (PROGN
                                                 (LETT |pj| (CAR #5#))
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (SEQ (LETT |i| (+ |i| 1))
                                                 (LETT |pk1|
                                                       (SPADCALL |pk| |pj| |p|
                                                                 (QREFELT %
                                                                          39)))
                                                 (LETT |g|
                                                       (SPADCALL |pk1| |pol|
                                                                 |p|
                                                                 (QREFELT %
                                                                          26)))
                                                 (SEQ
                                                  (LETT |dg|
                                                        (SPADCALL |g|
                                                                  (QREFELT %
                                                                           17)))
                                                  (EXIT
                                                   (COND
                                                    ((> |dg| 0)
                                                     (COND
                                                      ((SPADCALL (REM |dg| |i|)
                                                                 0
                                                                 (QREFELT %
                                                                          41))
                                                       (|error|
                                                        "ddfact: bad gcd, maybe pol is not squarefree?"))
                                                      ('T
                                                       (SEQ
                                                        (LETT |n| (- |n| |dg|))
                                                        (LETT |l11|
                                                              (MIN |l1| |dg|))
                                                        (LETT |all_done|
                                                              (>= |i|
                                                                  (|quotient_INT|
                                                                   |n| 2)))
                                                        (COND
                                                         ((> |n| 0)
                                                          (LETT |pol|
                                                                (SPADCALL |pol|
                                                                          |g|
                                                                          |p|
                                                                          (QREFELT
                                                                           %
                                                                           27)))))
                                                        (COND
                                                         ((NULL |all_done|)
                                                          (SEQ
                                                           (LETT |rdata|
                                                                 (SPADCALL
                                                                  |pol| |p|
                                                                  (QREFELT %
                                                                           28)))
                                                           (EXIT
                                                            (LETT |pk|
                                                                  (SPADCALL
                                                                   |pk| |rdata|
                                                                   (QREFELT %
                                                                            23)))))))
                                                        (EXIT
                                                         (COND
                                                          ((EQL |dg| |i|)
                                                           (SEQ
                                                            (LETT |res|
                                                                  (CONS
                                                                   (VECTOR |g|
                                                                           |i|
                                                                           (CONS
                                                                            #'|MODFACTG;do_ddfact!1|
                                                                            |g|))
                                                                   |res|))
                                                            (EXIT
                                                             (COND
                                                              ((NULL
                                                                |all_done|)
                                                               (SEQ
                                                                (SPADCALL
                                                                 |pmat1|
                                                                 (+ |dg| |n|)
                                                                 |n| |rdata|
                                                                 (QREFELT %
                                                                          30))
                                                                (LETT |xp1|
                                                                      (SPADCALL
                                                                       |xp1|
                                                                       (+ |dg|
                                                                          |n|)
                                                                       |p|
                                                                       (QREFELT
                                                                        % 18)))
                                                                (LETT |xp1|
                                                                      (SPADCALL
                                                                       |xp1|
                                                                       |rdata|
                                                                       (QREFELT
                                                                        % 23)))
                                                                (EXIT
                                                                 (COND
                                                                  ((NULL
                                                                    (SPADCALL
                                                                     |pmat2|
                                                                     (QREFELT %
                                                                              42)))
                                                                   (SEQ
                                                                    (SPADCALL
                                                                     |pmat2|
                                                                     (+ |dg|
                                                                        |n|)
                                                                     |n|
                                                                     |rdata|
                                                                     (QREFELT %
                                                                              30))
                                                                    (LETT |xp2|
                                                                          (SPADCALL
                                                                           |xp2|
                                                                           (+
                                                                            |dg|
                                                                            |n|)
                                                                           |p|
                                                                           (QREFELT
                                                                            %
                                                                            18)))
                                                                    (EXIT
                                                                     (LETT
                                                                      |xp2|
                                                                      (SPADCALL
                                                                       |xp2|
                                                                       |rdata|
                                                                       (QREFELT
                                                                        %
                                                                        23))))))))))))))
                                                          ('T
                                                           (SEQ
                                                            (LETT |rdata1|
                                                                  (SPADCALL |g|
                                                                            |p|
                                                                            (QREFELT
                                                                             %
                                                                             28)))
                                                            (COND
                                                             (|all_done|
                                                              (SEQ
                                                               (SPADCALL
                                                                |pmat1|
                                                                (+ |dg| |n|)
                                                                |dg| |rdata1|
                                                                (QREFELT % 30))
                                                               (LETT |xp11|
                                                                     (SPADCALL
                                                                      |xp1|
                                                                      (+ |dg|
                                                                         |n|)
                                                                      |p|
                                                                      (QREFELT
                                                                       % 18)))
                                                               (LETT |xp11|
                                                                     (SPADCALL
                                                                      |xp11|
                                                                      |rdata1|
                                                                      (QREFELT
                                                                       % 23)))
                                                               (LETT |xp21|
                                                                     |xp2|)
                                                               (EXIT
                                                                (COND
                                                                 ((NULL
                                                                   (SPADCALL
                                                                    |pmat2|
                                                                    (QREFELT %
                                                                             42)))
                                                                  (SEQ
                                                                   (SPADCALL
                                                                    |pmat2|
                                                                    (+ |dg|
                                                                       |n|)
                                                                    |dg|
                                                                    |rdata1|
                                                                    (QREFELT %
                                                                             30))
                                                                   (LETT |xp21|
                                                                         (SPADCALL
                                                                          |xp21|
                                                                          (+
                                                                           |dg|
                                                                           |n|)
                                                                          |p|
                                                                          (QREFELT
                                                                           %
                                                                           18)))
                                                                   (EXIT
                                                                    (LETT
                                                                     |xp21|
                                                                     (SPADCALL
                                                                      |xp21|
                                                                      |rdata1|
                                                                      (QREFELT
                                                                       %
                                                                       23))))))))))
                                                             ('T
                                                              (SEQ
                                                               (LETT |rdata2|
                                                                     (SPADCALL
                                                                      |pol| |p|
                                                                      (QREFELT
                                                                       % 28)))
                                                               (SPADCALL
                                                                |pmat1|
                                                                (+ |dg| |n|)
                                                                |dg| |n|
                                                                |rdata1|
                                                                |rdata|
                                                                (QREFELT % 31))
                                                               (LETT |xp11|
                                                                     (SPADCALL
                                                                      |xp1|
                                                                      (+ |dg|
                                                                         |n|)
                                                                      |p|
                                                                      (QREFELT
                                                                       % 18)))
                                                               (LETT |xp11|
                                                                     (SPADCALL
                                                                      |xp11|
                                                                      |rdata1|
                                                                      (QREFELT
                                                                       % 23)))
                                                               (EXIT
                                                                (COND
                                                                 ((SPADCALL
                                                                   |pmat2|
                                                                   (QREFELT %
                                                                            42))
                                                                  (LETT |xp21|
                                                                        |xp2|))
                                                                 ('T
                                                                  (SEQ
                                                                   (SPADCALL
                                                                    |pmat2|
                                                                    (+ |dg|
                                                                       |n|)
                                                                    |dg| |n|
                                                                    |rdata1|
                                                                    |rdata|
                                                                    (QREFELT %
                                                                             31))
                                                                   (LETT |xp21|
                                                                         (SPADCALL
                                                                          |xp1|
                                                                          (+
                                                                           |dg|
                                                                           |n|)
                                                                          |p|
                                                                          (QREFELT
                                                                           %
                                                                           18)))
                                                                   (EXIT
                                                                    (LETT
                                                                     |xp21|
                                                                     (SPADCALL
                                                                      |xp21|
                                                                      |rdata1|
                                                                      (QREFELT
                                                                       %
                                                                       23)))))))))))
                                                            (COND
                                                             (|do_eqfact?|
                                                              (SEQ
                                                               (LETT |res1|
                                                                     (|MODFACTG;eqfact|
                                                                      |g|
                                                                      (|quotient_INT|
                                                                       |dg|
                                                                       |i|)
                                                                      |pmat1|
                                                                      |xp11|
                                                                      |pmat2|
                                                                      |xp21|
                                                                      |l11|
                                                                      |k1| |k2|
                                                                      |rdata1|
                                                                      NIL %))
                                                               (EXIT
                                                                (SEQ
                                                                 (LETT |g1|
                                                                       NIL)
                                                                 (LETT #6#
                                                                       |res1|)
                                                                 G190
                                                                 (COND
                                                                  ((OR
                                                                    (ATOM #6#)
                                                                    (PROGN
                                                                     (LETT |g1|
                                                                           (CAR
                                                                            #6#))
                                                                     NIL))
                                                                   (GO G191)))
                                                                 (SEQ
                                                                  (EXIT
                                                                   (LETT |res|
                                                                         (CONS
                                                                          (VECTOR
                                                                           |g1|
                                                                           |i|
                                                                           (CONS
                                                                            #'|MODFACTG;do_ddfact!2|
                                                                            |g1|))
                                                                          |res|))))
                                                                 (LETT #6#
                                                                       (CDR
                                                                        #6#))
                                                                 (GO G190) G191
                                                                 (EXIT NIL)))))
                                                             ('T
                                                              (SEQ
                                                               (LETT |pmat11|
                                                                     (SPADCALL
                                                                      |pmat1|
                                                                      |dg|
                                                                      (QREFELT
                                                                       % 43)))
                                                               (LETT |pmat21|
                                                                     (COND
                                                                      ((SPADCALL
                                                                        |pmat2|
                                                                        (QREFELT
                                                                         % 42))
                                                                       |pmat2|)
                                                                      ('T
                                                                       (SPADCALL
                                                                        |pmat2|
                                                                        |dg|
                                                                        (QREFELT
                                                                         %
                                                                         43)))))
                                                               (EXIT
                                                                (LETT |res|
                                                                      (CONS
                                                                       (VECTOR
                                                                        |g| |i|
                                                                        (CONS
                                                                         #'|MODFACTG;do_ddfact!3|
                                                                         (VECTOR
                                                                          |rdata1|
                                                                          |k2|
                                                                          |k1|
                                                                          |l11|
                                                                          |p|
                                                                          |xp21|
                                                                          |pmat21|
                                                                          |xp11|
                                                                          |pmat11|
                                                                          % |i|
                                                                          |dg|
                                                                          |g|)))
                                                                       |res|))))))
                                                            (EXIT
                                                             (COND
                                                              ((NULL
                                                                |all_done|)
                                                               (SEQ
                                                                (SPADCALL
                                                                 |pmat1| |dg|
                                                                 |n|
                                                                 (QREFELT %
                                                                          32))
                                                                (LETT |xp1|
                                                                      (SPADCALL
                                                                       |xp1|
                                                                       (+ |dg|
                                                                          |n|)
                                                                       |p|
                                                                       (QREFELT
                                                                        % 18)))
                                                                (LETT |xp1|
                                                                      (SPADCALL
                                                                       |xp1|
                                                                       |rdata|
                                                                       (QREFELT
                                                                        % 23)))
                                                                (EXIT
                                                                 (COND
                                                                  ((NULL
                                                                    (SPADCALL
                                                                     |pmat2|
                                                                     (QREFELT %
                                                                              42)))
                                                                   (SEQ
                                                                    (SPADCALL
                                                                     |pmat2|
                                                                     |dg| |n|
                                                                     (QREFELT %
                                                                              32))
                                                                    (LETT |xp2|
                                                                          (SPADCALL
                                                                           |xp2|
                                                                           (+
                                                                            |dg|
                                                                            |n|)
                                                                           |p|
                                                                           (QREFELT
                                                                            %
                                                                            18)))
                                                                    (EXIT
                                                                     (LETT
                                                                      |xp2|
                                                                      (SPADCALL
                                                                       |xp2|
                                                                       |rdata|
                                                                       (QREFELT
                                                                        %
                                                                        23)))))))))))))))))))))))
                                                 (EXIT
                                                  (COND
                                                   ((>= |i|
                                                        (|quotient_INT| |n| 2))
                                                    (PROGN
                                                     (LETT #8#
                                                           (PROGN
                                                            (LETT #7# 1)
                                                            (GO #11=#:G64)))
                                                     (GO #12=#:G63)))))))
                                           #12# (EXIT #8#))
                                          (LETT #5# (CDR #5#)) (GO G190) G191
                                          (EXIT NIL)))
                                    #11# (EXIT #7#))
                                   (EXIT
                                    (COND
                                     ((>= |i| (|quotient_INT| |n| 2))
                                      (PROGN (LETT #9# 1) (GO #13=#:G66)))
                                     ('T
                                      (LETT |pk|
                                            (COND
                                             ((> |k1| 1)
                                              (SPADCALL |pk| |pmat2| |xp2| |l1|
                                                        |rdata|
                                                        (QREFELT % 21)))
                                             ('T
                                              (SPADCALL |pk| |pmat1| |xp1| |l1|
                                                        |rdata|
                                                        (QREFELT % 21)))))))))
                                  (LETT |i1| (|inc_SI| |i1|)) (GO G190) G191
                                  (EXIT NIL)))
                            #13# (EXIT #9#))
                           (COND
                            ((EQL |n| (SPADCALL |pol| (QREFELT % 17)))
                             (COND
                              ((> |n| 0)
                               (LETT |res|
                                     (CONS
                                      (VECTOR |pol| |n|
                                              (CONS #'|MODFACTG;do_ddfact!4|
                                                    |pol|))
                                      |res|))))))
                           (EXIT |res|)))))))) 

(SDEFUN |MODFACTG;do_ddfact!4| ((|pol| NIL)) (LIST |pol|)) 

(SDEFUN |MODFACTG;do_ddfact!3| (($$ NIL))
        (PROG (|g| |dg| |i| % |pmat11| |xp11| |pmat21| |xp21| |p| |l11| |k1|
               |k2| |rdata1|)
          (LETT |g| (QREFELT $$ 12))
          (LETT |dg| (QREFELT $$ 11))
          (LETT |i| (QREFELT $$ 10))
          (LETT % (QREFELT $$ 9))
          (LETT |pmat11| (QREFELT $$ 8))
          (LETT |xp11| (QREFELT $$ 7))
          (LETT |pmat21| (QREFELT $$ 6))
          (LETT |xp21| (QREFELT $$ 5))
          (LETT |p| (QREFELT $$ 4))
          (LETT |l11| (QREFELT $$ 3))
          (LETT |k1| (QREFELT $$ 2))
          (LETT |k2| (QREFELT $$ 1))
          (LETT |rdata1| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|MODFACTG;eqfact| |g| (SPADCALL |dg| |i| (QREFELT % 44)) |pmat11|
             |xp11| |pmat21| (SPADCALL |xp21| |dg| |p| (QREFELT % 18)) |l11|
             |k1| |k2| |rdata1| NIL %))))) 

(SDEFUN |MODFACTG;do_ddfact!2| ((|g1| NIL)) (LIST |g1|)) 

(SDEFUN |MODFACTG;do_ddfact!1| ((|g| NIL)) (LIST |g|)) 

(SDEFUN |MODFACTG;do_ddfact!0| ((|pol| NIL)) (LIST |pol|)) 

(SDEFUN |MODFACTG;ddfact;PAMDL;4|
        ((|pol| (PA)) (|prime| (MD))
         (%
          (|List|
           (|Record| (|:| |poly| PA) (|:| |degree| (|NonNegativeInteger|))
                     (|:| |separate_factors| (|Mapping| (|List| PA)))))))
        (|MODFACTG;do_ddfact| |pol| |prime| NIL %)) 

(SDEFUN |MODFACTG;mfactor;PAMDL;5|
        ((|pol| (PA)) (|prime| (MD)) (% (|List| PA)))
        (SPROG
         ((|rl1|
           (|List|
            (|Record| (|:| |poly| PA) (|:| |degree| (|NonNegativeInteger|))
                      (|:| |separate_factors| (|Mapping| (|List| PA))))))
          (#1=#:G87 NIL) (|el| NIL) (#2=#:G88 NIL))
         (SEQ (LETT |rl1| (|MODFACTG;do_ddfact| |pol| |prime| 'T %))
              (EXIT
               (PROGN
                (LETT #1# NIL)
                (SEQ (LETT |el| NIL) (LETT #2# |rl1|) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |el| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ (EXIT (LETT #1# (CONS (QVELT |el| 0) #1#))))
                     (LETT #2# (CDR #2#)) (GO G190) G191
                     (EXIT (NREVERSE #1#)))))))) 

(SDEFUN |MODFACTG;irreducible?;PAMDB;6|
        ((|pol| (PA)) (|prime| (MD)) (% (|Boolean|)))
        (SPROG
         ((|rl1|
           (|List|
            (|Record| (|:| |poly| PA) (|:| |degree| (|NonNegativeInteger|))
                      (|:| |separate_factors| (|Mapping| (|List| PA))))))
          (|r1|
           (|Record| (|:| |poly| PA) (|:| |degree| (|NonNegativeInteger|))
                     (|:| |separate_factors| (|Mapping| (|List| PA))))))
         (SEQ (LETT |rl1| (|MODFACTG;do_ddfact| |pol| |prime| NIL %))
              (EXIT
               (COND
                ((EQL (LENGTH |rl1|) 1)
                 (SEQ (LETT |r1| (|SPADfirst| |rl1|))
                      (EXIT
                       (EQL (SPADCALL (QVELT |r1| 0) (QREFELT % 17))
                            (QVELT |r1| 1)))))
                ('T NIL)))))) 

(DECLAIM (NOTINLINE |ModularFactorizationGeneral;|)) 

(DEFUN |ModularFactorizationGeneral;| (|#1| |#2| |#3| |#4| |#5|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (DV$4 NIL) (DV$5 NIL) (|dv$| NIL) (% NIL)
    (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT DV$5 (|devaluate| |#5|))
    (LETT |dv$| (LIST '|ModularFactorizationGeneral| DV$1 DV$2 DV$3 DV$4 DV$5))
    (LETT % (GETREFV 52))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
    (|haddProp| |$ConstructorCache| '|ModularFactorizationGeneral|
                (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (QSETREFV % 10 |#5|)
    (SETF |pv$| (QREFELT % 3))
    %))) 

(DEFUN |ModularFactorizationGeneral| (&REST #1=#:G93)
  (SPROG NIL
         (PROG (#2=#:G94)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ModularFactorizationGeneral|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |ModularFactorizationGeneral;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|ModularFactorizationGeneral|)))))))))) 

(MAKEPROP '|ModularFactorizationGeneral| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) (|Integer|)
              (|IntegerRoots| 11) (0 . |approxSqrt|) (5 . |get_mod|)
              (10 . |get_char|) (15 . |get_extension_degree|) (20 . |degree|)
              (25 . |copy_poly|) (32 . |random_poly|) (|NonNegativeInteger|)
              (38 . |modular_compose|) (47 . |add_poly|) (54 . |red_pol!|)
              (60 . |mod_exp|) (67 . |sub1!|) (73 . |gcd|) (80 . |divide!|)
              (87 . |ini_rdata|) (|Void|) (93 . |trim_mat!|)
              (101 . |split_mat!|) (111 . |shift_mat!|) (118 . |monomial1|)
              (123 . |approxNthRoot|) (|Record| (|:| |matr| 7) (|:| |poly| 6))
              (129 . |power_matrix|) (136 . |empty_mat|) (140 . |empty_poly|)
              (144 . |sub_poly|) (|Boolean|) (151 . ~=) (157 . |empty_mat?|)
              (162 . |copy_mat_part|) (168 . |quo|) (|Mapping| 49)
              (|Record| (|:| |poly| 6) (|:| |degree| 20)
                        (|:| |separate_factors| 45))
              (|List| 46) |MODFACTG;ddfact;PAMDL;4| (|List| 6)
              |MODFACTG;mfactor;PAMDL;5| |MODFACTG;irreducible?;PAMDB;6|)
           '#(|mfactor| 174 |irreducible?| 180 |ddfact| 186) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|mfactor| ((|List| |#1|) |#1| |#3|)) T)
                                   '((|ddfact|
                                      ((|List|
                                        (|Record| (|:| |poly| |#1|)
                                                  (|:| |degree|
                                                       (|NonNegativeInteger|))
                                                  (|:| |separate_factors|
                                                       (|Mapping|
                                                        (|List| |#1|)))))
                                       |#1| |#3|))
                                     T)
                                   '((|irreducible?| ((|Boolean|) |#1| |#3|))
                                     T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 51
                                            '(1 12 11 11 13 1 10 8 9 14 1 10 11
                                              8 15 1 10 11 8 16 1 10 11 6 17 3
                                              10 6 6 11 8 18 2 10 6 11 8 19 5
                                              10 6 6 7 6 20 9 21 3 10 6 6 6 8
                                              22 2 10 6 6 9 23 3 10 6 6 11 9 24
                                              2 10 6 6 8 25 3 10 6 6 6 8 26 3
                                              10 6 6 6 8 27 2 10 9 6 8 28 4 10
                                              29 7 11 11 9 30 6 10 29 7 11 11
                                              11 9 9 31 3 10 29 7 11 11 32 1 10
                                              6 8 33 2 12 11 11 20 34 3 10 35 6
                                              20 9 36 0 10 7 37 0 10 6 38 3 10
                                              6 6 6 8 39 2 11 40 0 0 41 1 10 40
                                              7 42 2 10 7 7 11 43 2 11 0 0 0 44
                                              2 0 49 6 8 50 2 0 40 6 8 51 2 0
                                              47 6 8 48)))))
           '|lookupComplete|)) 
