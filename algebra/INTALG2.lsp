
(SDEFUN |INTALG2;exp_hermite1|
        ((|f| (R)) (|der| (|Mapping| UP UP))
         (% (|Record| (|:| |answer| R) (|:| |logpart| R) (|:| |polypart| R))))
        (SPROG
         ((|c| (|Record| (|:| |num| #1=(|Vector| UP)) (|:| |den| UP)))
          (|d| (UP)) (|v| #1#) (|n| (|NonNegativeInteger|))
          (|vp| #2=(|Vector| (|Fraction| UP))) (|vf| #2#) (|i| NIL)
          (#3=#:G23 NIL)
          (|r|
           (|Record| (|:| |polyPart| (|LaurentPolynomial| F UP))
                     (|:| |fracPart| (|Fraction| UP))))
          (|w| (|Vector| R)) (|ff| (R)) (|fp| (R))
          (|h| (|Record| (|:| |answer| R) (|:| |logpart| R))))
         (SEQ (LETT |d| (QCDR (LETT |c| (SPADCALL |f| (QREFELT % 12)))))
              (LETT |v| (QCAR |c|))
              (LETT |vp|
                    (MAKEARR1 (LETT |n| (QVSIZE |v|)) (|spadConstant| % 14)))
              (LETT |vf| (MAKEARR1 |n| (|spadConstant| % 14)))
              (SEQ (LETT |i| (SPADCALL |v| (QREFELT % 19)))
                   (LETT #3# (QVSIZE |v|)) G190 (COND ((> |i| #3#) (GO G191)))
                   (SEQ
                    (LETT |r|
                          (SPADCALL
                           (SPADCALL (QAREF1O |v| |i| 1) |d| (QREFELT % 20))
                           (QREFELT % 23)))
                    (QSETAREF1O |vf| |i| (QCDR |r|) 1)
                    (EXIT
                     (QSETAREF1O |vp| |i| (SPADCALL (QCAR |r|) (QREFELT % 24))
                                 1)))
                   (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
              (LETT |ff|
                    (SPADCALL |vf| (LETT |w| (SPADCALL (QREFELT % 26)))
                              (QREFELT % 28)))
              (LETT |fp| (SPADCALL |vp| |w| (QREFELT % 28)))
              (LETT |h| (SPADCALL |ff| |der| (QREFELT % 32)))
              (EXIT (VECTOR (QCAR |h|) (QCDR |h|) |fp|))))) 

(SDEFUN |INTALG2;prim_hermite1|
        ((|f| (R)) (|der| (|Mapping| UP UP))
         (% (|Record| (|:| |answer| R) (|:| |logpart| R) (|:| |polypart| R))))
        (SPROG
         ((|h| (|Record| (|:| |answer| R) (|:| |logpart| R))) (|hh| (R))
          (|c| (|Record| (|:| |num| #1=(|Vector| UP)) (|:| |den| UP)))
          (|d| (UP)) (|v| #1#) (|n| (|NonNegativeInteger|))
          (|vp| #2=(|Vector| (|Fraction| UP))) (|vf| #2#) (|i| NIL)
          (#3=#:G35 NIL)
          (|r| (|Record| (|:| |quotient| UP) (|:| |remainder| UP)))
          (|w| (|Vector| R)) (|ff| (R)) (|fp| (R)))
         (SEQ (LETT |h| (SPADCALL |f| |der| (QREFELT % 32)))
              (EXIT
               (COND
                ((SPADCALL (LETT |hh| (QCDR |h|)) (QREFELT % 34))
                 (VECTOR (QCAR |h|) (|spadConstant| % 35)
                         (|spadConstant| % 35)))
                ('T
                 (SEQ
                  (LETT |d| (QCDR (LETT |c| (SPADCALL |hh| (QREFELT % 12)))))
                  (LETT |v| (QCAR |c|))
                  (LETT |vp|
                        (MAKEARR1 (LETT |n| (QVSIZE |v|))
                                  (|spadConstant| % 14)))
                  (LETT |vf| (MAKEARR1 |n| (|spadConstant| % 14)))
                  (SEQ (LETT |i| (SPADCALL |v| (QREFELT % 19)))
                       (LETT #3# (QVSIZE |v|)) G190
                       (COND ((> |i| #3#) (GO G191)))
                       (SEQ
                        (LETT |r|
                              (SPADCALL (QAREF1O |v| |i| 1) |d|
                                        (QREFELT % 37)))
                        (QSETAREF1O |vf| |i|
                                    (SPADCALL (QCDR |r|) |d| (QREFELT % 20)) 1)
                        (EXIT
                         (QSETAREF1O |vp| |i|
                                     (SPADCALL (QCAR |r|) (QREFELT % 38)) 1)))
                       (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                  (LETT |ff|
                        (SPADCALL |vf| (LETT |w| (SPADCALL (QREFELT % 26)))
                                  (QREFELT % 28)))
                  (LETT |fp| (SPADCALL |vp| |w| (QREFELT % 28)))
                  (EXIT (VECTOR (QCAR |h|) |ff| |fp|))))))))) 

(SDEFUN |INTALG2;list_hermite|
        ((|lf| (|List| R))
         (|hermite1|
          (|Mapping|
           (|Record| (|:| |answer| R) (|:| |logpart| R) (|:| |polypart| R)) R))
         (%
          (|List|
           (|Record| (|:| |answer| R) (|:| |logpart| R) (|:| |polypart| R)))))
        (SPROG ((#1=#:G39 NIL) (|f| NIL) (#2=#:G40 NIL))
               (SEQ
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |f| NIL) (LETT #2# |lf|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |f| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT (LETT #1# (CONS (SPADCALL |f| |hermite1|) #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#))))))) 

(SDEFUN |INTALG2;lin_comb2| ((|v| (|Vector| F)) (|lr| (|List| R)) (% (R)))
        (SPROG ((|r| NIL) (#1=#:G46 NIL) (|i| NIL) (#2=#:G45 NIL) (|res| (R)))
               (SEQ (LETT |res| (|spadConstant| % 35))
                    (SEQ (LETT |r| NIL) (LETT #1# |lr|) (LETT |i| 1)
                         (LETT #2# (QVSIZE |v|)) G190
                         (COND
                          ((OR (|greater_SI| |i| #2#) (ATOM #1#)
                               (PROGN (LETT |r| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |res|
                                 (SPADCALL |res|
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL |v| |i| (QREFELT % 40))
                                              (QREFELT % 41))
                                             (QREFELT % 38))
                                            |r| (QREFELT % 42))
                                           (QREFELT % 43)))))
                         (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #1# (CDR #1#))))
                         (GO G190) G191 (EXIT NIL))
                    (EXIT |res|)))) 

(SDEFUN |INTALG2;split_logpart|
        ((|p| (|Fraction| UP)) (|lg| (|Fraction| UP)) (|dden| (UP))
         (%
          (|Record| (|:| |polypart| (|Fraction| UP))
                    (|:| |logpart| (|Fraction| UP)))))
        (SPROG
         ((|d0| (UP)) (|g| (UP)) (#1=#:G52 NIL) (|d1| (UP))
          (|eeu|
           (|Union| (|Record| (|:| |coef1| UP) (|:| |coef2| UP)) #2="failed"))
          (#3=#:G60 NIL) (|#G23| (|Record| (|:| |coef1| UP) (|:| |coef2| UP)))
          (|a| (UP)) (|b| (UP)))
         (SEQ (LETT |d0| (SPADCALL |lg| (QREFELT % 44)))
              (LETT |g| (SPADCALL |dden| |d0| (QREFELT % 45)))
              (EXIT
               (COND ((SPADCALL |g| (QREFELT % 46)) (CONS |p| |lg|))
                     (#4='T
                      (SEQ
                       (LETT |d1|
                             (PROG2
                                 (LETT #1# (SPADCALL |d0| |g| (QREFELT % 48)))
                                 (QCDR #1#)
                               (|check_union2| (QEQCAR #1# 0) (QREFELT % 8)
                                               (|Union| (QREFELT % 8) "failed")
                                               #1#)))
                       (EXIT
                        (COND
                         ((SPADCALL |d1| (QREFELT % 46))
                          (CONS (SPADCALL |p| |lg| (QREFELT % 49))
                                (|spadConstant| % 14)))
                         (#4#
                          (SEQ
                           (LETT |eeu|
                                 (SPADCALL |g| |d1|
                                           (SPADCALL |lg| (QREFELT % 50))
                                           (QREFELT % 53)))
                           (PROGN
                            (LETT |#G23|
                                  (PROG2 (LETT #3# |eeu|)
                                      (QCDR #3#)
                                    (|check_union2| (QEQCAR #3# 0)
                                                    (|Record|
                                                     (|:| |coef1|
                                                          (QREFELT % 8))
                                                     (|:| |coef2|
                                                          (QREFELT % 8)))
                                                    (|Union|
                                                     (|Record|
                                                      (|:| |coef1|
                                                           (QREFELT % 8))
                                                      (|:| |coef2|
                                                           (QREFELT % 8)))
                                                     #2#)
                                                    #3#)))
                            (LETT |a| (QCAR |#G23|))
                            (LETT |b| (QCDR |#G23|))
                            |#G23|)
                           (EXIT
                            (CONS
                             (SPADCALL |p| (SPADCALL |a| |d1| (QREFELT % 20))
                                       (QREFELT % 49))
                             (SPADCALL |b| |g| (QREFELT % 20))))))))))))))) 

(SDEFUN |INTALG2;split_logparts|
        ((|lup| (|List| (|Fraction| UP))) (|llog| (|List| (|Fraction| UP)))
         (|dden| (UP))
         (%
          (|Record| (|:| |polypart| (|List| (|Fraction| UP)))
                    (|:| |logpart| (|List| (|Fraction| UP))))))
        (SPROG
         ((|lg1| NIL) (#1=#:G73 NIL) (|p1| NIL) (#2=#:G72 NIL)
          (|#G29|
           (|Record| (|:| |polypart| (|Fraction| UP))
                     (|:| |logpart| (|Fraction| UP))))
          (|p2| (|Fraction| UP)) (|lg2| (|Fraction| UP))
          (|pres| (|List| (|Fraction| UP))) (|lres| (|List| (|Fraction| UP))))
         (SEQ (LETT |pres| NIL) (LETT |lres| NIL)
              (SEQ (LETT |lg1| NIL) (LETT #1# |llog|) (LETT |p1| NIL)
                   (LETT #2# |lup|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |p1| (CAR #2#)) NIL)
                         (ATOM #1#) (PROGN (LETT |lg1| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (PROGN
                     (LETT |#G29|
                           (|INTALG2;split_logpart| |p1| |lg1| |dden| %))
                     (LETT |p2| (QCAR |#G29|))
                     (LETT |lg2| (QCDR |#G29|))
                     |#G29|)
                    (LETT |lres| (CONS |lg2| |lres|))
                    (EXIT (LETT |pres| (CONS |p2| |pres|))))
                   (LETT #2# (PROG1 (CDR #2#) (LETT #1# (CDR #1#)))) (GO G190)
                   G191 (EXIT NIL))
              (LETT |pres| (NREVERSE |pres|)) (LETT |lres| (NREVERSE |lres|))
              (EXIT (CONS |pres| |lres|))))) 

(SDEFUN |INTALG2;diagextint|
        ((|dden| (UP)) (|dm| (|Matrix| UP)) (|w| (|Vector| R))
         (|lpv| (|List| (|Vector| (|Fraction| UP))))
         (|lgv| (|List| (|Vector| (|Fraction| UP)))) (|ca0| (|List| R))
         (|ext|
          (|Mapping|
           #1=(|List|
               (|Record| (|:| |ratpart| (|Fraction| UP))
                         (|:| |coeffs| #2=(|Vector| F))))
           (|List| (|Fraction| UP))))
         (|rde|
          (|Mapping|
           #3=(|List|
               (|Record| (|:| |ratpart| (|Fraction| UP))
                         (|:| |coeffs| (|Vector| F))))
           (|Fraction| UP) (|List| (|Fraction| UP))))
         (|csolve| (|Mapping| (|List| (|Vector| F)) (|Matrix| F)))
         (% (|List| (|Record| (|:| |ratpart| R) (|:| |coeffs| (|Vector| F))))))
        (SPROG
         ((#4=#:G107 NIL) (#5=#:G109 NIL) (#6=#:G108 NIL)
          (|lrf| (|List| (|Fraction| UP))) (|res0| #1#) (#7=#:G110 NIL)
          (#8=#:G111 NIL) (#9=#:G112 NIL) (|be0| NIL) (#10=#:G113 NIL)
          (|i| NIL) (#11=#:G114 NIL) (|dmi| (|Fraction| UP)) (#12=#:G115 NIL)
          (|pv| NIL) (#13=#:G116 NIL) (|lup0| (|List| #14=(|Fraction| UP)))
          (#15=#:G117 NIL) (|gv| NIL) (#16=#:G118 NIL) (|llog0| (|List| #14#))
          (|#G46|
           (|Record| (|:| |polypart| (|List| (|Fraction| UP)))
                     (|:| |logpart| (|List| (|Fraction| UP)))))
          (|lup1| (|List| (|Fraction| UP))) (|llog1| (|List| (|Fraction| UP)))
          (#17=#:G119 NIL) (#18=#:G120 NIL)
          (|llog2| (|List| #19=(|Fraction| UP))) (|res1| (|List| (|Vector| F)))
          (#20=#:G121 NIL) (#21=#:G122 NIL) (|ncb0| (|List| #22=(|Vector| F)))
          (#23=#:G123 NIL) (#24=#:G124 NIL) (|nca0| (|List| R))
          (#25=#:G125 NIL) (#26=#:G126 NIL) (|lup2| (|List| #19#)) (|res2| #3#)
          (#27=#:G127 NIL) (#28=#:G128 NIL) (|ncb1| (|List| #22#)) (|wi| (R))
          (#29=#:G129 NIL) (|be| NIL) (#30=#:G130 NIL) (|nca1| (|List| R))
          (|cb| (|List| #2#)) (|ca| (|List| R)) (#31=#:G131 NIL) (|bv| NIL)
          (#32=#:G133 NIL) (|ai| NIL) (#33=#:G132 NIL))
         (SEQ
          (LETT |lrf|
                (PROGN
                 (LETT #4# NIL)
                 (SEQ (LETT |gv| NIL) (LETT #5# |lgv|) (LETT |pv| NIL)
                      (LETT #6# |lpv|) G190
                      (COND
                       ((OR (ATOM #6#) (PROGN (LETT |pv| (CAR #6#)) NIL)
                            (ATOM #5#) (PROGN (LETT |gv| (CAR #5#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS
                               (SPADCALL (SPADCALL |pv| 1 (QREFELT % 56))
                                         (SPADCALL |gv| 1 (QREFELT % 56))
                                         (QREFELT % 49))
                               #4#))))
                      (LETT #6# (PROG1 (CDR #6#) (LETT #5# (CDR #5#))))
                      (GO G190) G191 (EXIT (NREVERSE #4#)))))
          (LETT |res0| (SPADCALL |lrf| |ext|))
          (LETT |cb|
                (PROGN
                 (LETT #7# NIL)
                 (SEQ (LETT |be0| NIL) (LETT #8# |res0|) G190
                      (COND
                       ((OR (ATOM #8#) (PROGN (LETT |be0| (CAR #8#)) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #7# (CONS (QCDR |be0|) #7#))))
                      (LETT #8# (CDR #8#)) (GO G190) G191
                      (EXIT (NREVERSE #7#)))))
          (LETT |wi| (SPADCALL |w| 1 (QREFELT % 58)))
          (LETT |ca|
                (PROGN
                 (LETT #9# NIL)
                 (SEQ (LETT |be0| NIL) (LETT #10# |res0|) G190
                      (COND
                       ((OR (ATOM #10#) (PROGN (LETT |be0| (CAR #10#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #9#
                              (CONS (SPADCALL (QCAR |be0|) |wi| (QREFELT % 42))
                                    #9#))))
                      (LETT #10# (CDR #10#)) (GO G190) G191
                      (EXIT (NREVERSE #9#)))))
          (SEQ (LETT |i| 2) (LETT #11# (QVSIZE |w|)) G190
               (COND ((|greater_SI| |i| #11#) (GO G191)))
               (SEQ
                (LETT |dmi|
                      (SPADCALL (SPADCALL |dm| |i| |i| (QREFELT % 60)) |dden|
                                (QREFELT % 20)))
                (LETT |lup0|
                      (PROGN
                       (LETT #12# NIL)
                       (SEQ (LETT |pv| NIL) (LETT #13# |lpv|) G190
                            (COND
                             ((OR (ATOM #13#)
                                  (PROGN (LETT |pv| (CAR #13#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #12#
                                    (CONS (SPADCALL |pv| |i| (QREFELT % 56))
                                          #12#))))
                            (LETT #13# (CDR #13#)) (GO G190) G191
                            (EXIT (NREVERSE #12#)))))
                (LETT |llog0|
                      (PROGN
                       (LETT #15# NIL)
                       (SEQ (LETT |gv| NIL) (LETT #16# |lgv|) G190
                            (COND
                             ((OR (ATOM #16#)
                                  (PROGN (LETT |gv| (CAR #16#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #15#
                                    (CONS (SPADCALL |gv| |i| (QREFELT % 56))
                                          #15#))))
                            (LETT #16# (CDR #16#)) (GO G190) G191
                            (EXIT (NREVERSE #15#)))))
                (PROGN
                 (LETT |#G46|
                       (|INTALG2;split_logparts| |lup0| |llog0|
                        (SPADCALL |dmi| (QREFELT % 44)) %))
                 (LETT |lup1| (QCAR |#G46|))
                 (LETT |llog1| (QCDR |#G46|))
                 |#G46|)
                (LETT |llog2|
                      (PROGN
                       (LETT #17# NIL)
                       (SEQ (LETT |bv| NIL) (LETT #18# |cb|) G190
                            (COND
                             ((OR (ATOM #18#)
                                  (PROGN (LETT |bv| (CAR #18#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #17#
                                    (CONS
                                     (SPADCALL |bv| |llog1| (QREFELT % 63))
                                     #17#))))
                            (LETT #18# (CDR #18#)) (GO G190) G191
                            (EXIT (NREVERSE #17#)))))
                (LETT |res1| (SPADCALL |csolve| |llog2| (QREFELT % 67)))
                (LETT |ncb0|
                      (PROGN
                       (LETT #20# NIL)
                       (SEQ (LETT |bv| NIL) (LETT #21# |res1|) G190
                            (COND
                             ((OR (ATOM #21#)
                                  (PROGN (LETT |bv| (CAR #21#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #20#
                                    (CONS (SPADCALL |bv| |cb| (QREFELT % 68))
                                          #20#))))
                            (LETT #21# (CDR #21#)) (GO G190) G191
                            (EXIT (NREVERSE #20#)))))
                (LETT |nca0|
                      (PROGN
                       (LETT #23# NIL)
                       (SEQ (LETT |bv| NIL) (LETT #24# |res1|) G190
                            (COND
                             ((OR (ATOM #24#)
                                  (PROGN (LETT |bv| (CAR #24#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #23#
                                    (CONS (|INTALG2;lin_comb2| |bv| |ca| %)
                                          #23#))))
                            (LETT #24# (CDR #24#)) (GO G190) G191
                            (EXIT (NREVERSE #23#)))))
                (LETT |cb| |ncb0|) (LETT |ca| |nca0|)
                (LETT |lup2|
                      (PROGN
                       (LETT #25# NIL)
                       (SEQ (LETT |bv| NIL) (LETT #26# |cb|) G190
                            (COND
                             ((OR (ATOM #26#)
                                  (PROGN (LETT |bv| (CAR #26#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #25#
                                    (CONS (SPADCALL |bv| |lup1| (QREFELT % 63))
                                          #25#))))
                            (LETT #26# (CDR #26#)) (GO G190) G191
                            (EXIT (NREVERSE #25#)))))
                (LETT |res2| (SPADCALL |dmi| |lup2| |rde|))
                (LETT |ncb1|
                      (PROGN
                       (LETT #27# NIL)
                       (SEQ (LETT |be| NIL) (LETT #28# |res2|) G190
                            (COND
                             ((OR (ATOM #28#)
                                  (PROGN (LETT |be| (CAR #28#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #27#
                                    (CONS
                                     (SPADCALL (QCDR |be|) |cb| (QREFELT % 68))
                                     #27#))))
                            (LETT #28# (CDR #28#)) (GO G190) G191
                            (EXIT (NREVERSE #27#)))))
                (LETT |wi| (SPADCALL |w| |i| (QREFELT % 58)))
                (LETT |nca1|
                      (PROGN
                       (LETT #29# NIL)
                       (SEQ (LETT |be| NIL) (LETT #30# |res2|) G190
                            (COND
                             ((OR (ATOM #30#)
                                  (PROGN (LETT |be| (CAR #30#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #29#
                                    (CONS
                                     (SPADCALL
                                      (SPADCALL (QCAR |be|) |wi|
                                                (QREFELT % 42))
                                      (|INTALG2;lin_comb2| (QCDR |be|) |ca| %)
                                      (QREFELT % 43))
                                     #29#))))
                            (LETT #30# (CDR #30#)) (GO G190) G191
                            (EXIT (NREVERSE #29#)))))
                (LETT |cb| |ncb1|) (EXIT (LETT |ca| |nca1|)))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (EXIT
           (PROGN
            (LETT #31# NIL)
            (SEQ (LETT |bv| NIL) (LETT #32# |cb|) (LETT |ai| NIL)
                 (LETT #33# |ca|) G190
                 (COND
                  ((OR (ATOM #33#) (PROGN (LETT |ai| (CAR #33#)) NIL)
                       (ATOM #32#) (PROGN (LETT |bv| (CAR #32#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #31#
                         (CONS
                          (CONS
                           (SPADCALL |ai| (|INTALG2;lin_comb2| |bv| |ca0| %)
                                     (QREFELT % 69))
                           |bv|)
                          #31#))))
                 (LETT #33# (PROG1 (CDR #33#) (LETT #32# (CDR #32#))))
                 (GO G190) G191 (EXIT (NREVERSE #31#)))))))) 

(SDEFUN |INTALG2;R_to_VQF| ((|p| (R)) (% (|Vector| (|Fraction| UP))))
        (SPROG
         ((|c| (|Record| (|:| |num| #1=(|Vector| UP)) (|:| |den| UP)))
          (|numv| #1#) (|n| (|NonNegativeInteger|))
          (|res| (|Vector| (|Fraction| UP))) (|cden| (UP)) (|i| NIL)
          (#2=#:G139 NIL))
         (SEQ (LETT |c| (SPADCALL |p| (QREFELT % 12))) (LETT |numv| (QCAR |c|))
              (LETT |n| (QVSIZE |numv|))
              (LETT |res| (MAKEARR1 |n| (|spadConstant| % 14)))
              (LETT |cden| (QCDR |c|))
              (SEQ (LETT |i| 1) (LETT #2# |n|) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |res| |i|
                               (SPADCALL (SPADCALL |numv| |i| (QREFELT % 70))
                                         |cden| (QREFELT % 20))
                               (QREFELT % 71))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |INTALG2;algprimextint|
        ((|der| (|Mapping| UP UP))
         (|ext|
          (|Mapping|
           (|List|
            (|Record| (|:| |ratpart| (|Fraction| UP))
                      (|:| |coeffs| (|Vector| F))))
           (|List| (|Fraction| UP))))
         (|rde|
          (|Mapping|
           (|List|
            (|Record| (|:| |ratpart| (|Fraction| UP))
                      (|:| |coeffs| (|Vector| F))))
           (|Fraction| UP) (|List| (|Fraction| UP))))
         (|csolve| (|Mapping| (|List| (|Vector| F)) (|Matrix| F)))
         (|lg| (|List| R))
         (% (|List| (|Record| (|:| |ratpart| R) (|:| |coeffs| (|Vector| F))))))
        (SPROG
         ((|hermite1|
           (|Mapping|
            (|Record| (|:| |answer| R) (|:| |logpart| R) (|:| |polypart| R))
            R))
          (|lh|
           (|List|
            (|Record| (|:| |answer| R) (|:| |logpart| R) (|:| |polypart| R))))
          (#1=#:G160 NIL) (|lpv| (|List| (|Vector| (|Fraction| UP))))
          (|lgv| (|List| (|Vector| (|Fraction| UP)))) (|w| (|Vector| R))
          (|dm| (|Record| (|:| |num| (|Matrix| UP)) (|:| |den| UP)))
          (|dden| (UP)) (#2=#:G161 NIL) (|h| NIL) (#3=#:G162 NIL)
          (|ca0| (|List| R)))
         (SEQ
          (LETT |hermite1| (CONS #'|INTALG2;algprimextint!0| (VECTOR % |der|)))
          (LETT |lh| (|INTALG2;list_hermite| |lg| |hermite1| %))
          (LETT |lpv| NIL) (LETT |lgv| NIL)
          (SEQ (LETT |h| NIL) (LETT #1# |lh|) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |h| (CAR #1#)) NIL)) (GO G191)))
               (SEQ
                (LETT |lpv| (CONS (|INTALG2;R_to_VQF| (QVELT |h| 2) %) |lpv|))
                (EXIT
                 (LETT |lgv|
                       (CONS (|INTALG2;R_to_VQF| (QVELT |h| 1) %) |lgv|))))
               (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
          (LETT |lpv| (NREVERSE |lpv|)) (LETT |lgv| (NREVERSE |lgv|))
          (LETT |w| (SPADCALL (QREFELT % 26)))
          (LETT |dm| (SPADCALL |der| (QREFELT % 73))) (LETT |dden| (QCDR |dm|))
          (LETT |ca0|
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |h| NIL) (LETT #3# |lh|) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |h| (CAR #3#)) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS (QVELT |h| 0) #2#))))
                      (LETT #3# (CDR #3#)) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))
          (COND
           ((SPADCALL (SPADCALL |w| 1 (QREFELT % 58)) (|spadConstant| % 74)
                      (QREFELT % 75))
            (COND
             ((SPADCALL (QCAR |dm|) (QREFELT % 76))
              (EXIT
               (|INTALG2;diagextint| |dden| (QCAR |dm|) |w| |lpv| |lgv| |ca0|
                |ext| |rde| |csolve| %))))))
          (EXIT (|error| "algprimextint: non-root case unimplemented"))))) 

(SDEFUN |INTALG2;algprimextint!0| ((|g| NIL) ($$ NIL))
        (PROG (|der| %)
          (LETT |der| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|INTALG2;prim_hermite1| |g| |der| %))))) 

(SDEFUN |INTALG2;algexpextint|
        ((|der| (|Mapping| UP UP))
         (|ext|
          (|Mapping|
           (|List|
            (|Record| (|:| |ratpart| (|Fraction| UP))
                      (|:| |coeffs| (|Vector| F))))
           (|List| (|Fraction| UP))))
         (|rde|
          (|Mapping|
           (|List|
            (|Record| (|:| |ratpart| (|Fraction| UP))
                      (|:| |coeffs| (|Vector| F))))
           (|Fraction| UP) (|List| (|Fraction| UP))))
         (|csolve| (|Mapping| (|List| (|Vector| F)) (|Matrix| F)))
         (|lg| (|List| R))
         (% (|List| (|Record| (|:| |ratpart| R) (|:| |coeffs| (|Vector| F))))))
        (SPROG
         ((|hermite1|
           (|Mapping|
            (|Record| (|:| |answer| R) (|:| |logpart| R) (|:| |polypart| R))
            R))
          (|lh|
           (|List|
            (|Record| (|:| |answer| R) (|:| |logpart| R) (|:| |polypart| R))))
          (|w| (|Vector| R)) (#1=#:G182 NIL)
          (|lpv| (|List| (|Vector| (|Fraction| UP))))
          (|lgv| (|List| (|Vector| (|Fraction| UP))))
          (|dm| (|Record| (|:| |num| (|Matrix| UP)) (|:| |den| UP)))
          (|dden| (UP)) (#2=#:G183 NIL) (|h| NIL) (#3=#:G184 NIL)
          (|ca0| (|List| R)))
         (SEQ
          (LETT |hermite1| (CONS #'|INTALG2;algexpextint!0| (VECTOR % |der|)))
          (LETT |lh| (|INTALG2;list_hermite| |lg| |hermite1| %))
          (LETT |lpv| NIL) (LETT |lgv| NIL)
          (LETT |w| (SPADCALL (QREFELT % 26)))
          (SEQ (LETT |h| NIL) (LETT #1# |lh|) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |h| (CAR #1#)) NIL)) (GO G191)))
               (SEQ
                (LETT |lpv| (CONS (|INTALG2;R_to_VQF| (QVELT |h| 2) %) |lpv|))
                (EXIT
                 (LETT |lgv|
                       (CONS (|INTALG2;R_to_VQF| (QVELT |h| 1) %) |lgv|))))
               (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
          (LETT |lpv| (NREVERSE |lpv|)) (LETT |lgv| (NREVERSE |lgv|))
          (LETT |dm| (SPADCALL |der| (QREFELT % 73))) (LETT |dden| (QCDR |dm|))
          (LETT |ca0|
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |h| NIL) (LETT #3# |lh|) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |h| (CAR #3#)) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS (QVELT |h| 0) #2#))))
                      (LETT #3# (CDR #3#)) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))
          (COND
           ((SPADCALL (SPADCALL |w| 1 (QREFELT % 58)) (|spadConstant| % 74)
                      (QREFELT % 75))
            (COND
             ((SPADCALL (QCAR |dm|) (QREFELT % 76))
              (EXIT
               (|INTALG2;diagextint| |dden| (QCAR |dm|) |w| |lpv| |lgv| |ca0|
                |ext| |rde| |csolve| %))))))
          (EXIT (|error| "algexpextint: non-root case unimplemented"))))) 

(SDEFUN |INTALG2;algexpextint!0| ((|g| NIL) ($$ NIL))
        (PROG (|der| %)
          (LETT |der| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|INTALG2;exp_hermite1| |g| |der| %))))) 

(SDEFUN |INTALG2;algextint_base;MMLL;11|
        ((|der| (|Mapping| UP UP))
         (|csolve| (|Mapping| (|List| (|Vector| F)) (|Matrix| F)))
         (|lg| (|List| R))
         (% (|List| (|Record| (|:| |ratpart| R) (|:| |coeffs| (|Vector| F))))))
        (SPROG
         ((|hermite1|
           (|Mapping|
            (|Record| (|:| |answer| R) (|:| |logpart| R) (|:| |polypart| R))
            R))
          (|lh|
           (|List|
            (|Record| (|:| |answer| R) (|:| |logpart| R) (|:| |polypart| R))))
          (#1=#:G199 NIL) (#2=#:G200 NIL) (|lg1| (|List| R))
          (|rs1| (|Matrix| (|Fraction| UP))) (|res1| (|List| (|Vector| F)))
          (#3=#:G201 NIL) (|h| NIL) (#4=#:G202 NIL) (|ca0| (|List| R))
          (#5=#:G203 NIL) (|bv| NIL) (#6=#:G204 NIL))
         (SEQ
          (LETT |hermite1|
                (CONS #'|INTALG2;algextint_base;MMLL;11!0| (VECTOR % |der|)))
          (LETT |lh| (|INTALG2;list_hermite| |lg| |hermite1| %))
          (LETT |lg1|
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |h| NIL) (LETT #2# |lh|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |h| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS
                               (SPADCALL (QVELT |h| 1) (QVELT |h| 2)
                                         (QREFELT % 43))
                               #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#)))))
          (LETT |rs1|
                (SPADCALL (SPADCALL (LIST |lg1|) (QREFELT % 79))
                          (QREFELT % 82)))
          (LETT |res1| (SPADCALL |csolve| |rs1| (QREFELT % 83)))
          (LETT |ca0|
                (PROGN
                 (LETT #3# NIL)
                 (SEQ (LETT |h| NIL) (LETT #4# |lh|) G190
                      (COND
                       ((OR (ATOM #4#) (PROGN (LETT |h| (CAR #4#)) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #3# (CONS (QVELT |h| 0) #3#))))
                      (LETT #4# (CDR #4#)) (GO G190) G191
                      (EXIT (NREVERSE #3#)))))
          (EXIT
           (PROGN
            (LETT #5# NIL)
            (SEQ (LETT |bv| NIL) (LETT #6# |res1|) G190
                 (COND
                  ((OR (ATOM #6#) (PROGN (LETT |bv| (CAR #6#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #5#
                         (CONS
                          (CONS
                           (SPADCALL (|INTALG2;lin_comb2| |bv| |ca0| %)
                                     (QREFELT % 84))
                           |bv|)
                          #5#))))
                 (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT (NREVERSE #5#)))))))) 

(SDEFUN |INTALG2;algextint_base;MMLL;11!0| ((|g| NIL) ($$ NIL))
        (PROG (|der| %)
          (LETT |der| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|INTALG2;prim_hermite1| |g| |der| %))))) 

(SDEFUN |INTALG2;algextint;MMMMLL;12|
        ((|der| (|Mapping| UP UP))
         (|ext|
          (|Mapping|
           (|List|
            (|Record| (|:| |ratpart| (|Fraction| UP))
                      (|:| |coeffs| (|Vector| F))))
           (|List| (|Fraction| UP))))
         (|rde|
          (|Mapping|
           (|List|
            (|Record| (|:| |ratpart| (|Fraction| UP))
                      (|:| |coeffs| (|Vector| F))))
           (|Fraction| UP) (|List| (|Fraction| UP))))
         (|csolve| (|Mapping| (|List| (|Vector| F)) (|Matrix| F)))
         (|lg| (|List| R))
         (% (|List| (|Record| (|:| |ratpart| R) (|:| |coeffs| (|Vector| F))))))
        (SPROG
         ((|x| (UP)) (|x'| (UP)) (|xx| (|Union| UP "failed")) (#1=#:G233 NIL))
         (SEQ
          (LETT |x'|
                (SPADCALL
                 (LETT |x| (SPADCALL (|spadConstant| % 55) 1 (QREFELT % 90)))
                 |der|))
          (EXIT
           (COND
            ((ZEROP (SPADCALL |x'| (QREFELT % 91)))
             (|INTALG2;algprimextint| |der| |ext| |rde| |csolve| |lg| %))
            ('T
             (SEQ
              (EXIT
               (SEQ
                (SEQ (LETT |xx| (SPADCALL |x'| |x| (QREFELT % 48)))
                     (EXIT
                      (COND
                       ((QEQCAR |xx| 0)
                        (COND
                         ((QEQCAR (SPADCALL (QCDR |xx|) (QREFELT % 93)) 0)
                          (PROGN
                           (LETT #1#
                                 (|INTALG2;algexpextint| |der| |ext| |rde|
                                  |csolve| |lg| %))
                           (GO #2=#:G227))))))))
                (EXIT (|error| "algextint: unhandled case"))))
              #2# (EXIT #1#)))))))) 

(DECLAIM (NOTINLINE |AlgebraicIntegrate2;|)) 

(DEFUN |AlgebraicIntegrate2;| (|#1| |#2| |#3| |#4| |#5|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (DV$4 NIL) (DV$5 NIL) (|dv$| NIL) (% NIL)
    (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT DV$5 (|devaluate| |#5|))
    (LETT |dv$| (LIST '|AlgebraicIntegrate2| DV$1 DV$2 DV$3 DV$4 DV$5))
    (LETT % (GETREFV 98))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
    (|haddProp| |$ConstructorCache| '|AlgebraicIntegrate2|
                (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (QSETREFV % 10 |#5|)
    (SETF |pv$| (QREFELT % 3))
    %))) 

(DEFUN |AlgebraicIntegrate2| (&REST #1=#:G234)
  (SPROG NIL
         (PROG (#2=#:G235)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|AlgebraicIntegrate2|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |AlgebraicIntegrate2;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|AlgebraicIntegrate2|)))))))))) 

(MAKEPROP '|AlgebraicIntegrate2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|)
              (|Record| (|:| |num| 18) (|:| |den| 8))
              (0 . |integralCoordinates|) (|Fraction| 8) (5 . |0|) (9 . |0|)
              (13 . |0|) (|Integer|) (|Vector| 8) (17 . |minIndex|) (22 . /)
              (|Record| (|:| |polyPart| %) (|:| |fracPart| 13))
              (|LaurentPolynomial| 7 8) (28 . |separate|) (33 . |convert|)
              (|Vector| %) (38 . |integralBasis|) (|Vector| 13)
              (42 . |represents|)
              (|Record| (|:| |answer| 10) (|:| |logpart| 10)) (|Mapping| 8 8)
              (|AlgebraicHermiteIntegration| 7 8 9 10)
              (48 . |HermiteIntegrate|) (|Boolean|) (54 . |zero?|) (59 . |0|)
              (|Record| (|:| |quotient| %) (|:| |remainder| %)) (63 . |divide|)
              (69 . |coerce|) (|Vector| 7) (74 . |elt|) (80 . |coerce|)
              (85 . *) (91 . +) (97 . |denom|) (102 . |gcd|) (108 . |ground?|)
              (|Union| % '"failed") (113 . |exquo|) (119 . +) (125 . |numer|)
              (|Record| (|:| |coef1| %) (|:| |coef2| %)) (|Union| 51 '"failed")
              (130 . |extendedEuclidean|) (137 . |1|) (141 . |1|) (145 . |elt|)
              (|Vector| 10) (151 . |elt|) (|Matrix| 8) (157 . |elt|)
              (|List| 13) (|LinearCombinationUtilities| 7 8) (164 . |lin_comb|)
              (|List| 39) (|Mapping| 64 (|Matrix| 7))
              (|LiftLinearDependence| 7 7 8) (170 . |csolve_rf|)
              (176 . |lin_comb|) (182 . -) (188 . |elt|) (194 . |setelt!|)
              (|Record| (|:| |num| 59) (|:| |den| 8))
              (201 . |integralDerivationMatrix|) (206 . |1|) (210 . =)
              (216 . |diagonal?|) (|List| 87) (|Matrix| 10) (221 . |matrix|)
              (|Matrix| 13) (|Matrix| %) (226 . |reducedSystem|)
              (231 . |csolve_rmat|) (237 . -)
              (|Record| (|:| |ratpart| 10) (|:| |coeffs| 39)) (|List| 85)
              (|List| 10) |INTALG2;algextint_base;MMLL;11|
              (|NonNegativeInteger|) (242 . |monomial|) (248 . |degree|)
              (|Union| 7 '"failed") (253 . |retractIfCan|)
              (|Record| (|:| |ratpart| 13) (|:| |coeffs| 39))
              (|Mapping| (|List| 94) 61) (|Mapping| (|List| 94) 13 61)
              |INTALG2;algextint;MMMMLL;12|)
           '#(|algextint_base| 258 |algextint| 265) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|algextint|
                                 ((|List|
                                   (|Record| (|:| |ratpart| |#5|)
                                             (|:| |coeffs| (|Vector| |#2|))))
                                  (|Mapping| |#3| |#3|)
                                  (|Mapping|
                                   (|List|
                                    (|Record| (|:| |ratpart| (|Fraction| |#3|))
                                              (|:| |coeffs| (|Vector| |#2|))))
                                   (|List| (|Fraction| |#3|)))
                                  (|Mapping|
                                   (|List|
                                    (|Record| (|:| |ratpart| (|Fraction| |#3|))
                                              (|:| |coeffs| (|Vector| |#2|))))
                                   (|Fraction| |#3|)
                                   (|List| (|Fraction| |#3|)))
                                  (|Mapping| (|List| (|Vector| |#2|))
                                             (|Matrix| |#2|))
                                  (|List| |#5|)))
                                T)
                              '((|algextint_base|
                                 ((|List|
                                   (|Record| (|:| |ratpart| |#5|)
                                             (|:| |coeffs| (|Vector| |#2|))))
                                  (|Mapping| |#3| |#3|)
                                  (|Mapping| (|List| (|Vector| |#2|))
                                             (|Matrix| |#2|))
                                  (|List| |#5|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 97
                                            '(1 10 11 0 12 0 13 0 14 0 6 0 15 0
                                              7 0 16 1 18 17 0 19 2 13 0 8 8 20
                                              1 22 21 13 23 1 22 13 0 24 0 10
                                              25 26 2 10 0 27 25 28 2 31 29 10
                                              30 32 1 10 33 0 34 0 10 0 35 2 8
                                              36 0 0 37 1 13 0 8 38 2 39 7 0 17
                                              40 1 8 0 7 41 2 10 0 13 0 42 2 10
                                              0 0 0 43 1 13 8 0 44 2 8 0 0 0 45
                                              1 8 33 0 46 2 8 47 0 0 48 2 13 0
                                              0 0 49 1 13 8 0 50 3 8 52 0 0 0
                                              53 0 6 0 54 0 7 0 55 2 27 13 0 17
                                              56 2 57 10 0 17 58 3 59 8 0 17 17
                                              60 2 62 13 39 61 63 2 66 64 65 61
                                              67 2 62 39 39 64 68 2 10 0 0 0 69
                                              2 18 8 0 17 70 3 27 13 0 17 13 71
                                              1 10 72 30 73 0 10 0 74 2 10 33 0
                                              0 75 1 59 33 0 76 1 78 0 77 79 1
                                              10 80 81 82 2 66 64 65 80 83 1 10
                                              0 0 84 2 8 0 7 89 90 1 8 89 0 91
                                              1 8 92 0 93 3 0 86 30 65 87 88 5
                                              0 86 30 95 96 65 87 97)))))
           '|lookupComplete|)) 
