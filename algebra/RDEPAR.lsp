
(SDEFUN |RDEPAR;get_denom|
        ((|f| (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|lg| (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
         (|der|
          (|Mapping| (|SparseUnivariatePolynomial| F)
                     (|SparseUnivariatePolynomial| F)))
         (% (|List| (|SparseUnivariatePolynomial| F))))
        (SPROG
         ((|d| (|SparseUnivariatePolynomial| F)) (#1=#:G58 NIL) (|g| NIL)
          (#2=#:G59 NIL) (|e0| (|SparseUnivariatePolynomial| F))
          (|#G8|
           (|Record| (|:| |normal| #3=(|SparseUnivariatePolynomial| F))
                     (|:| |special| #4=(|SparseUnivariatePolynomial| F))))
          (|e| #3#) (|s| #4#) (|gg| (|SparseUnivariatePolynomial| F))
          (#5=#:G54 NIL) (|h| (|SparseUnivariatePolynomial| F)))
         (SEQ (LETT |d| (SPADCALL |f| |der| (QREFELT % 12)))
              (LETT |e0|
                    (SPADCALL
                     (PROGN
                      (LETT #1# NIL)
                      (SEQ (LETT |g| NIL) (LETT #2# |lg|) G190
                           (COND
                            ((OR (ATOM #2#) (PROGN (LETT |g| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #1#
                                   (CONS (SPADCALL |g| (QREFELT % 13)) #1#))))
                           (LETT #2# (CDR #2#)) (GO G190) G191
                           (EXIT (NREVERSE #1#))))
                     (QREFELT % 15)))
              (PROGN
               (LETT |#G8| (SPADCALL |e0| |der| (QREFELT % 17)))
               (LETT |e| (QCAR |#G8|))
               (LETT |s| (QCDR |#G8|))
               |#G8|)
              (LETT |gg| (SPADCALL |d| |e| (QREFELT % 18)))
              (LETT |h|
                    (PROG2
                        (LETT #5#
                              (SPADCALL
                               (SPADCALL |e| (SPADCALL |e| (QREFELT % 19))
                                         (QREFELT % 18))
                               (SPADCALL |gg| (SPADCALL |gg| (QREFELT % 19))
                                         (QREFELT % 18))
                               (QREFELT % 21)))
                        (QCDR #5#)
                      (|check_union2| (QEQCAR #5# 0)
                                      (|SparseUnivariatePolynomial|
                                       (QREFELT % 7))
                                      (|Union|
                                       (|SparseUnivariatePolynomial|
                                        (QREFELT % 7))
                                       "failed")
                                      #5#)))
              (EXIT (LIST |d| |h|))))) 

(SDEFUN |RDEPAR;normalize|
        ((|f| (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|der|
          (|Mapping| #1=(|SparseUnivariatePolynomial| F)
                     (|SparseUnivariatePolynomial| F)))
         (%
          (|List|
           (|Record| (|:| |fctr| (|SparseUnivariatePolynomial| F))
                     (|:| |xpnt| (|Integer|))))))
        (SPROG
         ((|d| (|SparseUnivariatePolynomial| F))
          (|g| #2=(|SparseUnivariatePolynomial| F))
          (|d0| (|SparseUnivariatePolynomial| F)) (|dd| #2#)
          (|d1| (|SparseUnivariatePolynomial| F)) (#3=#:G63 NIL)
          (|d2| (|SparseUnivariatePolynomial| F))
          (|eeu|
           (|Union|
            (|Record| (|:| |coef1| #4=(|SparseUnivariatePolynomial| F))
                      (|:| |coef2| #5=(|SparseUnivariatePolynomial| F)))
            #6="failed"))
          (#7=#:G71 NIL)
          (|#G11|
           (|Record| (|:| |coef1| (|SparseUnivariatePolynomial| F))
                     (|:| |coef2| (|SparseUnivariatePolynomial| F))))
          (|a| #4#) (|b| #5#) (|zk| (|Kernel| F)) (|dd1| #1#) (|r| (F))
          (|rql| (|List| (|Fraction| (|Integer|)))) (|rq| NIL) (#8=#:G87 NIL)
          (|mu| (|Union| (|Integer|) "failed")) (|m| (|Integer|)) (|pi| #2#)
          (|rl|
           (|List|
            (|Record| (|:| |fctr| (|SparseUnivariatePolynomial| F))
                      (|:| |xpnt| (|Integer|))))))
         (SEQ (LETT |d| (SPADCALL |f| |der| (QREFELT % 12)))
              (LETT |g|
                    (SPADCALL |d| (SPADCALL |d| (QREFELT % 19))
                              (QREFELT % 18)))
              (LETT |d0|
                    (PROG2 (LETT #3# (SPADCALL |d| |g| (QREFELT % 21)))
                        (QCDR #3#)
                      (|check_union2| (QEQCAR #3# 0)
                                      (|SparseUnivariatePolynomial|
                                       (QREFELT % 7))
                                      (|Union|
                                       (|SparseUnivariatePolynomial|
                                        (QREFELT % 7))
                                       #9="failed")
                                      #3#)))
              (LETT |dd| (SPADCALL |d0| |g| (QREFELT % 18)))
              (LETT |d1|
                    (PROG2 (LETT #3# (SPADCALL |d0| |dd| (QREFELT % 21)))
                        (QCDR #3#)
                      (|check_union2| (QEQCAR #3# 0)
                                      (|SparseUnivariatePolynomial|
                                       (QREFELT % 7))
                                      (|Union|
                                       (|SparseUnivariatePolynomial|
                                        (QREFELT % 7))
                                       #9#)
                                      #3#)))
              (LETT |d2|
                    (PROG2
                        (LETT #3#
                              (SPADCALL (SPADCALL |f| (QREFELT % 13)) |d1|
                                        (QREFELT % 21)))
                        (QCDR #3#)
                      (|check_union2| (QEQCAR #3# 0)
                                      (|SparseUnivariatePolynomial|
                                       (QREFELT % 7))
                                      (|Union|
                                       (|SparseUnivariatePolynomial|
                                        (QREFELT % 7))
                                       #9#)
                                      #3#)))
              (LETT |eeu|
                    (SPADCALL |d2| |d1| (SPADCALL |f| (QREFELT % 22))
                              (QREFELT % 25)))
              (PROGN
               (LETT |#G11|
                     (PROG2 (LETT #7# |eeu|)
                         (QCDR #7#)
                       (|check_union2| (QEQCAR #7# 0)
                                       (|Record|
                                        (|:| |coef1|
                                             (|SparseUnivariatePolynomial|
                                              (QREFELT % 7)))
                                        (|:| |coef2|
                                             (|SparseUnivariatePolynomial|
                                              (QREFELT % 7))))
                                       (|Union|
                                        (|Record|
                                         (|:| |coef1|
                                              (|SparseUnivariatePolynomial|
                                               (QREFELT % 7)))
                                         (|:| |coef2|
                                              (|SparseUnivariatePolynomial|
                                               (QREFELT % 7))))
                                        #6#)
                                       #7#)))
               (LETT |a| (QCAR |#G11|))
               (LETT |b| (QCDR |#G11|))
               |#G11|)
              (LETT |zk| (SPADCALL (SPADCALL (QREFELT % 27)) (QREFELT % 29)))
              (LETT |dd1| (SPADCALL |d1| |der|))
              (LETT |r|
                    (SPADCALL
                     (SPADCALL |a|
                               (SPADCALL (SPADCALL |zk| (QREFELT % 31)) |dd1|
                                         (QREFELT % 32))
                               (QREFELT % 33))
                     |d1| (QREFELT % 34)))
              (LETT |rql| (SPADCALL |r| |zk| (QREFELT % 37))) (LETT |rl| NIL)
              (SEQ (LETT |rq| NIL) (LETT #8# |rql|) G190
                   (COND
                    ((OR (ATOM #8#) (PROGN (LETT |rq| (CAR #8#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |mu| (SPADCALL |rq| (QREFELT % 40)))
                        (EXIT
                         (COND
                          ((QEQCAR |mu| 0)
                           (SEQ (LETT |m| (QCDR |mu|))
                                (EXIT
                                 (COND
                                  ((> |m| 0)
                                   (SEQ
                                    (LETT |pi|
                                          (SPADCALL
                                           (SPADCALL |a|
                                                     (SPADCALL
                                                      (SPADCALL |m|
                                                                (QREFELT % 43))
                                                      |dd1| (QREFELT % 32))
                                                     (QREFELT % 33))
                                           |d1| (QREFELT % 18)))
                                    (EXIT
                                     (LETT |rl|
                                           (CONS (CONS |pi| |m|)
                                                 |rl|))))))))))))
                   (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL))
              (EXIT |rl|)))) 

(SDEFUN |RDEPAR;RF_to_GP|
        ((|f| (|Fraction| (|SparseUnivariatePolynomial| F)))
         (% (|LaurentPolynomial| F (|SparseUnivariatePolynomial| F))))
        (SPROG ((#1=#:G89 NIL))
               (PROG2
                   (LETT #1#
                         (SPADCALL
                          (SPADCALL (SPADCALL |f| (QREFELT % 22))
                                    (QREFELT % 45))
                          (SPADCALL (SPADCALL |f| (QREFELT % 13))
                                    (QREFELT % 45))
                          (QREFELT % 46)))
                   (QCDR #1#)
                 (|check_union2| (QEQCAR #1# 0)
                                 (|LaurentPolynomial| (QREFELT % 7)
                                                      (|SparseUnivariatePolynomial|
                                                       (QREFELT % 7)))
                                 (|Union|
                                  (|LaurentPolynomial| (QREFELT % 7)
                                                       (|SparseUnivariatePolynomial|
                                                        (QREFELT % 7)))
                                  "failed")
                                 #1#)))) 

(SDEFUN |RDEPAR;do_spde1|
        ((|b| (|SparseUnivariatePolynomial| F))
         (|lc| (|List| (|SparseUnivariatePolynomial| F)))
         (|der|
          (|Mapping| (|SparseUnivariatePolynomial| F)
                     (|SparseUnivariatePolynomial| F)))
         (|get_rs| (|Mapping| #1=(|Matrix| F) (|Matrix| F)))
         (%
          (|List|
           (|Record| (|:| |ratpart| (|SparseUnivariatePolynomial| F))
                     (|:| |coeffs| (|Vector| F))))))
        (SPROG
         ((#2=#:G106 NIL) (|c| NIL) (#3=#:G107 NIL)
          (|lar|
           (|List|
            (|Record| (|:| |ans| #4=(|SparseUnivariatePolynomial| F))
                      (|:| |remainder| #5=(|SparseUnivariatePolynomial| F)))))
          (#6=#:G108 NIL) (#7=#:G109 NIL) (|la| (|List| #4#)) (#8=#:G110 NIL)
          (|ar| NIL) (#9=#:G111 NIL) (|lrem| (|List| #5#)) (|rs1| (|Matrix| F))
          (|rs2| #1#) (|lkv| (|List| (|Vector| F))) (#10=#:G112 NIL) (|kv| NIL)
          (#11=#:G113 NIL))
         (SEQ
          (LETT |lar|
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |c| NIL) (LETT #3# |lc|) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |c| (CAR #3#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (SPADCALL |b| |c| |der| (QREFELT % 49))
                                    #2#))))
                      (LETT #3# (CDR #3#)) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))
          (LETT |la|
                (PROGN
                 (LETT #6# NIL)
                 (SEQ (LETT |ar| NIL) (LETT #7# |lar|) G190
                      (COND
                       ((OR (ATOM #7#) (PROGN (LETT |ar| (CAR #7#)) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #6# (CONS (QCAR |ar|) #6#))))
                      (LETT #7# (CDR #7#)) (GO G190) G191
                      (EXIT (NREVERSE #6#)))))
          (LETT |lrem|
                (PROGN
                 (LETT #8# NIL)
                 (SEQ (LETT |ar| NIL) (LETT #9# |lar|) G190
                      (COND
                       ((OR (ATOM #9#) (PROGN (LETT |ar| (CAR #9#)) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #8# (CONS (QCDR |ar|) #8#))))
                      (LETT #9# (CDR #9#)) (GO G190) G191
                      (EXIT (NREVERSE #8#)))))
          (LETT |rs1|
                (SPADCALL (SPADCALL (LIST |lrem|) (QREFELT % 52))
                          (QREFELT % 55)))
          (LETT |rs2| (SPADCALL |rs1| |get_rs|))
          (LETT |lkv| (SPADCALL |rs2| (QREFELT % 57)))
          (EXIT
           (PROGN
            (LETT #10# NIL)
            (SEQ (LETT |kv| NIL) (LETT #11# |lkv|) G190
                 (COND
                  ((OR (ATOM #11#) (PROGN (LETT |kv| (CAR #11#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #10#
                         (CONS (CONS (SPADCALL |kv| |la| (QREFELT % 61)) |kv|)
                               #10#))))
                 (LETT #11# (CDR #11#)) (GO G190) G191
                 (EXIT (NREVERSE #10#)))))))) 

(SDEFUN |RDEPAR;param_SPDE|
        ((|a| (|SparseUnivariatePolynomial| F))
         (|b| (|SparseUnivariatePolynomial| F))
         (|lc| (|List| (|SparseUnivariatePolynomial| F))) (|d| (|Integer|))
         (|der|
          (|Mapping| #1=(|SparseUnivariatePolynomial| F)
                     (|SparseUnivariatePolynomial| F)))
         (|get_rs| (|Mapping| #2=(|Matrix| F) (|Matrix| F)))
         (|do_degrad|
          (|Mapping|
           #3=(|List|
               (|Record|
                (|:| |ratpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
                (|:| |coeffs| (|Vector| F))))
           (|Fraction| (|SparseUnivariatePolynomial| F))
           (|List| (|Fraction| (|SparseUnivariatePolynomial| F)))))
         (|x| (|Symbol|))
         (%
          #4=(|List|
              (|Record| (|:| |ratpart| (|SparseUnivariatePolynomial| F))
                        (|:| |coeffs| (|Vector| F))))))
        (SPROG
         ((|dt| #1#) (|degt| (|Integer|)) (|base_case| (|Boolean|))
          (#5=#:G171 NIL) (#6=#:G172 NIL)
          (|lcr| (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|res1| #3#) (#7=#:G173 NIL) (|re| NIL) (#8=#:G174 NIL)
          (|s1|
           (|Union|
            (|List|
             (|Record| (|:| |ans| #9=(|SparseUnivariatePolynomial| F))
                       (|:| |remainder| (|SparseUnivariatePolynomial| F))))
            (|Record| (|:| |ans| #10=(|List| (|SparseUnivariatePolynomial| F)))
                      (|:| |acoeff| #11=(|SparseUnivariatePolynomial| F))
                      (|:| |eegen| #12=(|SparseUnivariatePolynomial| F))
                      (|:| |bpar| (|SparseUnivariatePolynomial| F))
                      (|:| |lcpar| (|List| (|SparseUnivariatePolynomial| F)))
                      (|:| |dpar| (|Integer|)))))
          (|lrs|
           (|List|
            (|Record| (|:| |ans| (|SparseUnivariatePolynomial| F))
                      (|:| |remainder| (|SparseUnivariatePolynomial| F)))))
          (#13=#:G175 NIL) (#14=#:G176 NIL)
          (|m1| (|Matrix| (|SparseUnivariatePolynomial| F))) (#15=#:G177 NIL)
          (|rsol| NIL) (#16=#:G178 NIL) (|a1l| (|List| #9#)) (#17=#:G179 NIL)
          (#18=#:G180 NIL)
          (|dres|
           (|Record| (|:| |ans| (|List| (|SparseUnivariatePolynomial| F)))
                     (|:| |acoeff| (|SparseUnivariatePolynomial| F))
                     (|:| |eegen| (|SparseUnivariatePolynomial| F))
                     (|:| |bpar| (|SparseUnivariatePolynomial| F))
                     (|:| |lcpar| (|List| (|SparseUnivariatePolynomial| F)))
                     (|:| |dpar| (|Integer|))))
          (|g| #12#) (#19=#:G145 NIL) (|aa| #11#) (|oans| #10#)
          (#20=#:G181 NIL) (|c| NIL) (#21=#:G182 NIL)
          (|lq|
           (|List|
            (|Record| (|:| |quotient| (|SparseUnivariatePolynomial| F))
                      (|:| |remainder| #22=(|SparseUnivariatePolynomial| F)))))
          (#23=#:G183 NIL) (#24=#:G184 NIL) (|lr| (|List| #22#))
          (|rs1| (|Matrix| F)) (|rs2| #2#) (|lkv| (|List| (|Vector| F)))
          (#25=#:G185 NIL) (|q| NIL) (#26=#:G186 NIL) (|kv| NIL)
          (#27=#:G187 NIL) (|nlc| (|List| (|SparseUnivariatePolynomial| F)))
          (|s2| #4#) (|be| NIL) (#28=#:G188 NIL) (|bv| (|Vector| F))
          (|ans1| (|SparseUnivariatePolynomial| F))
          (|nres|
           (|List|
            (|Record| (|:| |ratpart| (|SparseUnivariatePolynomial| F))
                      (|:| |coeffs| (|Vector| F))))))
         (SEQ
          (LETT |dt|
                (SPADCALL (SPADCALL (|spadConstant| % 63) 1 (QREFELT % 65))
                          |der|))
          (EXIT
           (COND
            ((EQL (SPADCALL |a| (QREFELT % 66)) 0)
             (COND
              ((SPADCALL |a| (|spadConstant| % 67) (QREFELT % 69))
               (|error| "param_SPDE: degree(a) = 0 but a ~= 1"))
              (#29='T
               (SEQ (LETT |degt| (- (SPADCALL |dt| (QREFELT % 66)) 1))
                    (LETT |base_case|
                          (SPADCALL |dt| (|spadConstant| % 67) (QREFELT % 70)))
                    (COND
                     ((SPADCALL |b| (|spadConstant| % 71) (QREFELT % 69))
                      (COND
                       ((OR |base_case|
                            (> (SPADCALL |b| (QREFELT % 66)) (MAX 0 |degt|)))
                        (EXIT
                         (|RDEPAR;do_spde1| |b| |lc| |der| |get_rs| %))))))
                    (LETT |lcr|
                          (PROGN
                           (LETT #5# NIL)
                           (SEQ (LETT |c| NIL) (LETT #6# |lc|) G190
                                (COND
                                 ((OR (ATOM #6#)
                                      (PROGN (LETT |c| (CAR #6#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #5#
                                        (CONS (SPADCALL |c| (QREFELT % 72))
                                              #5#))))
                                (LETT #6# (CDR #6#)) (GO G190) G191
                                (EXIT (NREVERSE #5#)))))
                    (LETT |res1|
                          (SPADCALL (SPADCALL |b| (QREFELT % 72)) |lcr|
                                    |do_degrad|))
                    (EXIT
                     (PROGN
                      (LETT #7# NIL)
                      (SEQ (LETT |re| NIL) (LETT #8# |res1|) G190
                           (COND
                            ((OR (ATOM #8#) (PROGN (LETT |re| (CAR #8#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #7#
                                   (CONS
                                    (CONS (SPADCALL (QCAR |re|) (QREFELT % 73))
                                          (QCDR |re|))
                                    #7#))))
                           (LETT #8# (CDR #8#)) (GO G190) G191
                           (EXIT (NREVERSE #7#)))))))))
            (#29#
             (SEQ (LETT |s1| (SPADCALL |a| |b| |lc| |d| |der| (QREFELT % 76)))
                  (EXIT
                   (COND
                    ((QEQCAR |s1| 0)
                     (SEQ (LETT |lrs| (QCDR |s1|))
                          (LETT |m1|
                                (SPADCALL
                                 (LIST
                                  (PROGN
                                   (LETT #13# NIL)
                                   (SEQ (LETT |rsol| NIL) (LETT #14# |lrs|)
                                        G190
                                        (COND
                                         ((OR (ATOM #14#)
                                              (PROGN
                                               (LETT |rsol| (CAR #14#))
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #13#
                                                (CONS (QCDR |rsol|) #13#))))
                                        (LETT #14# (CDR #14#)) (GO G190) G191
                                        (EXIT (NREVERSE #13#)))))
                                 (QREFELT % 52)))
                          (LETT |rs1| (SPADCALL |m1| (QREFELT % 55)))
                          (LETT |rs2| (SPADCALL |rs1| |get_rs|))
                          (LETT |lkv| (SPADCALL |rs2| (QREFELT % 57)))
                          (LETT |a1l|
                                (PROGN
                                 (LETT #15# NIL)
                                 (SEQ (LETT |rsol| NIL) (LETT #16# |lrs|) G190
                                      (COND
                                       ((OR (ATOM #16#)
                                            (PROGN
                                             (LETT |rsol| (CAR #16#))
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #15# (CONS (QCAR |rsol|) #15#))))
                                      (LETT #16# (CDR #16#)) (GO G190) G191
                                      (EXIT (NREVERSE #15#)))))
                          (EXIT
                           (PROGN
                            (LETT #17# NIL)
                            (SEQ (LETT |kv| NIL) (LETT #18# |lkv|) G190
                                 (COND
                                  ((OR (ATOM #18#)
                                       (PROGN (LETT |kv| (CAR #18#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #17#
                                         (CONS
                                          (CONS
                                           (SPADCALL |kv| |a1l| (QREFELT % 61))
                                           |kv|)
                                          #17#))))
                                 (LETT #18# (CDR #18#)) (GO G190) G191
                                 (EXIT (NREVERSE #17#)))))))
                    (#29#
                     (SEQ (LETT |dres| (QCDR |s1|)) (LETT |g| (QVELT |dres| 2))
                          (LETT |a|
                                (PROG2
                                    (LETT #19#
                                          (SPADCALL |a| |g| (QREFELT % 21)))
                                    (QCDR #19#)
                                  (|check_union2| (QEQCAR #19# 0)
                                                  (|SparseUnivariatePolynomial|
                                                   (QREFELT % 7))
                                                  (|Union|
                                                   (|SparseUnivariatePolynomial|
                                                    (QREFELT % 7))
                                                   #30="failed")
                                                  #19#)))
                          (LETT |b|
                                (PROG2
                                    (LETT #19#
                                          (SPADCALL (QVELT |dres| 3) |g|
                                                    (QREFELT % 21)))
                                    (QCDR #19#)
                                  (|check_union2| (QEQCAR #19# 0)
                                                  (|SparseUnivariatePolynomial|
                                                   (QREFELT % 7))
                                                  (|Union|
                                                   (|SparseUnivariatePolynomial|
                                                    (QREFELT % 7))
                                                   #30#)
                                                  #19#)))
                          (LETT |aa| (QVELT |dres| 1))
                          (LETT |oans| (QVELT |dres| 0))
                          (LETT |lq|
                                (PROGN
                                 (LETT #20# NIL)
                                 (SEQ (LETT |c| NIL)
                                      (LETT #21# (QVELT |dres| 4)) G190
                                      (COND
                                       ((OR (ATOM #21#)
                                            (PROGN (LETT |c| (CAR #21#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #20#
                                              (CONS
                                               (SPADCALL |c| |g|
                                                         (QREFELT % 78))
                                               #20#))))
                                      (LETT #21# (CDR #21#)) (GO G190) G191
                                      (EXIT (NREVERSE #20#)))))
                          (LETT |lr|
                                (PROGN
                                 (LETT #23# NIL)
                                 (SEQ (LETT |q| NIL) (LETT #24# |lq|) G190
                                      (COND
                                       ((OR (ATOM #24#)
                                            (PROGN (LETT |q| (CAR #24#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #23# (CONS (QCDR |q|) #23#))))
                                      (LETT #24# (CDR #24#)) (GO G190) G191
                                      (EXIT (NREVERSE #23#)))))
                          (LETT |rs1|
                                (SPADCALL (SPADCALL (LIST |lr|) (QREFELT % 52))
                                          (QREFELT % 55)))
                          (LETT |rs2| (SPADCALL |rs1| |get_rs|))
                          (LETT |lkv| (SPADCALL |rs2| (QREFELT % 57)))
                          (EXIT
                           (COND ((NULL |lkv|) NIL)
                                 (#29#
                                  (SEQ
                                   (LETT |lc|
                                         (PROGN
                                          (LETT #25# NIL)
                                          (SEQ (LETT |q| NIL) (LETT #26# |lq|)
                                               G190
                                               (COND
                                                ((OR (ATOM #26#)
                                                     (PROGN
                                                      (LETT |q| (CAR #26#))
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (LETT #25#
                                                       (CONS (QCAR |q|)
                                                             #25#))))
                                               (LETT #26# (CDR #26#)) (GO G190)
                                               G191 (EXIT (NREVERSE #25#)))))
                                   (LETT |nlc| NIL)
                                   (SEQ (LETT |kv| NIL) (LETT #27# |lkv|) G190
                                        (COND
                                         ((OR (ATOM #27#)
                                              (PROGN
                                               (LETT |kv| (CAR #27#))
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT |nlc|
                                                (CONS
                                                 (SPADCALL |kv| |lc|
                                                           (QREFELT % 61))
                                                 |nlc|))))
                                        (LETT #27# (CDR #27#)) (GO G190) G191
                                        (EXIT NIL))
                                   (LETT |nlc| (NREVERSE |nlc|))
                                   (LETT |s2|
                                         (|RDEPAR;param_SPDE| |a| |b| |nlc|
                                          (QVELT |dres| 5) |der| |get_rs|
                                          |do_degrad| |x| %))
                                   (LETT |nres| NIL)
                                   (SEQ (LETT |be| NIL) (LETT #28# |s2|) G190
                                        (COND
                                         ((OR (ATOM #28#)
                                              (PROGN
                                               (LETT |be| (CAR #28#))
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (LETT |bv|
                                               (SPADCALL (QCDR |be|) |lkv|
                                                         (QREFELT % 79)))
                                         (LETT |ans1|
                                               (SPADCALL
                                                (SPADCALL |bv| |oans|
                                                          (QREFELT % 61))
                                                (SPADCALL |aa| (QCAR |be|)
                                                          (QREFELT % 80))
                                                (QREFELT % 81)))
                                         (EXIT
                                          (LETT |nres|
                                                (CONS (CONS |ans1| |bv|)
                                                      |nres|))))
                                        (LETT #28# (CDR #28#)) (GO G190) G191
                                        (EXIT NIL))
                                   (EXIT (NREVERSE |nres|))))))))))))))))) 

(SDEFUN |RDEPAR;integer_vector|
        ((|v| (|Vector| (|Fraction| (|Integer|))))
         (% (|Union| (|Vector| (|Integer|)) "failed")))
        (SPROG
         ((|#G42|
           (|Record| (|:| |num| #1=(|Vector| (|Fraction| (|Integer|))))
                     (|:| |den| #2=(|Integer|))))
          (|nv| #1#) (|d| #2#) (#3=#:G199 NIL) (|i| NIL) (#4=#:G200 NIL))
         (SEQ
          (PROGN
           (LETT |#G42| (SPADCALL |v| (QREFELT % 85)))
           (LETT |nv| (QCAR |#G42|))
           (LETT |d| (QCDR |#G42|))
           |#G42|)
          (EXIT
           (COND
            ((OR (SPADCALL |d| 1 (QREFELT % 86))
                 (SPADCALL (SPADCALL |nv| 1 (QREFELT % 87))
                           (|spadConstant| % 88) (QREFELT % 89)))
             (CONS 1 "failed"))
            ('T
             (CONS 0
                   (SPADCALL
                    (PROGN
                     (LETT #3# NIL)
                     (SEQ (LETT |i| 1) (LETT #4# (QVSIZE |nv|)) G190
                          (COND ((|greater_SI| |i| #4#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #3#
                                  (CONS
                                   (SPADCALL (SPADCALL |nv| |i| (QREFELT % 87))
                                             (QREFELT % 90))
                                   #3#))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT (NREVERSE #3#))))
                    (QREFELT % 93))))))))) 

(SDEFUN |RDEPAR;do_SPDE_prim0|
        ((|b| (F)) (|lc| (|List| (|SparseUnivariatePolynomial| F)))
         (|lk| (|List| (|Kernel| F)))
         (|ext|
          (|Mapping|
           (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
           (|List| (|Kernel| F)) (|List| F)))
         (|logi|
          (|Mapping|
           (|Record| (|:| |logands| (|List| F))
                     (|:| |basis|
                          (|List| (|Vector| (|Fraction| (|Integer|))))))
           (|List| (|Kernel| F)) (|List| F)))
         (|der|
          (|Mapping| (|SparseUnivariatePolynomial| F)
                     (|SparseUnivariatePolynomial| F)))
         (|get_rs| (|Mapping| (|Matrix| F) (|Matrix| F))) (|x| (|Symbol|))
         (%
          (|List|
           (|Record|
            (|:| |ratpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |coeffs| (|Vector| F))))))
        (SPROG
         ((|n| (|NonNegativeInteger|))
          (|vg2| (|Vector| (|SparseUnivariatePolynomial| F))) (#1=#:G249 NIL)
          (#2=#:G250 NIL) (#3=#:G252 NIL) (#4=#:G251 NIL) (#5=#:G253 NIL)
          (|c| NIL) (#6=#:G254 NIL) (|d| (|Integer|)) (|dk| (F))
          (#7=#:G255 NIL) (#8=#:G256 NIL) (#9=#:G257 NIL) (#10=#:G258 NIL)
          (|j| NIL) (|i| NIL) (#11=#:G259 NIL)
          (|gi| (|SparseUnivariatePolynomial| F)) (|gij| (F))
          (|lgj| (|List| F)) (|aa| NIL) (#12=#:G261 NIL) (#13=#:G260 NIL)
          (|ff| (F)) (|lgj1| (|List| F))
          (|s2f|
           (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
          (#14=#:G262 NIL) (#15=#:G263 NIL) (|ncb| (|List| (|Vector| F)))
          (#16=#:G264 NIL) (#17=#:G265 NIL) (|cba| (|List| F)) (#18=#:G266 NIL)
          (|be| NIL) (#19=#:G267 NIL) (#20=#:G241 NIL)
          (|nlba| (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|cb| (|List| (|Vector| F)))
          (|lba| (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
          (#21=#:G268 NIL) (|bv| NIL) (#22=#:G270 NIL) (|ba| NIL)
          (#23=#:G269 NIL))
         (SEQ (LETT |n| (LENGTH |lc|))
              (LETT |vg2| (SPADCALL |lc| (QREFELT % 95)))
              (LETT |cb|
                    (PROGN
                     (LETT #1# NIL)
                     (SEQ (LETT |i| 1) (LETT #2# |n|) G190
                          (COND ((|greater_SI| |i| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #1#
                                  (CONS (MAKEARR1 |n| (|spadConstant| % 96))
                                        #1#))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT (NREVERSE #1#)))))
              (SEQ (LETT |bv| NIL) (LETT #3# |cb|) (LETT |i| 1) (LETT #4# |n|)
                   G190
                   (COND
                    ((OR (|greater_SI| |i| #4#) (ATOM #3#)
                         (PROGN (LETT |bv| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |bv| |i| (|spadConstant| % 63) (QREFELT % 97))))
                   (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #3# (CDR #3#))))
                   (GO G190) G191 (EXIT NIL))
              (LETT |d|
                    (SPADCALL (ELT % 98)
                              (PROGN
                               (LETT #5# NIL)
                               (SEQ (LETT |c| NIL) (LETT #6# |lc|) G190
                                    (COND
                                     ((OR (ATOM #6#)
                                          (PROGN (LETT |c| (CAR #6#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #5#
                                            (CONS (SPADCALL |c| (QREFELT % 66))
                                                  #5#))))
                                    (LETT #6# (CDR #6#)) (GO G190) G191
                                    (EXIT (NREVERSE #5#))))
                              0 (QREFELT % 100)))
              (LETT |dk|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (|spadConstant| % 63) 1 (QREFELT % 65)) |der|)
                     (QREFELT % 101)))
              (LETT |lba|
                    (PROGN
                     (LETT #7# NIL)
                     (SEQ (LETT |bv| NIL) (LETT #8# |cb|) G190
                          (COND
                           ((OR (ATOM #8#) (PROGN (LETT |bv| (CAR #8#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT (LETT #7# (CONS (|spadConstant| % 102) #7#))))
                          (LETT #8# (CDR #8#)) (GO G190) G191
                          (EXIT (NREVERSE #7#)))))
              (LETT |cba|
                    (PROGN
                     (LETT #9# NIL)
                     (SEQ (LETT |bv| NIL) (LETT #10# |cb|) G190
                          (COND
                           ((OR (ATOM #10#) (PROGN (LETT |bv| (CAR #10#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT (LETT #9# (CONS (|spadConstant| % 96) #9#))))
                          (LETT #10# (CDR #10#)) (GO G190) G191
                          (EXIT (NREVERSE #9#)))))
              (SEQ (LETT |j| |d|) G190 (COND ((< |j| 0) (GO G191)))
                   (SEQ (LETT |lgj| NIL)
                        (SEQ (LETT |i| 1) (LETT #11# |n|) G190
                             (COND ((|greater_SI| |i| #11#) (GO G191)))
                             (SEQ
                              (LETT |gi| (SPADCALL |vg2| |i| (QREFELT % 103)))
                              (LETT |gij| (|spadConstant| % 96))
                              (COND
                               ((EQL (SPADCALL |gi| (QREFELT % 66)) |j|)
                                (SEQ
                                 (LETT |gij| (SPADCALL |gi| (QREFELT % 104)))
                                 (EXIT
                                  (SPADCALL |vg2| |i|
                                            (SPADCALL |gi| (QREFELT % 105))
                                            (QREFELT % 106))))))
                              (EXIT
                               (LETT |lgj|
                                     (CONS (SPADCALL |gij| (QREFELT % 107))
                                           |lgj|))))
                             (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                             (EXIT NIL))
                        (LETT |lgj| (NREVERSE |lgj|)) (LETT |lgj1| NIL)
                        (SEQ (LETT |aa| NIL) (LETT #12# |cba|) (LETT |bv| NIL)
                             (LETT #13# |cb|) G190
                             (COND
                              ((OR (ATOM #13#)
                                   (PROGN (LETT |bv| (CAR #13#)) NIL)
                                   (ATOM #12#)
                                   (PROGN (LETT |aa| (CAR #12#)) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |ff|
                                    (SPADCALL
                                     (SPADCALL |bv| |lgj| (QREFELT % 109))
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL (+ |j| 1) (QREFELT % 43)) |dk|
                                       (QREFELT % 110))
                                      |aa| (QREFELT % 110))
                                     (QREFELT % 111)))
                              (EXIT (LETT |lgj1| (CONS |ff| |lgj1|))))
                             (LETT #13#
                                   (PROG1 (CDR #13#) (LETT #12# (CDR #12#))))
                             (GO G190) G191 (EXIT NIL))
                        (LETT |lgj1| (NREVERSE |lgj1|))
                        (LETT |s2f|
                              (SPADCALL |b| |lgj1| |x| |lk| |ext| |logi|
                                        (QREFELT % 118)))
                        (LETT |ncb|
                              (PROGN
                               (LETT #14# NIL)
                               (SEQ (LETT |be| NIL) (LETT #15# |s2f|) G190
                                    (COND
                                     ((OR (ATOM #15#)
                                          (PROGN (LETT |be| (CAR #15#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #14#
                                            (CONS
                                             (SPADCALL (QCDR |be|) |cb|
                                                       (QREFELT % 79))
                                             #14#))))
                                    (LETT #15# (CDR #15#)) (GO G190) G191
                                    (EXIT (NREVERSE #14#)))))
                        (LETT |cba|
                              (PROGN
                               (LETT #16# NIL)
                               (SEQ (LETT |be| NIL) (LETT #17# |s2f|) G190
                                    (COND
                                     ((OR (ATOM #17#)
                                          (PROGN (LETT |be| (CAR #17#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #16# (CONS (QCAR |be|) #16#))))
                                    (LETT #17# (CDR #17#)) (GO G190) G191
                                    (EXIT (NREVERSE #16#)))))
                        (LETT |nlba|
                              (PROGN
                               (LETT #18# NIL)
                               (SEQ (LETT |be| NIL) (LETT #19# |s2f|) G190
                                    (COND
                                     ((OR (ATOM #19#)
                                          (PROGN (LETT |be| (CAR #19#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #18#
                                            (CONS
                                             (SPADCALL
                                              (SPADCALL (QCDR |be|) |lba|
                                                        (QREFELT % 120))
                                              (SPADCALL
                                               (SPADCALL (QCAR |be|)
                                                         (PROG1 (LETT #20# |j|)
                                                           (|check_subtype2|
                                                            (>= #20# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #20#))
                                                         (QREFELT % 65))
                                               (QREFELT % 72))
                                              (QREFELT % 121))
                                             #18#))))
                                    (LETT #19# (CDR #19#)) (GO G190) G191
                                    (EXIT (NREVERSE #18#)))))
                        (LETT |cb| |ncb|) (EXIT (LETT |lba| |nlba|)))
                   (LETT |j| (+ |j| -1)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (PROGN
                (LETT #21# NIL)
                (SEQ (LETT |bv| NIL) (LETT #22# |cb|) (LETT |ba| NIL)
                     (LETT #23# |lba|) G190
                     (COND
                      ((OR (ATOM #23#) (PROGN (LETT |ba| (CAR #23#)) NIL)
                           (ATOM #22#) (PROGN (LETT |bv| (CAR #22#)) NIL))
                       (GO G191)))
                     (SEQ (EXIT (LETT #21# (CONS (CONS |ba| |bv|) #21#))))
                     (LETT #23# (PROG1 (CDR #23#) (LETT #22# (CDR #22#))))
                     (GO G190) G191 (EXIT (NREVERSE #21#)))))))) 

(SDEFUN |RDEPAR;do_ext|
        ((|ext|
          (|Mapping|
           #1=(|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
           (|List| (|Kernel| F)) (|List| F)))
         (|lcr| (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
         (|k| (|Kernel| F)) (|lk| (|List| (|Kernel| F)))
         (%
          (|List|
           (|Record|
            (|:| |ratpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |coeffs| (|Vector| F))))))
        (SPROG
         ((#2=#:G278 NIL) (|cr| NIL) (#3=#:G279 NIL) (|lc| (|List| F))
          (|res1| #1#) (#4=#:G280 NIL) (|be| NIL) (#5=#:G281 NIL))
         (SEQ
          (LETT |lc|
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |cr| NIL) (LETT #3# |lcr|) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |cr| (CAR #3#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (SPADCALL |cr| |k| (QREFELT % 123)) #2#))))
                      (LETT #3# (CDR #3#)) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))
          (LETT |res1| (SPADCALL |lk| |lc| |ext|))
          (EXIT
           (PROGN
            (LETT #4# NIL)
            (SEQ (LETT |be| NIL) (LETT #5# |res1|) G190
                 (COND
                  ((OR (ATOM #5#) (PROGN (LETT |be| (CAR #5#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #4#
                         (CONS
                          (CONS (SPADCALL (QCAR |be|) |k| (QREFELT % 125))
                                (QCDR |be|))
                          #4#))))
                 (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT (NREVERSE #4#)))))))) 

(SDEFUN |RDEPAR;do_SPDE_prim|
        ((|a| (|SparseUnivariatePolynomial| F))
         (|bbr| (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|is_der| (|Boolean|))
         (|lcr| (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
         (|k| (|Kernel| F)) (|lk| (|List| (|Kernel| F)))
         (|ext|
          (|Mapping|
           (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
           (|List| (|Kernel| F)) (|List| F)))
         (|logi|
          (|Mapping|
           #1=(|Record| (|:| |logands| #2=(|List| F))
                        (|:| |basis|
                             #3=(|List| (|Vector| (|Fraction| (|Integer|))))))
           (|List| (|Kernel| F)) (|List| F)))
         (|der|
          (|Mapping| (|SparseUnivariatePolynomial| F)
                     (|SparseUnivariatePolynomial| F)))
         (|get_rs| (|Mapping| (|Matrix| F) (|Matrix| F))) (|x| (|Symbol|))
         (%
          (|List|
           (|Record|
            (|:| |ratpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |coeffs| (|Vector| F))))))
        (SPROG
         ((|fp| (F)) (|base_case| (|Boolean|))
          (|b| (|SparseUnivariatePolynomial| F)) (#4=#:G336 NIL) (|cr| NIL)
          (#5=#:G337 NIL) (|lc| (|List| (|SparseUnivariatePolynomial| F)))
          (|da| #6=(|NonNegativeInteger|)) (|db| #6#) (#7=#:G338 NIL) (|c| NIL)
          (#8=#:G339 NIL) (|dc| (|Integer|)) (|#G86| #1#) (|ll| #2#) (|bl| #3#)
          (|bv| (|Vector| (|Fraction| (|Integer|))))
          (|bvu| (|Union| (|Vector| (|Integer|)) "failed")) (|f0| (F))
          (|b1| (|SparseUnivariatePolynomial| F)) (|f1| (F))
          (|r0|
           (|Union| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))
                    "failed"))
          (|mf| (F)) (|mu| (|Union| (|Integer|) "failed")) (|n| (|Integer|))
          (|do_degrad|
           (|Mapping|
            (|List|
             (|Record|
              (|:| |ratpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
              (|:| |coeffs| (|Vector| F))))
            (|Fraction| (|SparseUnivariatePolynomial| F))
            (|List| (|Fraction| (|SparseUnivariatePolynomial| F)))))
          (|res1|
           (|List|
            (|Record| (|:| |ratpart| (|SparseUnivariatePolynomial| F))
                      (|:| |coeffs| (|Vector| F)))))
          (#9=#:G340 NIL) (|re| NIL) (#10=#:G341 NIL))
         (SEQ
          (LETT |fp|
                (SPADCALL
                 (SPADCALL (SPADCALL (|spadConstant| % 63) 1 (QREFELT % 65))
                           |der|)
                 (QREFELT % 101)))
          (LETT |base_case|
                (SPADCALL |fp| (|spadConstant| % 63) (QREFELT % 126)))
          (LETT |b| (SPADCALL |bbr| (QREFELT % 73)))
          (LETT |lc|
                (PROGN
                 (LETT #4# NIL)
                 (SEQ (LETT |cr| NIL) (LETT #5# |lcr|) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |cr| (CAR #5#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4# (CONS (SPADCALL |cr| (QREFELT % 73)) #4#))))
                      (LETT #5# (CDR #5#)) (GO G190) G191
                      (EXIT (NREVERSE #4#)))))
          (LETT |da| (SPADCALL |a| (QREFELT % 66)))
          (LETT |db| (SPADCALL |b| (QREFELT % 66)))
          (LETT |dc|
                (SPADCALL (ELT % 98)
                          (PROGN
                           (LETT #7# NIL)
                           (SEQ (LETT |c| NIL) (LETT #8# |lc|) G190
                                (COND
                                 ((OR (ATOM #8#)
                                      (PROGN (LETT |c| (CAR #8#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #7#
                                        (CONS (SPADCALL |c| (QREFELT % 66))
                                              #7#))))
                                (LETT #8# (CDR #8#)) (GO G190) G191
                                (EXIT (NREVERSE #7#))))
                          (QREFELT % 127)))
          (COND
           ((NULL |base_case|)
            (COND
             ((EQL |da| 0)
              (COND
               ((EQL |db| 0)
                (EXIT
                 (SEQ
                  (LETT |b1|
                        (SPADCALL (SPADCALL |b| (QREFELT % 101))
                                  (SPADCALL |a| (QREFELT % 101))
                                  (QREFELT % 128)))
                  (EXIT
                   (COND
                    ((SPADCALL |b1| (|spadConstant| % 96) (QREFELT % 126))
                     (|RDEPAR;do_ext| |ext| |lcr| |k| |lk| %))
                    (#11='T
                     (SEQ
                      (COND
                       ((NULL |is_der|)
                        (SEQ
                         (PROGN
                          (LETT |#G86| (SPADCALL |lk| (LIST |b1|) |logi|))
                          (LETT |ll| (QCAR |#G86|))
                          (LETT |bl| (QCDR |#G86|))
                          |#G86|)
                         (EXIT
                          (COND
                           ((NULL (NULL |bl|))
                            (SEQ (LETT |bv| (|SPADfirst| |bl|))
                                 (LETT |bvu| (|RDEPAR;integer_vector| |bv| %))
                                 (EXIT
                                  (COND
                                   ((QEQCAR |bvu| 0)
                                    (|error|
                                     "need transform and call ext")))))))))))
                      (EXIT
                       (|RDEPAR;do_SPDE_prim0| |b1| |lc| |lk| |ext| |logi|
                        |der| |get_rs| |x| %))))))))))))))
          (LETT |n|
                (COND ((> |db| |da|) (MAX 0 (- |dc| |db|)))
                      (#11# (MAX 0 (+ (- |dc| |da|) 1)))))
          (COND
           ((EQL |da| (+ |db| 1))
            (SEQ
             (LETT |f0|
                   (SPADCALL
                    (SPADCALL (SPADCALL |b| (QREFELT % 104))
                              (SPADCALL |a| (QREFELT % 104)) (QREFELT % 128))
                    (QREFELT % 107)))
             (EXIT
              (COND
               (|base_case|
                (SEQ (LETT |mu| (SPADCALL |f0| (QREFELT % 129)))
                     (EXIT
                      (COND
                       ((QEQCAR |mu| 0) (LETT |n| (MAX |n| (QCDR |mu|))))))))
               (#11#
                (SEQ
                 (LETT |r0|
                       (QCAR
                        (SPADCALL
                         (SPADCALL |lk|
                                   (LIST (SPADCALL |f0| (QREFELT % 107)) |fp|)
                                   |ext|)
                         (QREFELT % 132))))
                 (EXIT
                  (COND
                   ((NULL (QEQCAR |r0| 1))
                    (SEQ
                     (LETT |mf|
                           (SPADCALL (QCDR (QCDR |r0|)) 1 (QREFELT % 133)))
                     (LETT |mu| (SPADCALL |mf| (QREFELT % 129)))
                     (EXIT
                      (COND
                       ((QEQCAR |mu| 0)
                        (LETT |n| (MAX |n| (QCDR |mu|)))))))))))))))))
          (COND
           ((NULL |base_case|)
            (COND
             ((EQL |da| |db|)
              (SEQ
               (LETT |f0|
                     (SPADCALL
                      (SPADCALL (SPADCALL |b| (QREFELT % 104))
                                (SPADCALL |a| (QREFELT % 104)) (QREFELT % 128))
                      (QREFELT % 107)))
               (LETT |b1|
                     (SPADCALL (SPADCALL |f0| |a| (QREFELT % 32)) |b|
                               (QREFELT % 81)))
               (EXIT
                (COND
                 ((EQL (+ (SPADCALL |b1| (QREFELT % 66)) 1) |da|)
                  (SEQ
                   (LETT |f1|
                         (SPADCALL
                          (SPADCALL (SPADCALL |b1| (QREFELT % 104))
                                    (SPADCALL |a| (QREFELT % 104))
                                    (QREFELT % 128))
                          (QREFELT % 107)))
                   (LETT |r0|
                         (QCAR
                          (SPADCALL
                           (SPADCALL |lk|
                                     (LIST (SPADCALL |f1| (QREFELT % 107))
                                           |fp|)
                                     |ext|)
                           (QREFELT % 132))))
                   (EXIT
                    (COND
                     ((NULL (QEQCAR |r0| 1))
                      (SEQ
                       (LETT |mf|
                             (SPADCALL (QCDR (QCDR |r0|)) 1 (QREFELT % 133)))
                       (LETT |mu| (SPADCALL |mf| (QREFELT % 129)))
                       (EXIT
                        (COND
                         ((QEQCAR |mu| 0)
                          (LETT |n| (MAX |n| (QCDR |mu|)))))))))))))))))))
          (LETT |do_degrad|
                (CONS #'|RDEPAR;do_SPDE_prim!0|
                      (VECTOR |x| |get_rs| |der| |logi| |ext| |lk| |k| |is_der|
                              %)))
          (LETT |res1|
                (|RDEPAR;param_SPDE| |a| |b| |lc| |n| |der| |get_rs|
                 |do_degrad| |x| %))
          (EXIT
           (PROGN
            (LETT #9# NIL)
            (SEQ (LETT |re| NIL) (LETT #10# |res1|) G190
                 (COND
                  ((OR (ATOM #10#) (PROGN (LETT |re| (CAR #10#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #9#
                         (CONS
                          (CONS (SPADCALL (QCAR |re|) (QREFELT % 72))
                                (QCDR |re|))
                          #9#))))
                 (LETT #10# (CDR #10#)) (GO G190) G191
                 (EXIT (NREVERSE #9#)))))))) 

(SDEFUN |RDEPAR;do_SPDE_prim!0| ((|bb| NIL) (|lc1| NIL) ($$ NIL))
        (PROG (% |is_der| |k| |lk| |ext| |logi| |der| |get_rs| |x|)
          (LETT % (QREFELT $$ 8))
          (LETT |is_der| (QREFELT $$ 7))
          (LETT |k| (QREFELT $$ 6))
          (LETT |lk| (QREFELT $$ 5))
          (LETT |ext| (QREFELT $$ 4))
          (LETT |logi| (QREFELT $$ 3))
          (LETT |der| (QREFELT $$ 2))
          (LETT |get_rs| (QREFELT $$ 1))
          (LETT |x| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|RDEPAR;do_SPDE_prim| (|spadConstant| % 67) |bb| |is_der| |lc1|
             |k| |lk| |ext| |logi| |der| |get_rs| |x| %))))) 

(SDEFUN |RDEPAR;do_SPDE_exp0|
        ((|a| (F)) (|b| (F))
         (|lcr|
          (|List| (|LaurentPolynomial| F (|SparseUnivariatePolynomial| F))))
         (|lk| (|List| (|Kernel| F))) (|eta| (F))
         (|ext|
          (|Mapping|
           (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
           (|List| (|Kernel| F)) (|List| F)))
         (|logi|
          (|Mapping|
           (|Record| (|:| |logands| (|List| F))
                     (|:| |basis|
                          (|List| (|Vector| (|Fraction| (|Integer|))))))
           (|List| (|Kernel| F)) (|List| F)))
         (|x| (|Symbol|))
         (%
          (|List|
           (|Record|
            (|:| |ratpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |coeffs| (|Vector| F))))))
        (SPROG
         ((|n| (|NonNegativeInteger|))
          (|vg2|
           (|Vector| (|LaurentPolynomial| F (|SparseUnivariatePolynomial| F))))
          (#1=#:G380 NIL) (#2=#:G381 NIL) (#3=#:G383 NIL) (#4=#:G382 NIL)
          (#5=#:G384 NIL) (#6=#:G385 NIL) (#7=#:G386 NIL) (|cr| NIL)
          (#8=#:G387 NIL) (|d| #9=(|Integer|)) (|f0| (F)) (|i| NIL)
          (#10=#:G388 NIL)
          (|gi| (|LaurentPolynomial| F (|SparseUnivariatePolynomial| F)))
          (|last_iter| (|Boolean|)) (|gij| (F)) (#11=#:G379 NIL)
          (|lgj| (|List| F)) (#12=#:G389 NIL) (|ff| (F)) (|lgj1| (|List| F))
          (|s2f|
           (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
          (#13=#:G390 NIL) (#14=#:G391 NIL) (|ncb| (|List| (|Vector| F)))
          (#15=#:G392 NIL) (|be| NIL) (#16=#:G393 NIL)
          (|nlba|
           (|List| (|LaurentPolynomial| F (|SparseUnivariatePolynomial| F))))
          (|cb| (|List| (|Vector| F)))
          (|lba|
           (|List| (|LaurentPolynomial| F (|SparseUnivariatePolynomial| F))))
          (|j| #9#) (#17=#:G394 NIL) (|bv| NIL) (#18=#:G396 NIL) (|re| NIL)
          (#19=#:G395 NIL))
         (SEQ (LETT |n| (LENGTH |lcr|))
              (LETT |vg2| (SPADCALL |lcr| (QREFELT % 136)))
              (LETT |cb|
                    (PROGN
                     (LETT #1# NIL)
                     (SEQ (LETT |cr| NIL) (LETT #2# |lcr|) G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT |cr| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #1#
                                  (CONS (MAKEARR1 |n| (|spadConstant| % 96))
                                        #1#))))
                          (LETT #2# (CDR #2#)) (GO G190) G191
                          (EXIT (NREVERSE #1#)))))
              (SEQ (LETT |bv| NIL) (LETT #3# |cb|) (LETT |i| 1) (LETT #4# |n|)
                   G190
                   (COND
                    ((OR (|greater_SI| |i| #4#) (ATOM #3#)
                         (PROGN (LETT |bv| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |bv| |i| (|spadConstant| % 63) (QREFELT % 97))))
                   (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #3# (CDR #3#))))
                   (GO G190) G191 (EXIT NIL))
              (LETT |lba|
                    (PROGN
                     (LETT #5# NIL)
                     (SEQ (LETT |cr| NIL) (LETT #6# |lcr|) G190
                          (COND
                           ((OR (ATOM #6#) (PROGN (LETT |cr| (CAR #6#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT (LETT #5# (CONS (|spadConstant| % 137) #5#))))
                          (LETT #6# (CDR #6#)) (GO G190) G191
                          (EXIT (NREVERSE #5#)))))
              (LETT |d|
                    (SPADCALL (ELT % 98)
                              (PROGN
                               (LETT #7# NIL)
                               (SEQ (LETT |cr| NIL) (LETT #8# |lcr|) G190
                                    (COND
                                     ((OR (ATOM #8#)
                                          (PROGN (LETT |cr| (CAR #8#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #7#
                                            (CONS
                                             (SPADCALL |cr| (QREFELT % 138))
                                             #7#))))
                                    (LETT #8# (CDR #8#)) (GO G190) G191
                                    (EXIT (NREVERSE #7#))))
                              (QREFELT % 127)))
              (LETT |j| |d|) (LETT |f0| (SPADCALL |b| |a| (QREFELT % 128)))
              (SEQ
               (EXIT
                (SEQ G190 NIL
                     (SEQ (LETT |last_iter| 'T) (LETT |lgj| NIL)
                          (SEQ (LETT |i| 1) (LETT #10# |n|) G190
                               (COND ((|greater_SI| |i| #10#) (GO G191)))
                               (SEQ
                                (LETT |gi|
                                      (SPADCALL |vg2| |i| (QREFELT % 139)))
                                (LETT |gij| (|spadConstant| % 96))
                                (COND
                                 ((SPADCALL |gi| (|spadConstant| % 137)
                                            (QREFELT % 140))
                                  (SEQ (LETT |last_iter| NIL)
                                       (EXIT
                                        (COND
                                         ((EQL (SPADCALL |gi| (QREFELT % 138))
                                               |j|)
                                          (SEQ
                                           (LETT |gij|
                                                 (SPADCALL |gi|
                                                           (QREFELT % 141)))
                                           (EXIT
                                            (SPADCALL |vg2| |i|
                                                      (SPADCALL |gi|
                                                                (QREFELT %
                                                                         142))
                                                      (QREFELT % 143))))))))))
                                (EXIT (LETT |lgj| (CONS |gij| |lgj|))))
                               (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                               (EXIT NIL))
                          (EXIT
                           (COND
                            (|last_iter|
                             (PROGN (LETT #11# |$NoValue|) (GO #20=#:G374)))
                            ('T
                             (SEQ (LETT |lgj| (NREVERSE |lgj|))
                                  (LETT |lgj1| NIL)
                                  (SEQ (LETT |bv| NIL) (LETT #12# |cb|) G190
                                       (COND
                                        ((OR (ATOM #12#)
                                             (PROGN
                                              (LETT |bv| (CAR #12#))
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (LETT |ff|
                                              (SPADCALL |bv| |lgj|
                                                        (QREFELT % 109)))
                                        (EXIT
                                         (LETT |lgj1|
                                               (CONS
                                                (SPADCALL |ff| (QREFELT % 107))
                                                |lgj1|))))
                                       (LETT #12# (CDR #12#)) (GO G190) G191
                                       (EXIT NIL))
                                  (LETT |lgj1| (NREVERSE |lgj1|))
                                  (LETT |s2f|
                                        (SPADCALL
                                         (SPADCALL |f0|
                                                   (SPADCALL
                                                    (SPADCALL |j|
                                                              (QREFELT % 43))
                                                    |eta| (QREFELT % 110))
                                                   (QREFELT % 111))
                                         |lgj1| |x| |lk| |ext| |logi|
                                         (QREFELT % 118)))
                                  (LETT |ncb|
                                        (PROGN
                                         (LETT #13# NIL)
                                         (SEQ (LETT |be| NIL) (LETT #14# |s2f|)
                                              G190
                                              (COND
                                               ((OR (ATOM #14#)
                                                    (PROGN
                                                     (LETT |be| (CAR #14#))
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #13#
                                                      (CONS
                                                       (SPADCALL (QCDR |be|)
                                                                 |cb|
                                                                 (QREFELT %
                                                                          79))
                                                       #13#))))
                                              (LETT #14# (CDR #14#)) (GO G190)
                                              G191 (EXIT (NREVERSE #13#)))))
                                  (LETT |nlba|
                                        (PROGN
                                         (LETT #15# NIL)
                                         (SEQ (LETT |be| NIL) (LETT #16# |s2f|)
                                              G190
                                              (COND
                                               ((OR (ATOM #16#)
                                                    (PROGN
                                                     (LETT |be| (CAR #16#))
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #15#
                                                      (CONS
                                                       (SPADCALL
                                                        (SPADCALL (QCDR |be|)
                                                                  |lba|
                                                                  (QREFELT %
                                                                           144))
                                                        (SPADCALL (QCAR |be|)
                                                                  |j|
                                                                  (QREFELT %
                                                                           145))
                                                        (QREFELT % 146))
                                                       #15#))))
                                              (LETT #16# (CDR #16#)) (GO G190)
                                              G191 (EXIT (NREVERSE #15#)))))
                                  (LETT |cb| |ncb|) (LETT |lba| |nlba|)
                                  (EXIT (LETT |j| (- |j| 1))))))))
                     NIL (GO G190) G191 (EXIT NIL)))
               #20# (EXIT #11#))
              (EXIT
               (PROGN
                (LETT #17# NIL)
                (SEQ (LETT |bv| NIL) (LETT #18# |cb|) (LETT |re| NIL)
                     (LETT #19# |lba|) G190
                     (COND
                      ((OR (ATOM #19#) (PROGN (LETT |re| (CAR #19#)) NIL)
                           (ATOM #18#) (PROGN (LETT |bv| (CAR #18#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #17#
                             (CONS (CONS (SPADCALL |re| (QREFELT % 147)) |bv|)
                                   #17#))))
                     (LETT #19# (PROG1 (CDR #19#) (LETT #18# (CDR #18#))))
                     (GO G190) G191 (EXIT (NREVERSE #17#)))))))) 

(SDEFUN |RDEPAR;exp_lower_bound;SupLp2ILFMI;11|
        ((|a| (|SparseUnivariatePolynomial| F))
         (|b| (|LaurentPolynomial| F (|SparseUnivariatePolynomial| F)))
         (|ob| (|Integer|)) (|nc0| (|Integer|)) (|lk| (|List| (|Kernel| F)))
         (|eta| (F))
         (|logi|
          (|Mapping|
           (|Record| (|:| |logands| (|List| F))
                     (|:| |basis|
                          (|List| (|Vector| (|Fraction| (|Integer|))))))
           (|List| (|Kernel| F)) (|List| F)))
         (% (|Integer|)))
        (SPROG
         ((|n0| (|Integer|)) (|c0| (F))
          (|#G116|
           (|Record| (|:| |logands| #1=(|List| F))
                     (|:| |basis|
                          #2=(|List| (|Vector| (|Fraction| (|Integer|)))))))
          (|ll| #1#) (|bl| #2#) (|bv| (|Vector| (|Fraction| (|Integer|))))
          (|nu| (|Union| (|Integer|) "failed")))
         (SEQ
          (COND ((< |ob| 0) (MIN 0 (- |nc0| |ob|)))
                (#3='T
                 (SEQ (LETT |n0| (MIN 0 |nc0|))
                      (EXIT
                       (COND ((< 0 |ob|) |n0|)
                             (#3#
                              (SEQ
                               (LETT |c0|
                                     (SPADCALL (SPADCALL |b| 0 (QREFELT % 148))
                                               (SPADCALL |a| 0 (QREFELT % 149))
                                               (QREFELT % 128)))
                               (PROGN
                                (LETT |#G116|
                                      (SPADCALL |lk| (LIST |c0| |eta|) |logi|))
                                (LETT |ll| (QCAR |#G116|))
                                (LETT |bl| (QCDR |#G116|))
                                |#G116|)
                               (EXIT
                                (COND ((NULL |bl|) |n0|)
                                      (#3#
                                       (SEQ (LETT |bv| (|SPADfirst| |bl|))
                                            (LETT |nu|
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL |bv| 2
                                                              (QREFELT % 87))
                                                    (SPADCALL |bv| 1
                                                              (QREFELT % 87))
                                                    (QREFELT % 150))
                                                   (QREFELT % 40)))
                                            (EXIT
                                             (COND ((QEQCAR |nu| 1) |n0|)
                                                   (#3#
                                                    (MIN (QCDR |nu|)
                                                         |n0|)))))))))))))))))) 

(SDEFUN |RDEPAR;exp_upper_bound|
        ((|a| (|SparseUnivariatePolynomial| F))
         (|b| (|SparseUnivariatePolynomial| F)) (|nc1| (|Integer|))
         (|lk| (|List| (|Kernel| F))) (|eta| (F))
         (|logi|
          (|Mapping|
           #1=(|Record| (|:| |logands| #2=(|List| F))
                        (|:| |basis|
                             #3=(|List| (|Vector| (|Fraction| (|Integer|))))))
           (|List| (|Kernel| F)) (|List| F)))
         (% (|Integer|)))
        (SPROG
         ((|da| #4=(|NonNegativeInteger|)) (|db| #4#) (|n0| (|Integer|))
          (|c1| (F)) (|#G123| #1#) (|ll| #2#) (|bl| #3#)
          (|bv| (|Vector| (|Fraction| (|Integer|))))
          (|nu| (|Union| (|Integer|) "failed")))
         (SEQ (LETT |da| (SPADCALL |a| (QREFELT % 66)))
              (LETT |db| (SPADCALL |b| (QREFELT % 66)))
              (EXIT
               (COND ((< |da| |db|) (- |nc1| |db|))
                     (#5='T
                      (SEQ (LETT |n0| (MAX 0 (- |nc1| |da|)))
                           (EXIT
                            (COND ((< |db| |da|) |n0|)
                                  (#5#
                                   (SEQ
                                    (LETT |c1|
                                          (SPADCALL
                                           (SPADCALL |b| (QREFELT % 104))
                                           (SPADCALL |a| (QREFELT % 104))
                                           (QREFELT % 128)))
                                    (PROGN
                                     (LETT |#G123|
                                           (SPADCALL |lk| (LIST |c1| |eta|)
                                                     |logi|))
                                     (LETT |ll| (QCAR |#G123|))
                                     (LETT |bl| (QCDR |#G123|))
                                     |#G123|)
                                    (EXIT
                                     (COND ((NULL |bl|) |n0|)
                                           (#5#
                                            (SEQ (LETT |bv| (|SPADfirst| |bl|))
                                                 (LETT |nu|
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (SPADCALL |bv| 2
                                                                   (QREFELT %
                                                                            87))
                                                         (SPADCALL |bv| 1
                                                                   (QREFELT %
                                                                            87))
                                                         (QREFELT % 150))
                                                        (QREFELT % 40)))
                                                 (EXIT
                                                  (COND ((QEQCAR |nu| 1) |n0|)
                                                        (#5#
                                                         (MAX (QCDR |nu|)
                                                              |n0|))))))))))))))))))) 

(SDEFUN |RDEPAR;do_SPDE_exp|
        ((|a| (|SparseUnivariatePolynomial| F))
         (|bbr| (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|lcr| (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
         (|lk| (|List| (|Kernel| F)))
         (|ext|
          (|Mapping|
           (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
           (|List| (|Kernel| F)) (|List| F)))
         (|logi|
          (|Mapping|
           (|Record| (|:| |logands| (|List| F))
                     (|:| |basis|
                          (|List| (|Vector| (|Fraction| (|Integer|))))))
           (|List| (|Kernel| F)) (|List| F)))
         (|der|
          (|Mapping| (|SparseUnivariatePolynomial| F)
                     (|SparseUnivariatePolynomial| F)))
         (|get_rs| (|Mapping| (|Matrix| F) (|Matrix| F))) (|x| (|Symbol|))
         (%
          (|List|
           (|Record|
            (|:| |ratpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |coeffs| (|Vector| F))))))
        (SPROG
         ((#1=#:G466 NIL) (|cr| NIL) (#2=#:G467 NIL) (|nb0| (|Integer|))
          (#3=#:G468 NIL) (#4=#:G469 NIL) (|nc0| #5=(|Integer|))
          (#6=#:G421 NIL) (|eta| (F)) (|n0| (|Integer|)) (#7=#:G433 NIL)
          (|b| #8=(|LaurentPolynomial| F (|SparseUnivariatePolynomial| F)))
          (|bu| #9=(|SparseUnivariatePolynomial| F)) (|m0| (|Integer|))
          (#10=#:G435 NIL)
          (|t1| (|LaurentPolynomial| F (|SparseUnivariatePolynomial| F)))
          (#11=#:G470 NIL) (#12=#:G471 NIL) (|lc| (|List| #8#))
          (#13=#:G472 NIL) (|c| NIL) (#14=#:G473 NIL) (|lcu| (|List| #9#))
          (#15=#:G474 NIL) (|cu| NIL) (#16=#:G475 NIL) (|nc1| #5#)
          (|n1| (|Integer|))
          (|do_degrad|
           (|Mapping|
            (|List|
             (|Record|
              (|:| |ratpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
              (|:| |coeffs| (|Vector| F))))
            (|Fraction| (|SparseUnivariatePolynomial| F))
            (|List| (|Fraction| (|SparseUnivariatePolynomial| F)))))
          (|res1|
           (|List|
            (|Record| (|:| |ratpart| (|SparseUnivariatePolynomial| F))
                      (|:| |coeffs| (|Vector| F)))))
          (#17=#:G461 NIL) (|tt| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (#18=#:G476 NIL) (|re| NIL) (#19=#:G477 NIL))
         (SEQ (LETT |b| (|RDEPAR;RF_to_GP| |bbr| %))
              (LETT |lc|
                    (PROGN
                     (LETT #1# NIL)
                     (SEQ (LETT |cr| NIL) (LETT #2# |lcr|) G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT |cr| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #1# (CONS (|RDEPAR;RF_to_GP| |cr| %) #1#))))
                          (LETT #2# (CDR #2#)) (GO G190) G191
                          (EXIT (NREVERSE #1#)))))
              (LETT |nb0| (SPADCALL |b| (QREFELT % 152)))
              (LETT |nc0|
                    (SPADCALL (ELT % 153)
                              (PROGN
                               (LETT #3# NIL)
                               (SEQ (LETT |c| NIL) (LETT #4# |lc|) G190
                                    (COND
                                     ((OR (ATOM #4#)
                                          (PROGN (LETT |c| (CAR #4#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #3#
                                            (CONS
                                             (SPADCALL |c| (QREFELT % 152))
                                             #3#))))
                                    (LETT #4# (CDR #4#)) (GO G190) G191
                                    (EXIT (NREVERSE #3#))))
                              (QREFELT % 127)))
              (LETT |eta|
                    (SPADCALL
                     (PROG2
                         (LETT #6#
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (|spadConstant| % 63) 1
                                           (QREFELT % 65))
                                 |der|)
                                (SPADCALL (|spadConstant| % 63) 1
                                          (QREFELT % 65))
                                (QREFELT % 21)))
                         (QCDR #6#)
                       (|check_union2| (QEQCAR #6# 0)
                                       (|SparseUnivariatePolynomial|
                                        (QREFELT % 7))
                                       (|Union|
                                        (|SparseUnivariatePolynomial|
                                         (QREFELT % 7))
                                        "failed")
                                       #6#))
                     (QREFELT % 101)))
              (COND
               ((EQL (SPADCALL |a| (QREFELT % 66)) 0)
                (COND
                 ((EQL (SPADCALL |b| (QREFELT % 138)) 0)
                  (COND
                   ((EQL |nb0| 0)
                    (EXIT
                     (|RDEPAR;do_SPDE_exp0| (SPADCALL |a| (QREFELT % 101))
                      (SPADCALL |b| (QREFELT % 154)) |lc| |lk| |eta| |ext|
                      |logi| |x| %))))))))
              (LETT |n0|
                    (SPADCALL |a| |b| |nb0| |nc0| |lk| |eta| |logi|
                              (QREFELT % 151)))
              (COND
               ((< |n0| 0)
                (LETT |b|
                      (SPADCALL |b|
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |n0| (QREFELT % 43))
                                            |eta| (QREFELT % 110))
                                  (QREFELT % 155))
                                 (SPADCALL |a| (QREFELT % 45)) (QREFELT % 156))
                                (QREFELT % 146)))))
              (COND
               ((< |nb0| 0)
                (SEQ
                 (LETT |t1|
                       (SPADCALL (|spadConstant| % 63)
                                 (PROG1 (LETT #7# (- |nb0|))
                                   (|check_subtype2| (>= #7# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #7#))
                                 (QREFELT % 65)))
                 (LETT |b|
                       (SPADCALL (SPADCALL |t1| (QREFELT % 45)) |b|
                                 (QREFELT % 156)))
                 (EXIT (LETT |a| (SPADCALL |t1| |a| (QREFELT % 80)))))))
              (LETT |bu| (SPADCALL |b| (QREFELT % 157)))
              (LETT |m0| (+ (MIN 0 |n0|) (MIN 0 |nb0|)))
              (COND
               ((< |m0| 0)
                (SEQ
                 (LETT |t1|
                       (SPADCALL (|spadConstant| % 63)
                                 (PROG1 (LETT #10# (- |m0|))
                                   (|check_subtype2| (>= #10# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #10#))
                                 (QREFELT % 145)))
                 (EXIT
                  (LETT |lc|
                        (PROGN
                         (LETT #11# NIL)
                         (SEQ (LETT |c| NIL) (LETT #12# |lc|) G190
                              (COND
                               ((OR (ATOM #12#)
                                    (PROGN (LETT |c| (CAR #12#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #11#
                                      (CONS (SPADCALL |t1| |c| (QREFELT % 156))
                                            #11#))))
                              (LETT #12# (CDR #12#)) (GO G190) G191
                              (EXIT (NREVERSE #11#)))))))))
              (LETT |lcu|
                    (PROGN
                     (LETT #13# NIL)
                     (SEQ (LETT |c| NIL) (LETT #14# |lc|) G190
                          (COND
                           ((OR (ATOM #14#) (PROGN (LETT |c| (CAR #14#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #13#
                                  (CONS (SPADCALL |c| (QREFELT % 157)) #13#))))
                          (LETT #14# (CDR #14#)) (GO G190) G191
                          (EXIT (NREVERSE #13#)))))
              (LETT |nc1|
                    (SPADCALL (ELT % 98)
                              (PROGN
                               (LETT #15# NIL)
                               (SEQ (LETT |cu| NIL) (LETT #16# |lcu|) G190
                                    (COND
                                     ((OR (ATOM #16#)
                                          (PROGN (LETT |cu| (CAR #16#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #15#
                                            (CONS
                                             (SPADCALL |cu| (QREFELT % 66))
                                             #15#))))
                                    (LETT #16# (CDR #16#)) (GO G190) G191
                                    (EXIT (NREVERSE #15#))))
                              (QREFELT % 127)))
              (LETT |n1|
                    (|RDEPAR;exp_upper_bound| |a| |bu| |nc1| |lk| |eta| |logi|
                     %))
              (LETT |do_degrad|
                    (CONS #'|RDEPAR;do_SPDE_exp!0|
                          (VECTOR |x| |logi| |ext| |eta| |lk| %)))
              (LETT |res1|
                    (|RDEPAR;param_SPDE| |a| |bu| |lcu| |n1| |der| |get_rs|
                     |do_degrad| |x| %))
              (LETT |tt|
                    (COND
                     ((< |n0| 0)
                      (SPADCALL
                       (SPADCALL (|spadConstant| % 63)
                                 (PROG1 (LETT #17# (- |n0|))
                                   (|check_subtype2| (>= #17# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #17#))
                                 (QREFELT % 65))
                       (QREFELT % 72)))
                     ('T (|spadConstant| % 158))))
              (EXIT
               (PROGN
                (LETT #18# NIL)
                (SEQ (LETT |re| NIL) (LETT #19# |res1|) G190
                     (COND
                      ((OR (ATOM #19#) (PROGN (LETT |re| (CAR #19#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #18#
                             (CONS
                              (CONS
                               (SPADCALL (SPADCALL (QCAR |re|) (QREFELT % 72))
                                         |tt| (QREFELT % 159))
                               (QCDR |re|))
                              #18#))))
                     (LETT #19# (CDR #19#)) (GO G190) G191
                     (EXIT (NREVERSE #18#)))))))) 

(SDEFUN |RDEPAR;do_SPDE_exp!0| ((|bb| NIL) (|lc1| NIL) ($$ NIL))
        (PROG (% |lk| |eta| |ext| |logi| |x|)
          (LETT % (QREFELT $$ 5))
          (LETT |lk| (QREFELT $$ 4))
          (LETT |eta| (QREFELT $$ 3))
          (LETT |ext| (QREFELT $$ 2))
          (LETT |logi| (QREFELT $$ 1))
          (LETT |x| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G454 NIL) (|c1| NIL) (#2=#:G455 NIL))
                   (SEQ
                    (|RDEPAR;do_SPDE_exp0| (|spadConstant| % 63)
                     (SPADCALL (SPADCALL |bb| (QREFELT % 22)) (QREFELT % 101))
                     (PROGN
                      (LETT #1# NIL)
                      (SEQ (LETT |c1| NIL) (LETT #2# |lc1|) G190
                           (COND
                            ((OR (ATOM #2#) (PROGN (LETT |c1| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #1# (CONS (|RDEPAR;RF_to_GP| |c1| %) #1#))))
                           (LETT #2# (CDR #2#)) (GO G190) G191
                           (EXIT (NREVERSE #1#))))
                     |lk| |eta| |ext| |logi| |x| %))))))) 

(SDEFUN |RDEPAR;param_rde;I2FLSLMMR;14|
        ((|m| (|Integer|)) (|f| (F)) (|g0| (F)) (|lg| (|List| F))
         (|x| (|Symbol|)) (|lk| (|List| (|Kernel| F)))
         (|ext|
          (|Mapping|
           (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
           (|List| (|Kernel| F)) (|List| F)))
         (|logi|
          (|Mapping|
           (|Record| (|:| |logands| (|List| F))
                     (|:| |basis|
                          (|List| (|Vector| (|Fraction| (|Integer|))))))
           (|List| (|Kernel| F)) (|List| F)))
         (%
          (|Record|
           (|:| |particular|
                (|Union|
                 (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))
                 "failed"))
           (|:| |basis|
                (|List|
                 (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))))))
        (SPROG
         ((|lg1| (|List| F))
          (|res1|
           (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))))
         (SEQ (LETT |lg1| (CONS (SPADCALL |g0| (QREFELT % 107)) |lg|))
              (LETT |res1|
                    (SPADCALL |m| |f| |lg1| |x| |lk| |ext| |logi|
                              (QREFELT % 160)))
              (EXIT (SPADCALL |res1| (QREFELT % 132)))))) 

(SDEFUN |RDEPAR;param_rde2;FLSLMML;15|
        ((|fp| (F)) (|lg| (|List| F)) (|x| (|Symbol|))
         (|lk| (|List| (|Kernel| F)))
         (|ext|
          (|Mapping|
           (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
           (|List| (|Kernel| F)) (|List| F)))
         (|logi|
          (|Mapping|
           (|Record| (|:| |logands| (|List| F))
                     (|:| |basis|
                          (|List| (|Vector| (|Fraction| (|Integer|))))))
           (|List| (|Kernel| F)) (|List| F)))
         (% (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))))
        (SPROG
         ((|k| (|Kernel| F)) (#1=#:G545 NIL) (|k1| NIL) (#2=#:G546 NIL)
          (|dku| #3=(|Fraction| (|SparseUnivariatePolynomial| F)))
          (|dk| (|SparseUnivariatePolynomial| F))
          (|der1|
           (|Mapping| (|SparseUnivariatePolynomial| F)
                      (|SparseUnivariatePolynomial| F)))
          (|rl|
           (|List|
            #4=(|Record| (|:| |fctr| (|SparseUnivariatePolynomial| F))
                         (|:| |xpnt| (|Integer|)))))
          (|re| NIL) (#5=#:G547 NIL) (|#G156| #4#)
          (|pii| (|SparseUnivariatePolynomial| F)) (|ni| (|Integer|))
          (|fpu| #3#) (#6=#:G529 NIL) (|p| (|SparseUnivariatePolynomial| F))
          (|pf| (F)) (#7=#:G548 NIL) (|g| NIL) (#8=#:G549 NIL)
          (|lg1| (|List| F))
          (|res1|
           (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
          (#9=#:G550 NIL) (|rs| NIL) (#10=#:G551 NIL))
         (SEQ (LETT |k| (SPADCALL |lk| (QREFELT % 163)))
              (LETT |lk|
                    (PROGN
                     (LETT #1# NIL)
                     (SEQ (LETT |k1| NIL) (LETT #2# |lk|) G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT |k1| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL |k1| |k| (QREFELT % 164))
                              (LETT #1# (CONS |k1| #1#))))))
                          (LETT #2# (CDR #2#)) (GO G190) G191
                          (EXIT (NREVERSE #1#)))))
              (EXIT
               (COND
                ((SPADCALL (SPADCALL |k| (QREFELT % 166)) '|%alg|
                           (QREFELT % 167))
                 (|RDEPAR;do_alg_rde| |fp| |lg| |x| |k| |lk| |ext| |logi| %))
                ((SPADCALL |k| '|%diff| (QREFELT % 168))
                 (|RDEPAR;do_diff_rde| |fp| |lg| |x| |k| |lk| |ext| |logi| %))
                (#11='T
                 (SEQ
                  (LETT |dku|
                        (SPADCALL
                         (SPADCALL (SPADCALL |k| (QREFELT % 31)) |x|
                                   (QREFELT % 169))
                         |k| (QREFELT % 125)))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |dku| (QREFELT % 13))
                               (|spadConstant| % 67) (QREFELT % 69))
                     NIL)
                    (#11#
                     (SEQ (LETT |dk| (SPADCALL |dku| (QREFELT % 22)))
                          (LETT |fpu| (SPADCALL |fp| |k| (QREFELT % 125)))
                          (LETT |der1|
                                (CONS #'|RDEPAR;param_rde2;FLSLMML;15!1|
                                      (VECTOR |dk| |x| %)))
                          (LETT |rl| (|RDEPAR;normalize| |fpu| |der1| %))
                          (LETT |p| (|spadConstant| % 67))
                          (SEQ (LETT |re| NIL) (LETT #5# |rl|) G190
                               (COND
                                ((OR (ATOM #5#)
                                     (PROGN (LETT |re| (CAR #5#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (PROGN
                                 (LETT |#G156| |re|)
                                 (LETT |pii| (QCAR |#G156|))
                                 (LETT |ni| (QCDR |#G156|))
                                 |#G156|)
                                (LETT |fpu|
                                      (SPADCALL |fpu|
                                                (SPADCALL
                                                 (SPADCALL
                                                  (SPADCALL |ni|
                                                            (QREFELT % 43))
                                                  (SPADCALL |pii| |der1|)
                                                  (QREFELT % 32))
                                                 |pii| (QREFELT % 172))
                                                (QREFELT % 173)))
                                (EXIT
                                 (LETT |p|
                                       (SPADCALL
                                        (SPADCALL |pii|
                                                  (PROG1 (LETT #6# |ni|)
                                                    (|check_subtype2|
                                                     (>= #6# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #6#))
                                                  (QREFELT % 174))
                                        |p| (QREFELT % 80)))))
                               (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                          (LETT |fp| (SPADCALL |fpu| |k| (QREFELT % 123)))
                          (LETT |pf|
                                (SPADCALL (SPADCALL |p| (QREFELT % 72)) |k|
                                          (QREFELT % 123)))
                          (LETT |lg1|
                                (PROGN
                                 (LETT #7# NIL)
                                 (SEQ (LETT |g| NIL) (LETT #8# |lg|) G190
                                      (COND
                                       ((OR (ATOM #8#)
                                            (PROGN (LETT |g| (CAR #8#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #7#
                                              (CONS
                                               (SPADCALL |pf| |g|
                                                         (QREFELT % 110))
                                               #7#))))
                                      (LETT #8# (CDR #8#)) (GO G190) G191
                                      (EXIT (NREVERSE #7#)))))
                          (LETT |res1|
                                (|RDEPAR;do_param_rde| |fp| NIL |lg1| |x| |k|
                                 |lk| |ext| |logi| %))
                          (EXIT
                           (PROGN
                            (LETT #9# NIL)
                            (SEQ (LETT |rs| NIL) (LETT #10# |res1|) G190
                                 (COND
                                  ((OR (ATOM #10#)
                                       (PROGN (LETT |rs| (CAR #10#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #9#
                                         (CONS
                                          (CONS
                                           (SPADCALL (QCAR |rs|) |pf|
                                                     (QREFELT % 128))
                                           (QCDR |rs|))
                                          #9#))))
                                 (LETT #10# (CDR #10#)) (GO G190) G191
                                 (EXIT (NREVERSE #9#)))))))))))))))) 

(SDEFUN |RDEPAR;param_rde2;FLSLMML;15!1| ((|z1| NIL) ($$ NIL))
        (PROG (% |x| |dk|)
          (LETT % (QREFELT $$ 2))
          (LETT |x| (QREFELT $$ 1))
          (LETT |dk| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL |z1|
                             (CONS #'|RDEPAR;param_rde2;FLSLMML;15!0|
                                   (VECTOR % |x|))
                             |dk| (QREFELT % 171))))))) 

(SDEFUN |RDEPAR;param_rde2;FLSLMML;15!0| ((|z2| NIL) ($$ NIL))
        (PROG (|x| %)
          (LETT |x| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |z2| |x| (QREFELT % 169)))))) 

(SDEFUN |RDEPAR;csolve1|
        ((|m| (|Matrix| F)) (|d1| (|Mapping| F F)) (% (|List| (|Vector| F))))
        (SPADCALL |m| (LIST |d1|) (QREFELT % 177))) 

(SDEFUN |RDEPAR;do_diff_rde1|
        ((|lg| (|List| (|SparseUnivariatePolynomial| F))) (|fp0| (F))
         (|fp1| (F)) (|x| (|Symbol|)) (|k| (|Kernel| F))
         (|lk| (|List| (|Kernel| F)))
         (|ext|
          (|Mapping|
           (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
           (|List| (|Kernel| F)) (|List| F)))
         (|logi|
          (|Mapping|
           (|Record| (|:| |logands| (|List| F))
                     (|:| |basis|
                          (|List| (|Vector| (|Fraction| (|Integer|))))))
           (|List| (|Kernel| F)) (|List| F)))
         (% (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))))
        (SPROG
         ((|args| (|List| F)) (|arg3| (F)) (|da3| (F)) (#1=#:G619 NIL)
          (#2=#:G620 NIL) (|lg0| (|List| F)) (#3=#:G621 NIL) (|up| NIL)
          (#4=#:G622 NIL) (|lg1| (|List| F)) (|k1| (F)) (|dv| (|Symbol|))
          (|dvf| (F)) (#5=#:G623 NIL) (|g| NIL) (#6=#:G624 NIL)
          (|lg2| (|List| F)) (|fp2| (F)) (#7=#:G625 NIL) (#8=#:G626 NIL)
          (|lek| (|List| F)) (|lk1| (|List| #9=(|Kernel| F)))
          (|ext1|
           (|Mapping|
            (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
            (|List| (|Kernel| F)) (|List| F)))
          (|logi1|
           (|Mapping|
            (|Record| (|:| |logands| (|List| F))
                      (|:| |basis|
                           (|List| (|Vector| (|Fraction| (|Integer|))))))
            (|List| (|Kernel| F)) (|List| F)))
          (|kk1| #10=(|Kernel| F)) (#11=#:G627 NIL) (|ki| NIL) (#12=#:G628 NIL)
          (|lk2| (|List| #9#))
          (|res1|
           #13=(|List|
                (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
          (#14=#:G629 NIL) (#15=#:G630 NIL) (|cb0| (|List| (|Vector| F)))
          (|d1| (|Mapping| F F))
          (|#G175|
           (|Record| (|:| |transform| #16=(|Matrix| F))
                     (|:| |basis| #17=(|List| (|Vector| F)))))
          (|m2| #16#) (|cb| #17#) (#18=#:G631 NIL) (#19=#:G632 NIL)
          (|v2| (|Vector| F)) (|v3| (|Vector| F)) (#20=#:G633 NIL)
          (#21=#:G634 NIL) (|lg3| (|List| F)) (#22=#:G635 NIL) (#23=#:G636 NIL)
          (|nlg0| (|List| F)) (|lca| (|List| F)) (|g0| NIL) (#24=#:G639 NIL)
          (|g1| NIL) (#25=#:G638 NIL) (#26=#:G637 NIL)
          (|du| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|nu| (|SparseUnivariatePolynomial| F)) (#27=#:G618 NIL) (|ng| (F))
          (|nlg| (|List| F)) (|m3| (|Matrix| F)) (#28=#:G640 NIL)
          (#29=#:G641 NIL) (|kk3| #10#) (|res2| #13#) (#30=#:G642 NIL)
          (#31=#:G643 NIL) (|cb1| (|List| (|Vector| F))) (#32=#:G644 NIL)
          (|be| NIL) (#33=#:G645 NIL) (|elca| (|List| F)) (#34=#:G646 NIL)
          (#35=#:G647 NIL) (|ncb| (|List| (|Vector| F))) (#36=#:G648 NIL)
          (|ca| NIL) (#37=#:G650 NIL) (#38=#:G649 NIL) (|nlca| (|List| F))
          (#39=#:G651 NIL) (|bv| NIL) (#40=#:G653 NIL) (|ba| NIL)
          (#41=#:G652 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |args| (SPADCALL |k| (QREFELT % 178)))
                (EXIT
                 (COND
                  ((SPADCALL (LENGTH |args|) 3 (QREFELT % 86))
                   (|error| "internal error, k is not a diff"))
                  (#42='T
                   (SEQ (LETT |arg3| (SPADCALL |args| 3 (QREFELT % 179)))
                        (LETT |da3| (SPADCALL |arg3| |x| (QREFELT % 169)))
                        (EXIT
                         (COND
                          ((SPADCALL |da3| (|spadConstant| % 96)
                                     (QREFELT % 126))
                           NIL)
                          (#42#
                           (SEQ
                            (LETT |lg0|
                                  (PROGN
                                   (LETT #1# NIL)
                                   (SEQ (LETT |up| NIL) (LETT #2# |lg|) G190
                                        (COND
                                         ((OR (ATOM #2#)
                                              (PROGN
                                               (LETT |up| (CAR #2#))
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #1#
                                                (CONS
                                                 (SPADCALL |up| 0
                                                           (QREFELT % 149))
                                                 #1#))))
                                        (LETT #2# (CDR #2#)) (GO G190) G191
                                        (EXIT (NREVERSE #1#)))))
                            (LETT |lg1|
                                  (PROGN
                                   (LETT #3# NIL)
                                   (SEQ (LETT |up| NIL) (LETT #4# |lg|) G190
                                        (COND
                                         ((OR (ATOM #4#)
                                              (PROGN
                                               (LETT |up| (CAR #4#))
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #3#
                                                (CONS
                                                 (SPADCALL |up| 1
                                                           (QREFELT % 149))
                                                 #3#))))
                                        (LETT #4# (CDR #4#)) (GO G190) G191
                                        (EXIT (NREVERSE #3#)))))
                            (LETT |k1|
                                  (SPADCALL (SPADCALL |args| 1 (QREFELT % 179))
                                            (SPADCALL
                                             (SPADCALL |args| 2
                                                       (QREFELT % 179))
                                             (QREFELT % 180))
                                            |arg3| (QREFELT % 181)))
                            (LETT |dv| (SPADCALL (QREFELT % 27)))
                            (LETT |dvf| (SPADCALL |dv| (QREFELT % 182)))
                            (LETT |lg2|
                                  (PROGN
                                   (LETT #5# NIL)
                                   (SEQ (LETT |g| NIL) (LETT #6# |lg1|) G190
                                        (COND
                                         ((OR (ATOM #6#)
                                              (PROGN (LETT |g| (CAR #6#)) NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #5#
                                                (CONS
                                                 (SPADCALL
                                                  (SPADCALL |g| |da3|
                                                            (QREFELT % 128))
                                                  |k1| |dvf| (QREFELT % 183))
                                                 #5#))))
                                        (LETT #6# (CDR #6#)) (GO G190) G191
                                        (EXIT (NREVERSE #5#)))))
                            (LETT |fp2|
                                  (SPADCALL
                                   (SPADCALL |fp1| |da3| (QREFELT % 128)) |k1|
                                   |dvf| (QREFELT % 183)))
                            (LETT |lek|
                                  (PROGN
                                   (LETT #7# NIL)
                                   (SEQ (LETT |ki| NIL) (LETT #8# |lk|) G190
                                        (COND
                                         ((OR (ATOM #8#)
                                              (PROGN
                                               (LETT |ki| (CAR #8#))
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #7#
                                                (CONS
                                                 (SPADCALL
                                                  (SPADCALL |ki|
                                                            (QREFELT % 31))
                                                  |k1| |dvf| (QREFELT % 183))
                                                 #7#))))
                                        (LETT #8# (CDR #8#)) (GO G190) G191
                                        (EXIT (NREVERSE #7#)))))
                            (LETT |lk1|
                                  (SPADCALL
                                   (SPADCALL
                                    (CONS |dvf|
                                          (SPADCALL |lg2| |lek|
                                                    (QREFELT % 184)))
                                    (QREFELT % 186))
                                   |dv| (QREFELT % 187)))
                            (LETT |ext1|
                                  (CONS #'|RDEPAR;do_diff_rde1!0|
                                        (VECTOR % |dv|)))
                            (LETT |logi1|
                                  (CONS #'|RDEPAR;do_diff_rde1!1|
                                        (VECTOR % |dv|)))
                            (LETT |kk1| (SPADCALL |lk1| (QREFELT % 163)))
                            (LETT |lk2|
                                  (PROGN
                                   (LETT #11# NIL)
                                   (SEQ (LETT |ki| NIL) (LETT #12# |lk1|) G190
                                        (COND
                                         ((OR (ATOM #12#)
                                              (PROGN
                                               (LETT |ki| (CAR #12#))
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (COND
                                           ((SPADCALL |ki| |kk1|
                                                      (QREFELT % 164))
                                            (LETT #11# (CONS |ki| #11#))))))
                                        (LETT #12# (CDR #12#)) (GO G190) G191
                                        (EXIT (NREVERSE #11#)))))
                            (LETT |res1|
                                  (COND
                                   ((SPADCALL |fp2| (|spadConstant| % 96)
                                              (QREFELT % 126))
                                    (SPADCALL |lk1| |lg2| |ext1|))
                                   (#42#
                                    (|RDEPAR;do_param_rde| |fp2| 'T |lg2| |dv|
                                     |kk1| |lk2| |ext1| |logi1| %))))
                            (EXIT
                             (COND ((NULL |res1|) NIL)
                                   (#42#
                                    (SEQ
                                     (LETT |cb0|
                                           (PROGN
                                            (LETT #14# NIL)
                                            (SEQ (LETT |be| NIL)
                                                 (LETT #15# |res1|) G190
                                                 (COND
                                                  ((OR (ATOM #15#)
                                                       (PROGN
                                                        (LETT |be| (CAR #15#))
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT #14#
                                                         (CONS (QCDR |be|)
                                                               #14#))))
                                                 (LETT #15# (CDR #15#))
                                                 (GO G190) G191
                                                 (EXIT (NREVERSE #14#)))))
                                     (LETT |d1|
                                           (CONS #'|RDEPAR;do_diff_rde1!2|
                                                 (VECTOR % |x|)))
                                     (PROGN
                                      (LETT |#G175|
                                            (SPADCALL |cb0| (LIST |d1|)
                                                      (QREFELT % 192)))
                                      (LETT |m2| (QCAR |#G175|))
                                      (LETT |cb| (QCDR |#G175|))
                                      |#G175|)
                                     (EXIT
                                      (COND ((NULL |cb|) NIL)
                                            (#42#
                                             (SEQ
                                              (LETT |v2|
                                                    (SPADCALL
                                                     (PROGN
                                                      (LETT #18# NIL)
                                                      (SEQ (LETT |be| NIL)
                                                           (LETT #19# |res1|)
                                                           G190
                                                           (COND
                                                            ((OR (ATOM #19#)
                                                                 (PROGN
                                                                  (LETT |be|
                                                                        (CAR
                                                                         #19#))
                                                                  NIL))
                                                             (GO G191)))
                                                           (SEQ
                                                            (EXIT
                                                             (LETT #18#
                                                                   (CONS
                                                                    (QCAR |be|)
                                                                    #18#))))
                                                           (LETT #19#
                                                                 (CDR #19#))
                                                           (GO G190) G191
                                                           (EXIT
                                                            (NREVERSE #18#))))
                                                     (QREFELT % 193)))
                                              (LETT |v3|
                                                    (SPADCALL |m2| |v2|
                                                              (QREFELT % 194)))
                                              (LETT |lca|
                                                    (SPADCALL |v3|
                                                              (QREFELT % 195)))
                                              (LETT |lg3|
                                                    (PROGN
                                                     (LETT #20# NIL)
                                                     (SEQ (LETT |bv| NIL)
                                                          (LETT #21# |cb|) G190
                                                          (COND
                                                           ((OR (ATOM #21#)
                                                                (PROGN
                                                                 (LETT |bv|
                                                                       (CAR
                                                                        #21#))
                                                                 NIL))
                                                            (GO G191)))
                                                          (SEQ
                                                           (EXIT
                                                            (LETT #20#
                                                                  (CONS
                                                                   (SPADCALL
                                                                    |bv| |lg1|
                                                                    (QREFELT %
                                                                             109))
                                                                   #20#))))
                                                          (LETT #21#
                                                                (CDR #21#))
                                                          (GO G190) G191
                                                          (EXIT
                                                           (NREVERSE #20#)))))
                                              (LETT |nlg0|
                                                    (PROGN
                                                     (LETT #22# NIL)
                                                     (SEQ (LETT |bv| NIL)
                                                          (LETT #23# |cb|) G190
                                                          (COND
                                                           ((OR (ATOM #23#)
                                                                (PROGN
                                                                 (LETT |bv|
                                                                       (CAR
                                                                        #23#))
                                                                 NIL))
                                                            (GO G191)))
                                                          (SEQ
                                                           (EXIT
                                                            (LETT #22#
                                                                  (CONS
                                                                   (SPADCALL
                                                                    |bv| |lg0|
                                                                    (QREFELT %
                                                                             109))
                                                                   #22#))))
                                                          (LETT #23#
                                                                (CDR #23#))
                                                          (GO G190) G191
                                                          (EXIT
                                                           (NREVERSE #22#)))))
                                              (LETT |lca|
                                                    (SPADCALL
                                                     (CONS
                                                      #'|RDEPAR;do_diff_rde1!3|
                                                      (VECTOR |k1| % |dv|))
                                                     |lca| (QREFELT % 196)))
                                              (LETT |nlg| NIL)
                                              (SEQ (LETT |g0| NIL)
                                                   (LETT #24# |nlg0|)
                                                   (LETT |g1| NIL)
                                                   (LETT #25# |lg3|)
                                                   (LETT |ca| NIL)
                                                   (LETT #26# |lca|) G190
                                                   (COND
                                                    ((OR (ATOM #26#)
                                                         (PROGN
                                                          (LETT |ca|
                                                                (CAR #26#))
                                                          NIL)
                                                         (ATOM #25#)
                                                         (PROGN
                                                          (LETT |g1|
                                                                (CAR #25#))
                                                          NIL)
                                                         (ATOM #24#)
                                                         (PROGN
                                                          (LETT |g0|
                                                                (CAR #24#))
                                                          NIL))
                                                     (GO G191)))
                                                   (SEQ
                                                    (LETT |du|
                                                          (SPADCALL
                                                           (SPADCALL |ca| |x|
                                                                     (QREFELT %
                                                                              169))
                                                           |k|
                                                           (QREFELT % 125)))
                                                    (LETT |nu|
                                                          (SPADCALL |du|
                                                                    (QREFELT %
                                                                             22)))
                                                    (COND
                                                     ((OR
                                                       (SPADCALL
                                                        (SPADCALL |du|
                                                                  (QREFELT %
                                                                           13))
                                                        (|spadConstant| % 67)
                                                        (QREFELT % 69))
                                                       (>
                                                        (SPADCALL |nu|
                                                                  (QREFELT %
                                                                           66))
                                                        1))
                                                      (EXIT
                                                       (PROGN
                                                        (LETT #27# NIL)
                                                        (GO #43=#:G617)))))
                                                    (EXIT
                                                     (COND
                                                      ((SPADCALL
                                                        (SPADCALL
                                                         (SPADCALL |g1|
                                                                   (SPADCALL
                                                                    |fp1| |ca|
                                                                    (QREFELT %
                                                                             110))
                                                                   (QREFELT %
                                                                            111))
                                                         (SPADCALL |nu| 1
                                                                   (QREFELT %
                                                                            149))
                                                         (QREFELT % 111))
                                                        (|spadConstant| % 96)
                                                        (QREFELT % 197))
                                                       (PROGN
                                                        (LETT #27# NIL)
                                                        (GO #43#)))
                                                      ('T
                                                       (SEQ
                                                        (LETT |ng|
                                                              (SPADCALL
                                                               (SPADCALL |g0|
                                                                         (SPADCALL
                                                                          |fp0|
                                                                          |ca|
                                                                          (QREFELT
                                                                           %
                                                                           110))
                                                                         (QREFELT
                                                                          %
                                                                          111))
                                                               (SPADCALL |nu| 0
                                                                         (QREFELT
                                                                          %
                                                                          149))
                                                               (QREFELT %
                                                                        111)))
                                                        (EXIT
                                                         (LETT |nlg|
                                                               (CONS |ng|
                                                                     |nlg|))))))))
                                                   (LETT #26#
                                                         (PROG1 (CDR #26#)
                                                           (LETT #25#
                                                                 (PROG1
                                                                     (CDR #25#)
                                                                   (LETT #24#
                                                                         (CDR
                                                                          #24#))))))
                                                   (GO G190) G191 (EXIT NIL))
                                              (LETT |nlg| (NREVERSE |nlg|))
                                              (COND
                                               ((SPADCALL |fp1|
                                                          (|spadConstant| % 96)
                                                          (QREFELT % 197))
                                                (SEQ
                                                 (LETT |m3|
                                                       (SPADCALL (LIST |nlg|)
                                                                 (QREFELT %
                                                                          199)))
                                                 (LETT |cb1|
                                                       (|RDEPAR;csolve1| |m3|
                                                        |d1| %))
                                                 (EXIT
                                                  (LETT |elca|
                                                        (PROGN
                                                         (LETT #28# NIL)
                                                         (SEQ (LETT |bv| NIL)
                                                              (LETT #29# |cb1|)
                                                              G190
                                                              (COND
                                                               ((OR (ATOM #29#)
                                                                    (PROGN
                                                                     (LETT |bv|
                                                                           (CAR
                                                                            #29#))
                                                                     NIL))
                                                                (GO G191)))
                                                              (SEQ
                                                               (EXIT
                                                                (LETT #28#
                                                                      (CONS
                                                                       (|spadConstant|
                                                                        % 96)
                                                                       #28#))))
                                                              (LETT #29#
                                                                    (CDR #29#))
                                                              (GO G190) G191
                                                              (EXIT
                                                               (NREVERSE
                                                                #28#))))))))
                                               (#42#
                                                (SEQ
                                                 (LETT |kk3|
                                                       (SPADCALL |lk|
                                                                 (QREFELT %
                                                                          163)))
                                                 (LETT |res2|
                                                       (|RDEPAR;do_param_rde|
                                                        |fp0| 'T |nlg| |x|
                                                        |kk3| |lk1| |ext|
                                                        |logi| %))
                                                 (LETT |cb1|
                                                       (PROGN
                                                        (LETT #30# NIL)
                                                        (SEQ (LETT |be| NIL)
                                                             (LETT #31# |res2|)
                                                             G190
                                                             (COND
                                                              ((OR (ATOM #31#)
                                                                   (PROGN
                                                                    (LETT |be|
                                                                          (CAR
                                                                           #31#))
                                                                    NIL))
                                                               (GO G191)))
                                                             (SEQ
                                                              (EXIT
                                                               (LETT #30#
                                                                     (CONS
                                                                      (QCDR
                                                                       |be|)
                                                                      #30#))))
                                                             (LETT #31#
                                                                   (CDR #31#))
                                                             (GO G190) G191
                                                             (EXIT
                                                              (NREVERSE
                                                               #30#)))))
                                                 (EXIT
                                                  (LETT |elca|
                                                        (PROGN
                                                         (LETT #32# NIL)
                                                         (SEQ (LETT |be| NIL)
                                                              (LETT #33#
                                                                    |res2|)
                                                              G190
                                                              (COND
                                                               ((OR (ATOM #33#)
                                                                    (PROGN
                                                                     (LETT |be|
                                                                           (CAR
                                                                            #33#))
                                                                     NIL))
                                                                (GO G191)))
                                                              (SEQ
                                                               (EXIT
                                                                (LETT #32#
                                                                      (CONS
                                                                       (QCAR
                                                                        |be|)
                                                                       #32#))))
                                                              (LETT #33#
                                                                    (CDR #33#))
                                                              (GO G190) G191
                                                              (EXIT
                                                               (NREVERSE
                                                                #32#)))))))))
                                              (LETT |ncb|
                                                    (PROGN
                                                     (LETT #34# NIL)
                                                     (SEQ (LETT |bv| NIL)
                                                          (LETT #35# |cb1|)
                                                          G190
                                                          (COND
                                                           ((OR (ATOM #35#)
                                                                (PROGN
                                                                 (LETT |bv|
                                                                       (CAR
                                                                        #35#))
                                                                 NIL))
                                                            (GO G191)))
                                                          (SEQ
                                                           (EXIT
                                                            (LETT #34#
                                                                  (CONS
                                                                   (SPADCALL
                                                                    |bv| |cb|
                                                                    (QREFELT %
                                                                             79))
                                                                   #34#))))
                                                          (LETT #35#
                                                                (CDR #35#))
                                                          (GO G190) G191
                                                          (EXIT
                                                           (NREVERSE #34#)))))
                                              (LETT |nlca|
                                                    (PROGN
                                                     (LETT #36# NIL)
                                                     (SEQ (LETT |ca| NIL)
                                                          (LETT #37# |elca|)
                                                          (LETT |bv| NIL)
                                                          (LETT #38# |cb1|)
                                                          G190
                                                          (COND
                                                           ((OR (ATOM #38#)
                                                                (PROGN
                                                                 (LETT |bv|
                                                                       (CAR
                                                                        #38#))
                                                                 NIL)
                                                                (ATOM #37#)
                                                                (PROGN
                                                                 (LETT |ca|
                                                                       (CAR
                                                                        #37#))
                                                                 NIL))
                                                            (GO G191)))
                                                          (SEQ
                                                           (EXIT
                                                            (LETT #36#
                                                                  (CONS
                                                                   (SPADCALL
                                                                    |ca|
                                                                    (SPADCALL
                                                                     |bv| |lca|
                                                                     (QREFELT %
                                                                              109))
                                                                    (QREFELT %
                                                                             111))
                                                                   #36#))))
                                                          (LETT #38#
                                                                (PROG1
                                                                    (CDR #38#)
                                                                  (LETT #37#
                                                                        (CDR
                                                                         #37#))))
                                                          (GO G190) G191
                                                          (EXIT
                                                           (NREVERSE #36#)))))
                                              (EXIT
                                               (PROGN
                                                (LETT #39# NIL)
                                                (SEQ (LETT |bv| NIL)
                                                     (LETT #40# |ncb|)
                                                     (LETT |ba| NIL)
                                                     (LETT #41# |nlca|) G190
                                                     (COND
                                                      ((OR (ATOM #41#)
                                                           (PROGN
                                                            (LETT |ba|
                                                                  (CAR #41#))
                                                            NIL)
                                                           (ATOM #40#)
                                                           (PROGN
                                                            (LETT |bv|
                                                                  (CAR #40#))
                                                            NIL))
                                                       (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (LETT #39#
                                                             (CONS
                                                              (CONS |ba| |bv|)
                                                              #39#))))
                                                     (LETT #41#
                                                           (PROG1 (CDR #41#)
                                                             (LETT #40#
                                                                   (CDR
                                                                    #40#))))
                                                     (GO G190) G191
                                                     (EXIT
                                                      (NREVERSE
                                                       #39#)))))))))))))))))))))))
          #43# (EXIT #27#)))) 

(SDEFUN |RDEPAR;do_diff_rde1!3| ((|x1| NIL) ($$ NIL))
        (PROG (|dv| % |k1|)
          (LETT |dv| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |k1| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |x1| (SPADCALL |dv| (QREFELT % 29)) |k1|
                      (QREFELT % 181)))))) 

(SDEFUN |RDEPAR;do_diff_rde1!2| ((|x1| NIL) ($$ NIL))
        (PROG (|x| %)
          (LETT |x| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x1| |x| (QREFELT % 169)))))) 

(SDEFUN |RDEPAR;do_diff_rde1!1| ((|x2| NIL) (|x3| NIL) ($$ NIL))
        (PROG (|dv| %)
          (LETT |dv| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |dv| |x2| |x3| (QREFELT % 190)))))) 

(SDEFUN |RDEPAR;do_diff_rde1!0| ((|x4| NIL) (|x3| NIL) ($$ NIL))
        (PROG (|dv| %)
          (LETT |dv| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |dv| |x4| |x3| (QREFELT % 189)))))) 

(SDEFUN |RDEPAR;do_diff_rde|
        ((|fp| (F)) (|lg| (|List| F)) (|x| (|Symbol|)) (|k| (|Kernel| F))
         (|lk| (|List| (|Kernel| F)))
         (|ext|
          (|Mapping|
           (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
           (|List| (|Kernel| F)) (|List| F)))
         (|logi|
          (|Mapping|
           (|Record| (|:| |logands| (|List| F))
                     (|:| |basis|
                          (|List| (|Vector| (|Fraction| (|Integer|))))))
           (|List| (|Kernel| F)) (|List| F)))
         (% (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))))
        (SPROG
         ((|fpu| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|nfpu| (|SparseUnivariatePolynomial| F)) (|fp1| (F)) (|fp0| (F))
          (|d1| (|Mapping| F F))
          (|cs1| (|Mapping| (|List| (|Vector| F)) (|Matrix| F)))
          (|diff_rde1|
           (|Mapping|
            (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
            (|List| (|SparseUnivariatePolynomial| F))))
          (#1=#:G673 NIL) (|u| NIL) (#2=#:G674 NIL))
         (SEQ (LETT |fpu| (SPADCALL |fp| |k| (QREFELT % 125)))
              (COND
               ((OR
                 (SPADCALL (SPADCALL |fpu| (QREFELT % 13))
                           (|spadConstant| % 67) (QREFELT % 69))
                 (>
                  (SPADCALL (LETT |nfpu| (SPADCALL |fpu| (QREFELT % 22)))
                            (QREFELT % 66))
                  1))
                (EXIT NIL)))
              (LETT |fp1| (SPADCALL |nfpu| 1 (QREFELT % 149)))
              (LETT |fp0| (SPADCALL |nfpu| 0 (QREFELT % 149)))
              (LETT |d1| (CONS #'|RDEPAR;do_diff_rde!0| (VECTOR % |x|)))
              (LETT |cs1| (CONS #'|RDEPAR;do_diff_rde!1| (VECTOR % |d1|)))
              (LETT |diff_rde1|
                    (CONS #'|RDEPAR;do_diff_rde!2|
                          (VECTOR % |logi| |ext| |lk| |k| |x| |fp1| |fp0|)))
              (EXIT
               (SPADCALL |diff_rde1| |cs1|
                         (PROGN
                          (LETT #1# NIL)
                          (SEQ (LETT |u| NIL) (LETT #2# |lg|) G190
                               (COND
                                ((OR (ATOM #2#)
                                     (PROGN (LETT |u| (CAR #2#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #1#
                                       (CONS (SPADCALL |u| |k| (QREFELT % 125))
                                             #1#))))
                               (LETT #2# (CDR #2#)) (GO G190) G191
                               (EXIT (NREVERSE #1#))))
                         (QREFELT % 203)))))) 

(SDEFUN |RDEPAR;do_diff_rde!2| ((|x1| NIL) ($$ NIL))
        (PROG (|fp0| |fp1| |x| |k| |lk| |ext| |logi| %)
          (LETT |fp0| (QREFELT $$ 7))
          (LETT |fp1| (QREFELT $$ 6))
          (LETT |x| (QREFELT $$ 5))
          (LETT |k| (QREFELT $$ 4))
          (LETT |lk| (QREFELT $$ 3))
          (LETT |ext| (QREFELT $$ 2))
          (LETT |logi| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|RDEPAR;do_diff_rde1| |x1| |fp0| |fp1| |x| |k| |lk| |ext| |logi|
             %))))) 

(SDEFUN |RDEPAR;do_diff_rde!1| ((|x4| NIL) ($$ NIL))
        (PROG (|d1| %)
          (LETT |d1| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|RDEPAR;csolve1| |x4| |d1| %))))) 

(SDEFUN |RDEPAR;do_diff_rde!0| ((|x1| NIL) ($$ NIL))
        (PROG (|x| %)
          (LETT |x| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x1| |x| (QREFELT % 169)))))) 

(SDEFUN |RDEPAR;do_alg_rde0|
        ((|fp| (F)) (|lg| (|List| F)) (|x| (|Symbol|)) (|k| (|Kernel| F))
         (|lk| (|List| (|Kernel| F)))
         (|ext|
          (|Mapping|
           (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
           (|List| (|Kernel| F)) (|List| F)))
         (|logi|
          (|Mapping|
           (|Record| (|:| |logands| (|List| F))
                     (|:| |basis|
                          (|List| (|Vector| (|Fraction| (|Integer|))))))
           (|List| (|Kernel| F)) (|List| F)))
         (% (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))))
        (SPROG
         ((|ak| (|List| F)) (|ak2| (F)) (|n| (|Integer|)) (|ak1| (F))
          (|dlk| (F)) (|kf| (F)) (#1=#:G704 NIL) (|g| NIL) (#2=#:G705 NIL)
          (|llv| (|Vector| (|List| F))) (|m| (|NonNegativeInteger|))
          (#3=#:G706 NIL) (#4=#:G707 NIL) (#5=#:G709 NIL) (#6=#:G708 NIL)
          (#7=#:G710 NIL) (#8=#:G711 NIL) (|i| NIL) (#9=#:G712 NIL) (|j| NIL)
          (#10=#:G713 NIL) (|lgi| (|List| F)) (#11=#:G714 NIL) (#12=#:G715 NIL)
          (|lgi1| (|List| F))
          (|s1|
           (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
          (#13=#:G716 NIL) (#14=#:G717 NIL) (|ncb| (|List| (|Vector| F)))
          (#15=#:G718 NIL) (|be| NIL) (#16=#:G719 NIL) (|nlba| (|List| F))
          (|cb| (|List| (|Vector| F))) (|lba| (|List| F)) (|kfi| (F))
          (#17=#:G720 NIL) (|bv| NIL) (#18=#:G722 NIL) (|ba| NIL)
          (#19=#:G721 NIL))
         (SEQ (LETT |ak| (SPADCALL |k| (QREFELT % 178)))
              (LETT |ak2| (SPADCALL |ak| 2 (QREFELT % 179)))
              (LETT |n| (SPADCALL |ak2| (QREFELT % 204)))
              (LETT |ak1| (SPADCALL |ak| 1 (QREFELT % 179)))
              (LETT |dlk|
                    (SPADCALL (SPADCALL |ak1| |x| (QREFELT % 205))
                              (SPADCALL |ak2| |ak1| (QREFELT % 110))
                              (QREFELT % 128)))
              (LETT |kf| (SPADCALL |k| (QREFELT % 31)))
              (LETT |kfi| (|spadConstant| % 63))
              (LETT |llv|
                    (SPADCALL
                     (PROGN
                      (LETT #1# NIL)
                      (SEQ (LETT |g| NIL) (LETT #2# |lg|) G190
                           (COND
                            ((OR (ATOM #2#) (PROGN (LETT |g| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #1#
                                   (CONS (SPADCALL |g| |k| |n| (QREFELT % 207))
                                         #1#))))
                           (LETT #2# (CDR #2#)) (GO G190) G191
                           (EXIT (NREVERSE #1#))))
                     (QREFELT % 209)))
              (LETT |m| (LENGTH |lg|))
              (LETT |cb|
                    (PROGN
                     (LETT #3# NIL)
                     (SEQ (LETT |i| 1) (LETT #4# |m|) G190
                          (COND ((|greater_SI| |i| #4#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #3#
                                  (CONS (MAKEARR1 |m| (|spadConstant| % 96))
                                        #3#))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT (NREVERSE #3#)))))
              (SEQ (LETT |bv| NIL) (LETT #5# |cb|) (LETT |i| 1) (LETT #6# |m|)
                   G190
                   (COND
                    ((OR (|greater_SI| |i| #6#) (ATOM #5#)
                         (PROGN (LETT |bv| (CAR #5#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |bv| |i| (|spadConstant| % 63) (QREFELT % 97))))
                   (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #5# (CDR #5#))))
                   (GO G190) G191 (EXIT NIL))
              (LETT |lba|
                    (PROGN
                     (LETT #7# NIL)
                     (SEQ (LETT |bv| NIL) (LETT #8# |cb|) G190
                          (COND
                           ((OR (ATOM #8#) (PROGN (LETT |bv| (CAR #8#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT (LETT #7# (CONS (|spadConstant| % 96) #7#))))
                          (LETT #8# (CDR #8#)) (GO G190) G191
                          (EXIT (NREVERSE #7#)))))
              (SEQ (LETT |i| 0) (LETT #9# (- |n| 1)) G190
                   (COND ((|greater_SI| |i| #9#) (GO G191)))
                   (SEQ (LETT |lgi| NIL)
                        (SEQ (LETT |j| 1) (LETT #10# |m|) G190
                             (COND ((|greater_SI| |j| #10#) (GO G191)))
                             (SEQ
                              (LETT |lgi|
                                    (CONS
                                     (|SPADfirst|
                                      (SPADCALL |llv| |j| (QREFELT % 210)))
                                     |lgi|))
                              (EXIT
                               (SPADCALL |llv| |j|
                                         (CDR
                                          (SPADCALL |llv| |j| (QREFELT % 210)))
                                         (QREFELT % 211))))
                             (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                             (EXIT NIL))
                        (LETT |lgi| (NREVERSE |lgi|))
                        (LETT |lgi1|
                              (PROGN
                               (LETT #11# NIL)
                               (SEQ (LETT |bv| NIL) (LETT #12# |cb|) G190
                                    (COND
                                     ((OR (ATOM #12#)
                                          (PROGN (LETT |bv| (CAR #12#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #11#
                                            (CONS
                                             (SPADCALL |bv| |lgi|
                                                       (QREFELT % 109))
                                             #11#))))
                                    (LETT #12# (CDR #12#)) (GO G190) G191
                                    (EXIT (NREVERSE #11#)))))
                        (LETT |s1|
                              (SPADCALL
                               (SPADCALL |fp|
                                         (SPADCALL
                                          (SPADCALL |i| (QREFELT % 43)) |dlk|
                                          (QREFELT % 110))
                                         (QREFELT % 111))
                               |lgi1| |x| |lk| |ext| |logi| (QREFELT % 118)))
                        (LETT |ncb|
                              (PROGN
                               (LETT #13# NIL)
                               (SEQ (LETT |be| NIL) (LETT #14# |s1|) G190
                                    (COND
                                     ((OR (ATOM #14#)
                                          (PROGN (LETT |be| (CAR #14#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #13#
                                            (CONS
                                             (SPADCALL (QCDR |be|) |cb|
                                                       (QREFELT % 79))
                                             #13#))))
                                    (LETT #14# (CDR #14#)) (GO G190) G191
                                    (EXIT (NREVERSE #13#)))))
                        (LETT |nlba|
                              (PROGN
                               (LETT #15# NIL)
                               (SEQ (LETT |be| NIL) (LETT #16# |s1|) G190
                                    (COND
                                     ((OR (ATOM #16#)
                                          (PROGN (LETT |be| (CAR #16#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #15#
                                            (CONS
                                             (SPADCALL
                                              (SPADCALL (QCDR |be|) |lba|
                                                        (QREFELT % 109))
                                              (SPADCALL (QCAR |be|) |kfi|
                                                        (QREFELT % 110))
                                              (QREFELT % 111))
                                             #15#))))
                                    (LETT #16# (CDR #16#)) (GO G190) G191
                                    (EXIT (NREVERSE #15#)))))
                        (LETT |cb| |ncb|) (LETT |lba| |nlba|)
                        (EXIT
                         (LETT |kfi| (SPADCALL |kf| |kfi| (QREFELT % 110)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (PROGN
                (LETT #17# NIL)
                (SEQ (LETT |bv| NIL) (LETT #18# |cb|) (LETT |ba| NIL)
                     (LETT #19# |lba|) G190
                     (COND
                      ((OR (ATOM #19#) (PROGN (LETT |ba| (CAR #19#)) NIL)
                           (ATOM #18#) (PROGN (LETT |bv| (CAR #18#)) NIL))
                       (GO G191)))
                     (SEQ (EXIT (LETT #17# (CONS (CONS |ba| |bv|) #17#))))
                     (LETT #19# (PROG1 (CDR #19#) (LETT #18# (CDR #18#))))
                     (GO G190) G191 (EXIT (NREVERSE #17#)))))))) 

(SDEFUN |RDEPAR;do_alg_rde|
        ((|fp| (F)) (|lg| (|List| F)) (|x| (|Symbol|)) (|k| (|Kernel| F))
         (|lk| (|List| (|Kernel| F)))
         (|ext|
          (|Mapping|
           (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
           (|List| (|Kernel| F)) (|List| F)))
         (|logi|
          (|Mapping|
           (|Record| (|:| |logands| (|List| F))
                     (|:| |basis|
                          (|List| (|Vector| (|Fraction| (|Integer|))))))
           (|List| (|Kernel| F)) (|List| F)))
         (%
          #1=(|List|
              (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))))
        (SPROG
         ((|cc| (F)) (#2=#:G761 NIL) (|k1| (|Kernel| F))
          (|n| (|NonNegativeInteger|)) (#3=#:G762 NIL) (#4=#:G763 NIL)
          (|part1|
           (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
          (#5=#:G764 NIL) (|f| NIL) (#6=#:G765 NIL)
          (|part2|
           (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
          (|rec|
           (|Record| (|:| |primelt| F)
                     (|:| |pol1| (|SparseUnivariatePolynomial| F))
                     (|:| |pol2| (|SparseUnivariatePolynomial| F))
                     (|:| |prim| (|SparseUnivariatePolynomial| F))))
          (|y| (F)) (|ky| (|Kernel| F)) (|fp1| (F)) (#7=#:G766 NIL) (|g| NIL)
          (#8=#:G767 NIL) (|lg1| (|List| F)) (#9=#:G768 NIL) (|kk| NIL)
          (#10=#:G769 NIL) (|res1| #1#) (#11=#:G770 NIL) (|be| NIL)
          (#12=#:G771 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((EQL (LENGTH |lg|) 1)
              (SEQ
               (LETT |cc|
                     (SPADCALL (SPADCALL |lg| 1 (QREFELT % 179)) |fp|
                               (QREFELT % 128)))
               (EXIT
                (COND
                 ((SPADCALL (SPADCALL |cc| |x| (QREFELT % 205))
                            (|spadConstant| % 96) (QREFELT % 126))
                  (PROGN
                   (LETT #2#
                         (LIST
                          (CONS (SPADCALL |cc| (QREFELT % 107))
                                (VECTOR (|spadConstant| % 63)))))
                   (GO #13=#:G760))))))))
            (COND
             ((SPADCALL |k| '|nthRoot| (QREFELT % 168))
              (COND
               ((NULL
                 (SPADCALL |k| (SPADCALL |fp| (QREFELT % 212))
                           (QREFELT % 213)))
                (EXIT
                 (|RDEPAR;do_alg_rde0| |fp| |lg| |x| |k| |lk| |ext| |logi|
                  %))))))
            (LETT |k1| (SPADCALL |lk| (QREFELT % 163)))
            (EXIT
             (COND
              ((QEQCAR (SPADCALL |k1| (QREFELT % 215)) 0)
               (SEQ (LETT |res1| (SPADCALL |fp| |lg| |k1| |k| (QREFELT % 218)))
                    (LETT |n| (LENGTH |lg|))
                    (LETT |part1|
                          (PROGN
                           (LETT #3# NIL)
                           (SEQ (LETT |be| NIL) (LETT #4# (QCAR |res1|)) G190
                                (COND
                                 ((OR (ATOM #4#)
                                      (PROGN (LETT |be| (CAR #4#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #3#
                                        (CONS
                                         (CONS
                                          (SPADCALL (QCAR |be|)
                                                    (QREFELT % 107))
                                          (QCDR |be|))
                                         #3#))))
                                (LETT #4# (CDR #4#)) (GO G190) G191
                                (EXIT (NREVERSE #3#)))))
                    (LETT |part2|
                          (PROGN
                           (LETT #5# NIL)
                           (SEQ (LETT |f| NIL) (LETT #6# (QCDR |res1|)) G190
                                (COND
                                 ((OR (ATOM #6#)
                                      (PROGN (LETT |f| (CAR #6#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #5#
                                        (CONS
                                         (CONS |f|
                                               (MAKEARR1 |n|
                                                         (|spadConstant| %
                                                                         96)))
                                         #5#))))
                                (LETT #6# (CDR #6#)) (GO G190) G191
                                (EXIT (NREVERSE #5#)))))
                    (EXIT (SPADCALL |part1| |part2| (QREFELT % 219)))))
              ((SPADCALL (SPADCALL |k1| (QREFELT % 166)) '|%alg|
                         (QREFELT % 167))
               (SEQ
                (LETT |rec|
                      (SPADCALL (SPADCALL |k1| (QREFELT % 31))
                                (SPADCALL |k| (QREFELT % 31)) (QREFELT % 222)))
                (LETT |y| (SPADCALL (QVELT |rec| 3) (QREFELT % 224)))
                (LETT |ky| (SPADCALL |y| (QREFELT % 180)))
                (LETT |fp1|
                      (SPADCALL |fp| (LIST |k1| |k|)
                                (LIST
                                 (SPADCALL (QVELT |rec| 1) |y| (QREFELT % 225))
                                 (SPADCALL (QVELT |rec| 2) |y|
                                           (QREFELT % 225)))
                                (QREFELT % 226)))
                (LETT |lg1|
                      (PROGN
                       (LETT #7# NIL)
                       (SEQ (LETT |g| NIL) (LETT #8# |lg|) G190
                            (COND
                             ((OR (ATOM #8#) (PROGN (LETT |g| (CAR #8#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #7#
                                    (CONS
                                     (SPADCALL |g| (LIST |k1| |k|)
                                               (LIST
                                                (SPADCALL (QVELT |rec| 1) |y|
                                                          (QREFELT % 225))
                                                (SPADCALL (QVELT |rec| 2) |y|
                                                          (QREFELT % 225)))
                                               (QREFELT % 226))
                                     #7#))))
                            (LETT #8# (CDR #8#)) (GO G190) G191
                            (EXIT (NREVERSE #7#)))))
                (LETT |res1|
                      (|RDEPAR;do_alg_rde| |fp1| |lg1| |x| |ky|
                       (PROGN
                        (LETT #9# NIL)
                        (SEQ (LETT |kk| NIL) (LETT #10# |lk|) G190
                             (COND
                              ((OR (ATOM #10#)
                                   (PROGN (LETT |kk| (CAR #10#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL |kk| |k1| (QREFELT % 164))
                                 (LETT #9# (CONS |kk| #9#))))))
                             (LETT #10# (CDR #10#)) (GO G190) G191
                             (EXIT (NREVERSE #9#))))
                       |ext| |logi| %))
                (EXIT
                 (PROGN
                  (LETT #11# NIL)
                  (SEQ (LETT |be| NIL) (LETT #12# |res1|) G190
                       (COND
                        ((OR (ATOM #12#) (PROGN (LETT |be| (CAR #12#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #11#
                               (CONS
                                (CONS
                                 (SPADCALL (QCAR |be|) |ky| (QVELT |rec| 0)
                                           (QREFELT % 181))
                                 (QCDR |be|))
                                #11#))))
                       (LETT #12# (CDR #12#)) (GO G190) G191
                       (EXIT (NREVERSE #11#)))))))
              ('T (|error| "do_alg_rde: unimplemented kernel"))))))
          #13# (EXIT #2#)))) 

(SDEFUN |RDEPAR;param_rde;IFLSLMML;21|
        ((|m| (|Integer|)) (|f| (F)) (|lg| (|List| F)) (|x| (|Symbol|))
         (|lk| (|List| (|Kernel| F)))
         (|ext|
          (|Mapping|
           (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
           (|List| (|Kernel| F)) (|List| F)))
         (|logi|
          (|Mapping|
           (|Record| (|:| |logands| (|List| F))
                     (|:| |basis|
                          (|List| (|Vector| (|Fraction| (|Integer|))))))
           (|List| (|Kernel| F)) (|List| F)))
         (% (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))))
        (SPROG
         ((|fp| (F)) (|k| (|Kernel| F)) (#1=#:G782 NIL) (|k1| NIL)
          (#2=#:G783 NIL))
         (SEQ
          (LETT |fp|
                (SPADCALL (SPADCALL |m| |f| (QREFELT % 227)) |x|
                          (QREFELT % 205)))
          (EXIT
           (COND
            ((SPADCALL |fp| (|spadConstant| % 96) (QREFELT % 126))
             (SPADCALL |lk| |lg| |ext|))
            ('T
             (SEQ (LETT |k| (SPADCALL |lk| (QREFELT % 163)))
                  (LETT |lk|
                        (PROGN
                         (LETT #1# NIL)
                         (SEQ (LETT |k1| NIL) (LETT #2# |lk|) G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |k1| (CAR #2#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL |k1| |k| (QREFELT % 164))
                                  (LETT #1# (CONS |k1| #1#))))))
                              (LETT #2# (CDR #2#)) (GO G190) G191
                              (EXIT (NREVERSE #1#)))))
                  (EXIT
                   (|RDEPAR;do_param_rde| |fp| 'T |lg| |x| |k| |lk| |ext|
                    |logi| %))))))))) 

(SDEFUN |RDEPAR;do_param_rde|
        ((|fp| (F)) (|is_der| (|Boolean|)) (|lg| (|List| F)) (|x| (|Symbol|))
         (|k| (|Kernel| F)) (|lk| (|List| (|Kernel| F)))
         (|ext|
          (|Mapping|
           (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
           (|List| (|Kernel| F)) (|List| F)))
         (|logi|
          (|Mapping|
           (|Record| (|:| |logands| (|List| F))
                     (|:| |basis|
                          (|List| (|Vector| (|Fraction| (|Integer|))))))
           (|List| (|Kernel| F)) (|List| F)))
         (% (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))))
        (SPROG
         ((|dku| #1=(|Fraction| (|SparseUnivariatePolynomial| F)))
          (|dk| (|SparseUnivariatePolynomial| F)) (|fpu| #1#) (#2=#:G859 NIL)
          (|g| NIL) (#3=#:G860 NIL)
          (|der1|
           (|Mapping| (|SparseUnivariatePolynomial| F)
                      (|SparseUnivariatePolynomial| F)))
          (|#G249| #4=(|List| (|SparseUnivariatePolynomial| F))) (|d| NIL)
          (|#G250| #4#) (|h| NIL) (|aa| #5=(|SparseUnivariatePolynomial| F))
          (|bbr| (|Fraction| (|SparseUnivariatePolynomial| F))) (|aa1| #5#)
          (#6=#:G861 NIL) (#7=#:G862 NIL) (#8=#:G863 NIL) (|gu| NIL)
          (#9=#:G864 NIL)
          (|lgd|
           (|List|
            (|Record| (|:| |poly| (|SparseUnivariatePolynomial| F))
                      (|:| |normal|
                           #10=(|Fraction| (|SparseUnivariatePolynomial| F)))
                      (|:| |special|
                           (|Fraction| (|SparseUnivariatePolynomial| F))))))
          (#11=#:G865 NIL) (#12=#:G866 NIL) (|lnor1| (|List| #10#))
          (|rs1| (|Matrix| (|SparseUnivariatePolynomial| F)))
          (|rs2| (|Matrix| F))
          (|get_rs| (|Mapping| #13=(|Matrix| F) (|Matrix| F))) (|rs3| #13#)
          (|lker| (|List| (|Vector| F))) (#14=#:G867 NIL) (|dr| NIL)
          (#15=#:G868 NIL) (|lgu| (|List| #1#)) (|kv| NIL) (#16=#:G869 NIL)
          (|lgu1| (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
          (#17=#:G858 NIL)
          (|res1|
           (|List|
            (|Record|
             (|:| |ratpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
             (|:| |coeffs| (|Vector| F)))))
          (|re| NIL) (#18=#:G870 NIL) (|bv| (|Vector| F))
          (|ans1| (|Fraction| (|SparseUnivariatePolynomial| F))) (|anf| (F))
          (|res2|
           (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL (SPADCALL |k| (QREFELT % 166)) '|%alg| (QREFELT % 167))
             (|RDEPAR;do_alg_rde| |fp| |lg| |x| |k| |lk| |ext| |logi| %))
            ((SPADCALL |k| '|%diff| (QREFELT % 168))
             (|RDEPAR;do_diff_rde| |fp| |lg| |x| |k| |lk| |ext| |logi| %))
            (#19='T
             (SEQ
              (LETT |dku|
                    (SPADCALL
                     (SPADCALL (SPADCALL |k| (QREFELT % 31)) |x|
                               (QREFELT % 169))
                     |k| (QREFELT % 125)))
              (EXIT
               (COND
                ((SPADCALL (SPADCALL |dku| (QREFELT % 13))
                           (|spadConstant| % 67) (QREFELT % 69))
                 NIL)
                (#19#
                 (SEQ (LETT |dk| (SPADCALL |dku| (QREFELT % 22)))
                      (LETT |fpu| (SPADCALL |fp| |k| (QREFELT % 125)))
                      (LETT |lgu|
                            (PROGN
                             (LETT #2# NIL)
                             (SEQ (LETT |g| NIL) (LETT #3# |lg|) G190
                                  (COND
                                   ((OR (ATOM #3#)
                                        (PROGN (LETT |g| (CAR #3#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #2#
                                          (CONS
                                           (SPADCALL |g| |k| (QREFELT % 125))
                                           #2#))))
                                  (LETT #3# (CDR #3#)) (GO G190) G191
                                  (EXIT (NREVERSE #2#)))))
                      (LETT |der1|
                            (CONS #'|RDEPAR;do_param_rde!1|
                                  (VECTOR |dk| |x| %)))
                      (PROGN
                       (LETT |#G249| (|RDEPAR;get_denom| |fpu| |lgu| |der1| %))
                       (LETT |#G250| |#G249|)
                       (LETT |d| (|SPADfirst| |#G250|))
                       (LETT |#G250| (CDR |#G250|))
                       (LETT |h| (|SPADfirst| |#G250|))
                       |#G249|)
                      (LETT |aa| (SPADCALL |d| |h| (QREFELT % 80)))
                      (LETT |bbr|
                            (SPADCALL (SPADCALL |aa| |fpu| (QREFELT % 228))
                                      (SPADCALL
                                       (SPADCALL |d| (SPADCALL |h| |der1|)
                                                 (QREFELT % 80))
                                       (QREFELT % 72))
                                      (QREFELT % 173)))
                      (LETT |aa1| (SPADCALL |aa| |h| (QREFELT % 80)))
                      (LETT |lgu|
                            (PROGN
                             (LETT #6# NIL)
                             (SEQ (LETT |gu| NIL) (LETT #7# |lgu|) G190
                                  (COND
                                   ((OR (ATOM #7#)
                                        (PROGN (LETT |gu| (CAR #7#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #6#
                                          (CONS
                                           (SPADCALL |aa1| |gu|
                                                     (QREFELT % 228))
                                           #6#))))
                                  (LETT #7# (CDR #7#)) (GO G190) G191
                                  (EXIT (NREVERSE #6#)))))
                      (LETT |lgd|
                            (PROGN
                             (LETT #8# NIL)
                             (SEQ (LETT |gu| NIL) (LETT #9# |lgu|) G190
                                  (COND
                                   ((OR (ATOM #9#)
                                        (PROGN (LETT |gu| (CAR #9#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #8#
                                          (CONS
                                           (SPADCALL |gu| |der1|
                                                     (QREFELT % 230))
                                           #8#))))
                                  (LETT #9# (CDR #9#)) (GO G190) G191
                                  (EXIT (NREVERSE #8#)))))
                      (LETT |lnor1|
                            (PROGN
                             (LETT #11# NIL)
                             (SEQ (LETT |dr| NIL) (LETT #12# |lgd|) G190
                                  (COND
                                   ((OR (ATOM #12#)
                                        (PROGN (LETT |dr| (CAR #12#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #11# (CONS (QVELT |dr| 1) #11#))))
                                  (LETT #12# (CDR #12#)) (GO G190) G191
                                  (EXIT (NREVERSE #11#)))))
                      (LETT |rs1|
                            (SPADCALL (SPADCALL (LIST |lnor1|) (QREFELT % 233))
                                      (QREFELT % 234)))
                      (LETT |rs2| (SPADCALL |rs1| (QREFELT % 55)))
                      (LETT |get_rs|
                            (CONS #'|RDEPAR;do_param_rde!3| (VECTOR |x| %)))
                      (LETT |rs3| (SPADCALL |rs2| |get_rs|))
                      (LETT |lker| (SPADCALL |rs3| (QREFELT % 57)))
                      (EXIT
                       (COND ((NULL |lker|) NIL)
                             (#19#
                              (SEQ
                               (LETT |lgu|
                                     (PROGN
                                      (LETT #14# NIL)
                                      (SEQ (LETT |dr| NIL) (LETT #15# |lgd|)
                                           G190
                                           (COND
                                            ((OR (ATOM #15#)
                                                 (PROGN
                                                  (LETT |dr| (CAR #15#))
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (LETT #14#
                                                   (CONS
                                                    (SPADCALL
                                                     (SPADCALL (QVELT |dr| 0)
                                                               (QREFELT % 72))
                                                     (QVELT |dr| 2)
                                                     (QREFELT % 121))
                                                    #14#))))
                                           (LETT #15# (CDR #15#)) (GO G190)
                                           G191 (EXIT (NREVERSE #14#)))))
                               (LETT |lgu1| NIL)
                               (SEQ (LETT |kv| NIL) (LETT #16# |lker|) G190
                                    (COND
                                     ((OR (ATOM #16#)
                                          (PROGN (LETT |kv| (CAR #16#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT |lgu1|
                                            (CONS
                                             (SPADCALL |kv| |lgu|
                                                       (QREFELT % 120))
                                             |lgu1|))))
                                    (LETT #16# (CDR #16#)) (GO G190) G191
                                    (EXIT NIL))
                               (LETT |lgu1| (NREVERSE |lgu1|))
                               (LETT |res1|
                                     (COND
                                      ((OR
                                        (QEQCAR (SPADCALL |k| (QREFELT % 215))
                                                0)
                                        (OR
                                         (SPADCALL |k| '|log| (QREFELT % 168))
                                         (SPADCALL
                                          (SPADCALL |k| (QREFELT % 166))
                                          '|prim| (QREFELT % 167))))
                                       (|RDEPAR;do_SPDE_prim| |aa| |bbr|
                                        |is_der| |lgu1| |k| |lk| |ext| |logi|
                                        |der1| |get_rs| |x| %))
                                      ((SPADCALL |k| '|exp| (QREFELT % 168))
                                       (|RDEPAR;do_SPDE_exp| |aa| |bbr| |lgu1|
                                        |lk| |ext| |logi| |der1| |get_rs| |x|
                                        %))
                                      (#19#
                                       (PROGN
                                        (LETT #17# NIL)
                                        (GO #20=#:G857)))))
                               (LETT |res2| NIL)
                               (SEQ (LETT |re| NIL) (LETT #18# |res1|) G190
                                    (COND
                                     ((OR (ATOM #18#)
                                          (PROGN (LETT |re| (CAR #18#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (LETT |bv|
                                           (SPADCALL (QCDR |re|) |lker|
                                                     (QREFELT % 79)))
                                     (LETT |ans1|
                                           (SPADCALL
                                            (SPADCALL (QCAR |re|)
                                                      (SPADCALL |h|
                                                                (QREFELT % 72))
                                                      (QREFELT % 159))
                                            (QREFELT % 236)))
                                     (LETT |anf|
                                           (SPADCALL |ans1| |k|
                                                     (QREFELT % 123)))
                                     (EXIT
                                      (LETT |res2|
                                            (CONS (CONS |anf| |bv|) |res2|))))
                                    (LETT #18# (CDR #18#)) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT (NREVERSE |res2|))))))))))))))
          #20# (EXIT #17#)))) 

(SDEFUN |RDEPAR;do_param_rde!3| ((|m| NIL) ($$ NIL))
        (PROG (% |x|)
          (LETT % (QREFELT $$ 1))
          (LETT |x| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL |m|
                             (LIST
                              (CONS #'|RDEPAR;do_param_rde!2| (VECTOR % |x|)))
                             (QREFELT % 235))))))) 

(SDEFUN |RDEPAR;do_param_rde!2| ((|ff| NIL) ($$ NIL))
        (PROG (|x| %)
          (LETT |x| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |ff| |x| (QREFELT % 169)))))) 

(SDEFUN |RDEPAR;do_param_rde!1| ((|z1| NIL) ($$ NIL))
        (PROG (% |x| |dk|)
          (LETT % (QREFELT $$ 2))
          (LETT |x| (QREFELT $$ 1))
          (LETT |dk| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL |z1|
                             (CONS #'|RDEPAR;do_param_rde!0| (VECTOR % |x|))
                             |dk| (QREFELT % 171))))))) 

(SDEFUN |RDEPAR;do_param_rde!0| ((|z2| NIL) ($$ NIL))
        (PROG (|x| %)
          (LETT |x| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |z2| |x| (QREFELT % 169)))))) 

(DECLAIM (NOTINLINE |ParametricRischDE;|)) 

(DEFUN |ParametricRischDE;| (|#1| |#2|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|ParametricRischDE| DV$1 DV$2))
          (LETT % (GETREFV 237))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|ParametricRischDE| (LIST DV$1 DV$2)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |ParametricRischDE| (&REST #1=#:G871)
  (SPROG NIL
         (PROG (#2=#:G872)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ParametricRischDE|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |ParametricRischDE;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|ParametricRischDE|)))))))))) 

(MAKEPROP '|ParametricRischDE| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|SparseUnivariatePolynomial| 7) (|Fraction| 8) (|Mapping| 8 8)
              (|MonomialExtensionTools| 7 8) (0 . |normalDenom|) (6 . |denom|)
              (|List| %) (11 . |lcm|)
              (|Record| (|:| |normal| 8) (|:| |special| 8)) (16 . |split|)
              (22 . |gcd|) (28 . |differentiate|) (|Union| % '"failed")
              (33 . |exquo|) (39 . |numer|)
              (|Record| (|:| |coef1| %) (|:| |coef2| %)) (|Union| 23 '"failed")
              (44 . |extendedEuclidean|) (|Symbol|) (51 . |new|) (|Kernel| 7)
              (55 . |kernel|) (|Kernel| %) (60 . |coerce|) (65 . *) (71 . -)
              (77 . |resultant|) (|List| 39) (|FunctionSpaceRationalRoots| 6 7)
              (83 . |get_rational_roots|) (|Union| 42 '"failed")
              (|Fraction| 42) (89 . |retractIfCan|) (94 . |0|) (|Integer|)
              (98 . |coerce|) (|LaurentPolynomial| 7 8) (103 . |coerce|)
              (108 . |exquo|) (|Record| (|:| |ans| 8) (|:| |remainder| 8))
              (|RDEaux| 7) (114 . SPDE1) (|List| 59) (|Matrix| 8)
              (121 . |matrix|) (|Matrix| 7) (|Matrix| %)
              (126 . |reducedSystem|) (|List| 58) (131 . |nullSpace|)
              (|Vector| 7) (|List| 8) (|LinearCombinationUtilities| 7 8)
              (136 . |lin_comb|) (142 . |1|) (146 . |1|) (|NonNegativeInteger|)
              (150 . |monomial|) (156 . |degree|) (161 . |1|) (|Boolean|)
              (165 . ~=) (171 . =) (177 . |0|) (181 . |coerce|)
              (186 . |retract|)
              (|Record| (|:| |ans| 59) (|:| |acoeff| 8) (|:| |eegen| 8)
                        (|:| |bpar| 8) (|:| |lcpar| 59) (|:| |dpar| 42))
              (|Union| (|List| 47) 74) (191 . |multi_SPDE|)
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (200 . |divide|) (206 . |lin_comb|) (212 . *) (218 . +)
              (|Record| (|:| |num| 83) (|:| |den| 42)) (|Vector| 39)
              (|CommonDenominator| 42 39 83) (224 . |splitDenominator|)
              (229 . ~=) (235 . |elt|) (241 . |1|) (245 . ~=) (251 . |retract|)
              (|List| 42) (|Vector| 42) (256 . |vector|) (|Vector| 8)
              (261 . |vector|) (266 . |0|) (270 . |setelt!|) (277 . |max|)
              (|Mapping| 42 42 42) (283 . |reduce|) (290 . |retract|)
              (295 . |0|) (299 . |elt|) (305 . |leadingCoefficient|)
              (310 . |reductum|) (315 . |setelt!|) (322 . -) (|List| 7)
              (327 . |lin_comb|) (333 . *) (339 . +)
              (|Record| (|:| |ratpart| 7) (|:| |coeffs| 58)) (|List| 112)
              (|List| 28) (|Mapping| 113 114 108)
              (|Record| (|:| |logands| 108) (|:| |basis| (|List| 83)))
              (|Mapping| 116 114 108) |RDEPAR;param_rde2;FLSLMML;15| (|List| 9)
              (345 . |lin_comb|) (351 . +)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 28) 28
                                                     6
                                                     (|SparseMultivariatePolynomial|
                                                      6 28)
                                                     7)
              (357 . |multivariate|) (|Fraction| 223) (363 . |univariate|)
              (369 . =) (375 . |reduce|) (381 . /) (387 . |retractIfCan|)
              (|Union| 112 '"failed")
              (|Record| (|:| |particular| 130) (|:| |basis| 113))
              (392 . |dehomogenize|) (397 . |elt|) (|List| 44) (|Vector| 44)
              (403 . |vector|) (408 . |0|) (412 . |degree|) (417 . |elt|)
              (423 . ~=) (429 . |leadingCoefficient|) (434 . |reductum|)
              (439 . |setelt!|) (446 . |lin_comb|) (452 . |monomial|) (458 . +)
              (464 . |convert|) (469 . |coefficient|) (475 . |coefficient|)
              (481 . /) |RDEPAR;exp_lower_bound;SupLp2ILFMI;11| (487 . |order|)
              (492 . |min|) (498 . |retract|) (503 . |coerce|) (508 . *)
              (514 . |retract|) (519 . |1|) (523 . /)
              |RDEPAR;param_rde;IFLSLMML;21| |RDEPAR;param_rde;I2FLSLMMR;14|
              (|IntegrationTools| 6 7) (529 . |kmax|) (534 . ~=)
              (|BasicOperator|) (540 . |operator|) (545 . |has?|) (551 . |is?|)
              (557 . |differentiate|) (|Mapping| 7 7) (563 . |differentiate|)
              (570 . /) (576 . -) (582 . ^) (|List| 170)
              (|ConstantLinearDependence| 6 7) (588 . |nullSpaceOverConstants|)
              (594 . |argument|) (599 . |elt|) (605 . |retract|) (610 . |eval|)
              (617 . |coerce|) (622 . |eval|) (629 . |append|) (|List| 30)
              (635 . |tower|) (640 . |varselect|) (|ParametricIntegration| 6 7)
              (646 . |extendedint|) (653 . |logextint|)
              (|Record| (|:| |transform| 53) (|:| |basis| 56))
              (660 . |constant_subspace|) (666 . |vector|) (671 . *)
              (677 . |entries|) (682 . |map|) (688 . ~=) (|List| 108)
              (694 . |matrix|) (|Mapping| 113 59) (|Mapping| 56 53)
              (|ParametricTranscendentalIntegration| 7 8) (699 . |diffextint|)
              (706 . |retract|) (711 . D) (|RootFSSplit| 6 7)
              (717 . |alg_split_root0|) (|Vector| 108) (724 . |vector|)
              (729 . |elt|) (735 . |setelt!|) (742 . |kernels|)
              (747 . |member?|) (|Union| 26 '"failed") (753 . |symbolIfCan|)
              (|Record| (|:| |particular| 113) (|:| |basis| 108))
              (|PureAlgebraicIntegration| 6 7 7) (758 . |param_RDE|)
              (766 . |concat|)
              (|Record| (|:| |primelt| 7) (|:| |pol1| 8) (|:| |pol2| 8)
                        (|:| |prim| 8))
              (|FunctionSpacePrimitiveElement| 6 7) (772 . |primitiveElement|)
              (|SparseUnivariatePolynomial| %) (778 . |rootOf|) (783 . |elt|)
              (789 . |eval|) (796 . *) (802 . *)
              (|Record| (|:| |poly| 8) (|:| |normal| 9) (|:| |special| 9))
              (808 . |decompose|) (|List| 119) (|Matrix| 9) (814 . |matrix|)
              (819 . |reducedSystem|) (824 . |reducedSystem|) (830 . -))
           '#(|param_rde2| 835 |param_rde| 845 |exp_lower_bound| 868) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|param_rde|
                                 ((|List|
                                   (|Record| (|:| |ratpart| |#2|)
                                             (|:| |coeffs| (|Vector| |#2|))))
                                  (|Integer|) |#2| (|List| |#2|) (|Symbol|)
                                  (|List| (|Kernel| |#2|))
                                  (|Mapping|
                                   (|List|
                                    (|Record| (|:| |ratpart| |#2|)
                                              (|:| |coeffs| (|Vector| |#2|))))
                                   (|List| (|Kernel| |#2|)) (|List| |#2|))
                                  (|Mapping|
                                   (|Record| (|:| |logands| (|List| |#2|))
                                             (|:| |basis|
                                                  (|List|
                                                   (|Vector|
                                                    (|Fraction|
                                                     (|Integer|))))))
                                   (|List| (|Kernel| |#2|)) (|List| |#2|))))
                                T)
                              '((|param_rde|
                                 ((|Record|
                                   (|:| |particular|
                                        (|Union|
                                         (|Record| (|:| |ratpart| |#2|)
                                                   (|:| |coeffs|
                                                        (|Vector| |#2|)))
                                         "failed"))
                                   (|:| |basis|
                                        (|List|
                                         (|Record| (|:| |ratpart| |#2|)
                                                   (|:| |coeffs|
                                                        (|Vector| |#2|))))))
                                  (|Integer|) |#2| |#2| (|List| |#2|)
                                  (|Symbol|) (|List| (|Kernel| |#2|))
                                  (|Mapping|
                                   (|List|
                                    (|Record| (|:| |ratpart| |#2|)
                                              (|:| |coeffs| (|Vector| |#2|))))
                                   (|List| (|Kernel| |#2|)) (|List| |#2|))
                                  (|Mapping|
                                   (|Record| (|:| |logands| (|List| |#2|))
                                             (|:| |basis|
                                                  (|List|
                                                   (|Vector|
                                                    (|Fraction|
                                                     (|Integer|))))))
                                   (|List| (|Kernel| |#2|)) (|List| |#2|))))
                                T)
                              '((|param_rde2|
                                 ((|List|
                                   (|Record| (|:| |ratpart| |#2|)
                                             (|:| |coeffs| (|Vector| |#2|))))
                                  |#2| (|List| |#2|) (|Symbol|)
                                  (|List| (|Kernel| |#2|))
                                  (|Mapping|
                                   (|List|
                                    (|Record| (|:| |ratpart| |#2|)
                                              (|:| |coeffs| (|Vector| |#2|))))
                                   (|List| (|Kernel| |#2|)) (|List| |#2|))
                                  (|Mapping|
                                   (|Record| (|:| |logands| (|List| |#2|))
                                             (|:| |basis|
                                                  (|List|
                                                   (|Vector|
                                                    (|Fraction|
                                                     (|Integer|))))))
                                   (|List| (|Kernel| |#2|)) (|List| |#2|))))
                                T)
                              '((|exp_lower_bound|
                                 ((|Integer|)
                                  (|SparseUnivariatePolynomial| |#2|)
                                  (|LaurentPolynomial| |#2|
                                                       (|SparseUnivariatePolynomial|
                                                        |#2|))
                                  (|Integer|) (|Integer|)
                                  (|List| (|Kernel| |#2|)) |#2|
                                  (|Mapping|
                                   (|Record| (|:| |logands| (|List| |#2|))
                                             (|:| |basis|
                                                  (|List|
                                                   (|Vector|
                                                    (|Fraction|
                                                     (|Integer|))))))
                                   (|List| (|Kernel| |#2|)) (|List| |#2|))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 236
                                            '(2 11 8 9 10 12 1 9 8 0 13 1 8 0
                                              14 15 2 11 16 8 10 17 2 8 0 0 0
                                              18 1 8 0 0 19 2 8 20 0 0 21 1 9 8
                                              0 22 3 8 24 0 0 0 25 0 26 0 27 1
                                              28 0 26 29 1 7 0 30 31 2 8 0 7 0
                                              32 2 8 0 0 0 33 2 8 7 0 0 34 2 36
                                              35 7 28 37 1 39 38 0 40 0 6 0 41
                                              1 7 0 42 43 1 44 0 8 45 2 44 20 0
                                              0 46 3 48 47 8 8 10 49 1 51 0 50
                                              52 1 8 53 54 55 1 53 56 0 57 2 60
                                              8 58 59 61 0 6 0 62 0 7 0 63 2 8
                                              0 7 64 65 1 8 64 0 66 0 8 0 67 2
                                              8 68 0 0 69 2 8 68 0 0 70 0 8 0
                                              71 1 9 0 8 72 1 9 8 0 73 5 48 75
                                              8 8 59 42 10 76 2 8 77 0 0 78 2
                                              60 58 58 56 79 2 8 0 0 0 80 2 8 0
                                              0 0 81 1 84 82 83 85 2 42 68 0 0
                                              86 2 83 39 0 42 87 0 39 0 88 2 39
                                              68 0 0 89 1 39 42 0 90 1 92 0 91
                                              93 1 94 0 59 95 0 7 0 96 3 58 7 0
                                              42 7 97 2 42 0 0 0 98 3 91 42 99
                                              0 42 100 1 8 7 0 101 0 9 0 102 2
                                              94 8 0 42 103 1 8 7 0 104 1 8 0 0
                                              105 3 94 8 0 42 8 106 1 7 0 0 107
                                              2 60 7 58 108 109 2 7 0 0 0 110 2
                                              7 0 0 0 111 2 60 9 58 119 120 2 9
                                              0 0 0 121 2 122 7 9 28 123 2 7
                                              124 0 30 125 2 7 68 0 0 126 2 91
                                              42 99 0 127 2 7 0 0 0 128 1 7 38
                                              0 129 1 60 131 113 132 2 58 7 0
                                              42 133 1 135 0 134 136 0 44 0 137
                                              1 44 42 0 138 2 135 44 0 42 139 2
                                              44 68 0 0 140 1 44 7 0 141 1 44 0
                                              0 142 3 135 44 0 42 44 143 2 60
                                              44 58 134 144 2 44 0 7 42 145 2
                                              44 0 0 0 146 1 44 9 0 147 2 44 7
                                              0 42 148 2 8 7 0 64 149 2 39 0 0
                                              0 150 1 44 42 0 152 2 42 0 0 0
                                              153 1 44 7 0 154 1 44 0 7 155 2
                                              44 0 0 0 156 1 44 8 0 157 0 9 0
                                              158 2 9 0 0 0 159 1 162 28 114
                                              163 2 28 68 0 0 164 1 28 165 0
                                              166 2 165 68 0 26 167 2 28 68 0
                                              26 168 2 7 0 0 26 169 3 8 0 0 170
                                              0 171 2 9 0 8 8 172 2 9 0 0 0 173
                                              2 8 0 0 64 174 2 176 56 53 175
                                              177 1 28 108 0 178 2 108 7 0 42
                                              179 1 7 30 0 180 3 7 0 0 30 0 181
                                              1 7 0 26 182 3 7 0 0 0 0 183 2
                                              108 0 0 0 184 1 7 185 14 186 2
                                              162 114 114 26 187 3 188 113 26
                                              114 108 189 3 188 116 26 114 108
                                              190 2 176 191 56 175 192 1 58 0
                                              108 193 2 53 58 0 58 194 1 58 108
                                              0 195 2 108 0 170 0 196 2 7 68 0
                                              0 197 1 53 0 198 199 3 202 113
                                              200 201 119 203 1 7 42 0 204 2 7
                                              0 0 26 205 3 206 108 7 28 42 207
                                              1 208 0 198 209 2 208 108 0 42
                                              210 3 208 108 0 42 108 211 1 7
                                              185 0 212 2 114 68 28 0 213 1 28
                                              214 0 215 4 217 216 7 108 28 28
                                              218 2 113 0 0 0 219 2 221 220 7 7
                                              222 1 7 0 223 224 2 8 7 0 7 225 3
                                              7 0 0 185 14 226 2 7 0 42 0 227 2
                                              9 0 8 0 228 2 11 229 9 10 230 1
                                              232 0 231 233 1 9 51 54 234 2 176
                                              53 53 175 235 1 9 0 0 236 6 0 113
                                              7 108 26 114 115 117 118 7 0 113
                                              42 7 108 26 114 115 117 160 8 0
                                              131 42 7 7 108 26 114 115 117 161
                                              7 0 42 8 44 42 42 114 7 117
                                              151)))))
           '|lookupComplete|)) 
