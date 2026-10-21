
(SDEFUN |INTPAR1;monologextint;LMMR;1|
        ((|lup| (|List| UP))
         (|csolve|
          (|Mapping| (|List| (|Vector| (|Fraction| (|Integer|))))
                     (|Matrix| F)))
         (|rec1|
          (|Mapping|
           #1=(|Record| (|:| |logands| #2=(|List| F))
                        (|:| |basis|
                             #3=(|List| (|Vector| (|Fraction| (|Integer|))))))
           (|List| F)))
         (%
          (|Record| (|:| |logands| (|List| (|Fraction| UP)))
                    (|:| |basis|
                         (|List| (|Vector| (|Fraction| (|Integer|))))))))
        (SPROG
         ((|n0| (|NonNegativeInteger|)) (#4=#:G38 NIL) (#5=#:G39 NIL)
          (|lc0| (|List| F)) (#6=#:G40 NIL) (|c0| NIL) (#7=#:G42 NIL) (|p| NIL)
          (#8=#:G41 NIL) (|lup2| (|List| UP))
          (|cb| (|List| (|Vector| (|Fraction| (|Integer|))))) (#9=#:G43 NIL)
          (#10=#:G44 NIL) (|nlc0| (|List| F)) (|#G11| #1#) (|ll| #2#)
          (|bl| #3#) (|n1| (|NonNegativeInteger|))
          (|n2| (|NonNegativeInteger|)) (|n3| (|NonNegativeInteger|))
          (#11=#:G45 NIL) (#12=#:G46 NIL)
          (|rbl| (|List| (|Vector| (|Fraction| (|Integer|))))) (#13=#:G47 NIL)
          (|le| NIL) (#14=#:G48 NIL) (|nl| (|List| (|Fraction| UP))) (|bv| NIL)
          (#15=#:G50 NIL) (|rbv| NIL) (#16=#:G49 NIL)
          (|pv| (|Vector| (|Fraction| (|Integer|)))) (#17=#:G51 NIL) (|j| NIL)
          (|i| NIL) (#18=#:G52 NIL))
         (SEQ (LETT |n0| (LENGTH |lup|))
              (LETT |lc0|
                    (PROGN
                     (LETT #4# NIL)
                     (SEQ (LETT |p| NIL) (LETT #5# |lup|) G190
                          (COND
                           ((OR (ATOM #5#) (PROGN (LETT |p| (CAR #5#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #4#
                                  (CONS (SPADCALL |p| 0 (QREFELT % 11)) #4#))))
                          (LETT #5# (CDR #5#)) (GO G190) G191
                          (EXIT (NREVERSE #4#)))))
              (LETT |lup2|
                    (PROGN
                     (LETT #6# NIL)
                     (SEQ (LETT |c0| NIL) (LETT #7# |lc0|) (LETT |p| NIL)
                          (LETT #8# |lup|) G190
                          (COND
                           ((OR (ATOM #8#) (PROGN (LETT |p| (CAR #8#)) NIL)
                                (ATOM #7#) (PROGN (LETT |c0| (CAR #7#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #6#
                                  (CONS
                                   (SPADCALL |p| (SPADCALL |c0| (QREFELT % 12))
                                             (QREFELT % 13))
                                   #6#))))
                          (LETT #8# (PROG1 (CDR #8#) (LETT #7# (CDR #7#))))
                          (GO G190) G191 (EXIT (NREVERSE #6#)))))
              (LETT |cb| (SPADCALL |csolve| |lup2| (QREFELT % 18)))
              (LETT |nlc0|
                    (PROGN
                     (LETT #9# NIL)
                     (SEQ (LETT |bv| NIL) (LETT #10# |cb|) G190
                          (COND
                           ((OR (ATOM #10#) (PROGN (LETT |bv| (CAR #10#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #9#
                                  (CONS (SPADCALL |bv| |lc0| (QREFELT % 22))
                                        #9#))))
                          (LETT #10# (CDR #10#)) (GO G190) G191
                          (EXIT (NREVERSE #9#)))))
              (PROGN
               (LETT |#G11| (SPADCALL |nlc0| |rec1|))
               (LETT |ll| (QCAR |#G11|))
               (LETT |bl| (QCDR |#G11|))
               |#G11|)
              (EXIT
               (COND ((NULL |bl|) (CONS NIL NIL))
                     ('T
                      (SEQ (LETT |n1| (LENGTH |cb|)) (LETT |n2| (LENGTH |ll|))
                           (LETT |n3| (+ |n0| |n2|))
                           (LETT |rbl|
                                 (PROGN
                                  (LETT #11# NIL)
                                  (SEQ (LETT |bv| NIL) (LETT #12# |bl|) G190
                                       (COND
                                        ((OR (ATOM #12#)
                                             (PROGN
                                              (LETT |bv| (CAR #12#))
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #11#
                                               (CONS
                                                (MAKEARR1 |n3|
                                                          (|spadConstant| %
                                                                          24))
                                                #11#))))
                                       (LETT #12# (CDR #12#)) (GO G190) G191
                                       (EXIT (NREVERSE #11#)))))
                           (LETT |nl|
                                 (PROGN
                                  (LETT #13# NIL)
                                  (SEQ (LETT |le| NIL) (LETT #14# |ll|) G190
                                       (COND
                                        ((OR (ATOM #14#)
                                             (PROGN
                                              (LETT |le| (CAR #14#))
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #13#
                                               (CONS
                                                (SPADCALL
                                                 (SPADCALL |le| (QREFELT % 12))
                                                 (QREFELT % 26))
                                                #13#))))
                                       (LETT #14# (CDR #14#)) (GO G190) G191
                                       (EXIT (NREVERSE #13#)))))
                           (SEQ (LETT |bv| NIL) (LETT #15# |bl|)
                                (LETT |rbv| NIL) (LETT #16# |rbl|) G190
                                (COND
                                 ((OR (ATOM #16#)
                                      (PROGN (LETT |rbv| (CAR #16#)) NIL)
                                      (ATOM #15#)
                                      (PROGN (LETT |bv| (CAR #15#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (LETT |pv|
                                       (SPADCALL
                                        (SPADCALL |bv|
                                                  (SPADCALL 1 |n1|
                                                            (QREFELT % 31))
                                                  (QREFELT % 32))
                                        |cb| (QREFELT % 34)))
                                 (SEQ (LETT |i| 1) (LETT #17# |n0|) G190
                                      (COND
                                       ((|greater_SI| |i| #17#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SPADCALL |rbv| |i|
                                                  (SPADCALL |pv| |i|
                                                            (QREFELT % 35))
                                                  (QREFELT % 36))))
                                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                      (EXIT NIL))
                                 (EXIT
                                  (SEQ (LETT |j| (+ |n1| 1))
                                       (LETT |i| (+ |n0| 1)) (LETT #18# |n3|)
                                       G190 (COND ((> |i| #18#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (SPADCALL |rbv| |i|
                                                   (SPADCALL |bv| |j|
                                                             (QREFELT % 35))
                                                   (QREFELT % 36))))
                                       (LETT |i|
                                             (PROG1 (+ |i| 1)
                                               (LETT |j| (+ |j| 1))))
                                       (GO G190) G191 (EXIT NIL))))
                                (LETT #16#
                                      (PROG1 (CDR #16#)
                                        (LETT #15# (CDR #15#))))
                                (GO G190) G191 (EXIT NIL))
                           (EXIT (CONS |nl| |rbl|))))))))) 

(SDEFUN |INTPAR1;logextint;MMMMLR;2|
        ((|der| (|Mapping| UP UP)) (|ufactor| (|Mapping| (|Factored| UP) UP))
         (|csolve|
          (|Mapping| #1=(|List| (|Vector| (|Fraction| (|Integer|))))
                     (|Matrix| F)))
         (|rec|
          (|Mapping|
           #2=(|Record| (|:| |logands| (|List| (|Fraction| UP)))
                        (|:| |basis|
                             (|List| (|Vector| (|Fraction| (|Integer|))))))
           (|List| UP)))
         (|lg| (|List| (|Fraction| UP)))
         (%
          (|Record| (|:| |logands| #3=(|List| (|Fraction| UP)))
                    (|:| |basis|
                         #4=(|List| (|Vector| (|Fraction| (|Integer|))))))))
        (SPROG
         ((|n0| #5=(|NonNegativeInteger|)) (#6=#:G180 NIL) (#7=#:G181 NIL)
          (|lghr|
           (|List|
            (|Record| (|:| |answer| #8=(|Fraction| UP))
                      (|:| |logpart| #9=(|Fraction| UP))
                      (|:| |specpart| (|Fraction| UP)) (|:| |polypart| UP))))
          (#10=#:G182 NIL) (#11=#:G183 NIL) (|lg1| (|List| #8#))
          (|cb| #12=(|List| (|Vector| (|Fraction| (|Integer|)))))
          (#13=#:G184 NIL) (#14=#:G185 NIL) (|lg2| (|List| #9#))
          (#15=#:G186 NIL) (#16=#:G187 NIL)
          (|lg3| (|List| #17=(|Fraction| UP))) (#18=#:G188 NIL)
          (#19=#:G189 NIL) (|lden1| (|List| UP))
          (|#G29|
           (|Record| (|:| |basis| #20=(|Vector| UP))
                     (|:| |transform| #21=(|Matrix| (|Integer|)))))
          (|mbas| #20#) (|m2| #21#) (|n1| #5#) (|mbasl| (|List| UP))
          (#22=#:G190 NIL) (|mbasp| NIL) (#23=#:G191 NIL) (#24=#:G192 NIL)
          (|frr| NIL) (#25=#:G193 NIL) (|mbasfl| (|List| (|List| UP)))
          (|basl1| (|List| UP)) (#26=#:G194 NIL) (#27=#:G195 NIL)
          (|sl| #28=(|List| (|NonNegativeInteger|)))
          (|n3| (|NonNegativeInteger|)) (|m3| (|Matrix| UP)) (#29=#:G197 NIL)
          (#30=#:G196 NIL) (|fl1| (|List| UP)) (|fj| NIL) (#31=#:G199 NIL)
          (#32=#:G198 NIL) (|sl1| #28#) (|j1| (|Integer|)) (|j0| (|Integer|))
          (|fl| (|List| UP)) (|jl| (|List| (|Integer|))) (|nl| (|List| UP))
          (#33=#:G201 NIL) (|num| NIL) (#34=#:G200 NIL) (|bj| NIL)
          (#35=#:G203 NIL) (#36=#:G202 NIL) (|dbj| (UP))
          (|#G41| #37=(|Record| (|:| |quotient| UP) (|:| |remainder| UP)))
          (|lpc| (|List| (|Fraction| UP))) (|rs3| (|Matrix| F)) (|cb2| #1#)
          (#38=#:G204 NIL) (#39=#:G205 NIL)
          (|cb3| (|List| #40=(|Vector| (|Fraction| (|Integer|)))))
          (#41=#:G206 NIL) (#42=#:G207 NIL) (|cb3e| (|List| #40#))
          (#43=#:G208 NIL) (#44=#:G209 NIL)
          (|ncb| (|List| #45=(|Vector| (|Fraction| (|Integer|)))))
          (#46=#:G210 NIL) (#47=#:G211 NIL) (|nlpc| (|List| #17#))
          (#48=#:G212 NIL) (|ghr| NIL) (#49=#:G213 NIL)
          (|lg4| (|List| #50=(|Fraction| UP))) (#51=#:G214 NIL) (|pc| NIL)
          (#52=#:G216 NIL) (#53=#:G215 NIL) (|lg5| (|List| #50#))
          (#54=#:G217 NIL) (|den| (UP)) (|#G50| #37#) (|q| (UP)) (|r| (UP))
          (|lrf| (|List| (|Fraction| UP))) (|lg6| (|List| (|Fraction| UP)))
          (|cb4| #12#) (#55=#:G218 NIL) (#56=#:G219 NIL) (|ncb2| (|List| #45#))
          (#57=#:G220 NIL) (#58=#:G221 NIL) (|cb4e| (|List| #45#))
          (#59=#:G222 NIL) (#60=#:G223 NIL) (|lg7| (|List| #17#)) (|n4| #5#)
          (#61=#:G224 NIL) (|g| NIL) (#62=#:G225 NIL) (|#G54| #2#) (|flog| #3#)
          (|fbas| #4#) (#63=#:G226 NIL) (|up| NIL) (#64=#:G227 NIL)
          (|rbasl1| (|List| (|Fraction| UP))) (|nlog| (|List| (|Fraction| UP)))
          (|n5| #5#) (|n6| (|NonNegativeInteger|)) (#65=#:G228 NIL)
          (#66=#:G229 NIL)
          (|rbas| (|List| (|Vector| (|Fraction| (|Integer|))))) (|bv| NIL)
          (#67=#:G231 NIL) (|rbv| NIL) (#68=#:G230 NIL) (|bv1| #40#)
          (#69=#:G232 NIL) (|pv| #45#) (#70=#:G234 NIL) (#71=#:G233 NIL)
          (|j| NIL) (#72=#:G236 NIL) (|i| NIL) (#73=#:G235 NIL))
         (SEQ
          (COND ((NULL |lg|) (CONS NIL NIL))
                (#74='T
                 (SEQ (LETT |n0| (LENGTH |lg|))
                      (LETT |lghr|
                            (PROGN
                             (LETT #6# NIL)
                             (SEQ (LETT |g| NIL) (LETT #7# |lg|) G190
                                  (COND
                                   ((OR (ATOM #7#)
                                        (PROGN (LETT |g| (CAR #7#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #6#
                                          (CONS
                                           (SPADCALL |g| |der| (QREFELT % 44))
                                           #6#))))
                                  (LETT #7# (CDR #7#)) (GO G190) G191
                                  (EXIT (NREVERSE #6#)))))
                      (LETT |lg1|
                            (PROGN
                             (LETT #10# NIL)
                             (SEQ (LETT |ghr| NIL) (LETT #11# |lghr|) G190
                                  (COND
                                   ((OR (ATOM #11#)
                                        (PROGN (LETT |ghr| (CAR #11#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #10# (CONS (QVELT |ghr| 0) #10#))))
                                  (LETT #11# (CDR #11#)) (GO G190) G191
                                  (EXIT (NREVERSE #10#)))))
                      (LETT |cb| (SPADCALL |csolve| |lg1| (QREFELT % 46)))
                      (LETT |lg2|
                            (PROGN
                             (LETT #13# NIL)
                             (SEQ (LETT |ghr| NIL) (LETT #14# |lghr|) G190
                                  (COND
                                   ((OR (ATOM #14#)
                                        (PROGN (LETT |ghr| (CAR #14#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #13# (CONS (QVELT |ghr| 1) #13#))))
                                  (LETT #14# (CDR #14#)) (GO G190) G191
                                  (EXIT (NREVERSE #13#)))))
                      (LETT |lg3|
                            (PROGN
                             (LETT #15# NIL)
                             (SEQ (LETT |bv| NIL) (LETT #16# |cb|) G190
                                  (COND
                                   ((OR (ATOM #16#)
                                        (PROGN (LETT |bv| (CAR #16#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #15#
                                          (CONS
                                           (SPADCALL |bv| |lg2| (QREFELT % 47))
                                           #15#))))
                                  (LETT #16# (CDR #16#)) (GO G190) G191
                                  (EXIT (NREVERSE #15#)))))
                      (LETT |lden1|
                            (PROGN
                             (LETT #18# NIL)
                             (SEQ (LETT |g| NIL) (LETT #19# |lg3|) G190
                                  (COND
                                   ((OR (ATOM #19#)
                                        (PROGN (LETT |g| (CAR #19#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #18#
                                          (CONS (SPADCALL |g| (QREFELT % 48))
                                                #18#))))
                                  (LETT #19# (CDR #19#)) (GO G190) G191
                                  (EXIT (NREVERSE #18#)))))
                      (PROGN
                       (LETT |#G29|
                             (SPADCALL (SPADCALL |lden1| (QREFELT % 50))
                                       (QREFELT % 53)))
                       (LETT |mbas| (QCAR |#G29|))
                       (LETT |m2| (QCDR |#G29|))
                       |#G29|)
                      (LETT |n1| (LENGTH |lg3|))
                      (LETT |mbasl| (SPADCALL |mbas| (QREFELT % 54)))
                      (LETT |mbasfl|
                            (PROGN
                             (LETT #22# NIL)
                             (SEQ (LETT |mbasp| NIL) (LETT #23# |mbasl|) G190
                                  (COND
                                   ((OR (ATOM #23#)
                                        (PROGN (LETT |mbasp| (CAR #23#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #22#
                                          (CONS
                                           (PROGN
                                            (LETT #24# NIL)
                                            (SEQ (LETT |frr| NIL)
                                                 (LETT #25#
                                                       (SPADCALL
                                                        (SPADCALL |mbasp|
                                                                  |ufactor|)
                                                        (QREFELT % 59)))
                                                 G190
                                                 (COND
                                                  ((OR (ATOM #25#)
                                                       (PROGN
                                                        (LETT |frr| (CAR #25#))
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT #24#
                                                         (CONS (QVELT |frr| 1)
                                                               #24#))))
                                                 (LETT #25# (CDR #25#))
                                                 (GO G190) G191
                                                 (EXIT (NREVERSE #24#))))
                                           #22#))))
                                  (LETT #23# (CDR #23#)) (GO G190) G191
                                  (EXIT (NREVERSE #22#)))))
                      (LETT |basl1|
                            (SPADCALL (ELT % 61) |mbasfl| NIL (QREFELT % 64)))
                      (LETT |sl|
                            (PROGN
                             (LETT #26# NIL)
                             (SEQ (LETT #27# |mbasfl|) G190
                                  (COND
                                   ((OR (ATOM #27#)
                                        (PROGN (LETT |fl1| (CAR #27#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #26# (CONS (LENGTH |fl1|) #26#))))
                                  (LETT #27# (CDR #27#)) (GO G190) G191
                                  (EXIT (NREVERSE #26#)))))
                      (LETT |n3| (SPADCALL (ELT % 69) |sl| 0 (QREFELT % 72)))
                      (LETT |m3|
                            (MAKE_MATRIX1 |n3| (+ |n1| |n3|)
                                          (|spadConstant| % 9)))
                      (SEQ (LETT |g| NIL) (LETT #29# |lg3|) (LETT |i| 1)
                           (LETT #30# |n1|) G190
                           (COND
                            ((OR (|greater_SI| |i| #30#) (ATOM #29#)
                                 (PROGN (LETT |g| (CAR #29#)) NIL))
                             (GO G191)))
                           (SEQ (LETT |fl| NIL) (LETT |jl| NIL)
                                (LETT |sl1| |sl|) (LETT |fl1| NIL)
                                (LETT |j0| 1) (LETT |j1| 0)
                                (SEQ (LETT |fj| NIL) (LETT #31# |basl1|)
                                     (LETT |j| 1) (LETT #32# |n3|) G190
                                     (COND
                                      ((OR (|greater_SI| |j| #32#) (ATOM #31#)
                                           (PROGN (LETT |fj| (CAR #31#)) NIL))
                                       (GO G191)))
                                     (SEQ (LETT |j1| (+ |j1| 1))
                                          (COND
                                           ((> |j1| (|SPADfirst| |sl1|))
                                            (SEQ (LETT |sl1| (CDR |sl1|))
                                                 (LETT |j1| 0)
                                                 (EXIT
                                                  (LETT |j0| (+ |j0| 1))))))
                                          (EXIT
                                           (COND
                                            ((EQL
                                              (SPADCALL |m2| |j0| |i|
                                                        (QREFELT % 74))
                                              1)
                                             (SEQ (LETT |fl| (CONS |fj| |fl|))
                                                  (EXIT
                                                   (LETT |jl|
                                                         (CONS |j| |jl|))))))))
                                     (LETT |j|
                                           (PROG1 (|inc_SI| |j|)
                                             (LETT #31# (CDR #31#))))
                                     (GO G190) G191 (EXIT NIL))
                                (LETT |nl|
                                      (SPADCALL (SPADCALL |g| (QREFELT % 75))
                                                |fl| (QREFELT % 77)))
                                (EXIT
                                 (SEQ (LETT |j| NIL) (LETT #33# |jl|)
                                      (LETT |num| NIL) (LETT #34# |nl|) G190
                                      (COND
                                       ((OR (ATOM #34#)
                                            (PROGN (LETT |num| (CAR #34#)) NIL)
                                            (ATOM #33#)
                                            (PROGN (LETT |j| (CAR #33#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SPADCALL |m3| |j| |i| |num|
                                                  (QREFELT % 79))))
                                      (LETT #34#
                                            (PROG1 (CDR #34#)
                                              (LETT #33# (CDR #33#))))
                                      (GO G190) G191 (EXIT NIL))))
                           (LETT |i|
                                 (PROG1 (|inc_SI| |i|) (LETT #29# (CDR #29#))))
                           (GO G190) G191 (EXIT NIL))
                      (LETT |lpc| NIL)
                      (SEQ (LETT |bj| NIL) (LETT #35# |basl1|) (LETT |j| 1)
                           (LETT #36# |n3|) G190
                           (COND
                            ((OR (|greater_SI| |j| #36#) (ATOM #35#)
                                 (PROGN (LETT |bj| (CAR #35#)) NIL))
                             (GO G191)))
                           (SEQ (LETT |dbj| (SPADCALL |bj| |der|))
                                (PROGN
                                 (LETT |#G41|
                                       (SPADCALL |dbj| |bj| (QREFELT % 81)))
                                 (LETT |q| (QCAR |#G41|))
                                 (LETT |r| (QCDR |#G41|))
                                 |#G41|)
                                (SPADCALL |m3| |j| (+ |n1| |j|) |r|
                                          (QREFELT % 79))
                                (EXIT
                                 (LETT |lpc|
                                       (CONS (SPADCALL |q| (QREFELT % 26))
                                             |lpc|))))
                           (LETT |j|
                                 (PROG1 (|inc_SI| |j|) (LETT #35# (CDR #35#))))
                           (GO G190) G191 (EXIT NIL))
                      (LETT |lpc| (NREVERSE |lpc|))
                      (LETT |rs3| (SPADCALL |m3| (QREFELT % 84)))
                      (LETT |cb2| (SPADCALL |rs3| |csolve|))
                      (LETT |cb3|
                            (PROGN
                             (LETT #38# NIL)
                             (SEQ (LETT |bv| NIL) (LETT #39# |cb2|) G190
                                  (COND
                                   ((OR (ATOM #39#)
                                        (PROGN (LETT |bv| (CAR #39#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #38#
                                          (CONS
                                           (SPADCALL |bv|
                                                     (SPADCALL 1 |n1|
                                                               (QREFELT % 31))
                                                     (QREFELT % 32))
                                           #38#))))
                                  (LETT #39# (CDR #39#)) (GO G190) G191
                                  (EXIT (NREVERSE #38#)))))
                      (LETT |cb3e|
                            (PROGN
                             (LETT #41# NIL)
                             (SEQ (LETT |bv| NIL) (LETT #42# |cb2|) G190
                                  (COND
                                   ((OR (ATOM #42#)
                                        (PROGN (LETT |bv| (CAR #42#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #41#
                                          (CONS
                                           (SPADCALL |bv|
                                                     (SPADCALL (+ |n1| 1)
                                                               (+ |n1| |n3|)
                                                               (QREFELT % 31))
                                                     (QREFELT % 32))
                                           #41#))))
                                  (LETT #42# (CDR #42#)) (GO G190) G191
                                  (EXIT (NREVERSE #41#)))))
                      (LETT |ncb|
                            (PROGN
                             (LETT #43# NIL)
                             (SEQ (LETT |bv| NIL) (LETT #44# |cb3|) G190
                                  (COND
                                   ((OR (ATOM #44#)
                                        (PROGN (LETT |bv| (CAR #44#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #43#
                                          (CONS
                                           (SPADCALL |bv| |cb| (QREFELT % 34))
                                           #43#))))
                                  (LETT #44# (CDR #44#)) (GO G190) G191
                                  (EXIT (NREVERSE #43#)))))
                      (LETT |nlpc|
                            (PROGN
                             (LETT #46# NIL)
                             (SEQ (LETT |bv| NIL) (LETT #47# |cb3e|) G190
                                  (COND
                                   ((OR (ATOM #47#)
                                        (PROGN (LETT |bv| (CAR #47#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #46#
                                          (CONS
                                           (SPADCALL |bv| |lpc| (QREFELT % 47))
                                           #46#))))
                                  (LETT #47# (CDR #47#)) (GO G190) G191
                                  (EXIT (NREVERSE #46#)))))
                      (LETT |lg4|
                            (PROGN
                             (LETT #48# NIL)
                             (SEQ (LETT |ghr| NIL) (LETT #49# |lghr|) G190
                                  (COND
                                   ((OR (ATOM #49#)
                                        (PROGN (LETT |ghr| (CAR #49#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #48#
                                          (CONS
                                           (SPADCALL
                                            (SPADCALL (QVELT |ghr| 3)
                                                      (QREFELT % 26))
                                            (QVELT |ghr| 2) (QREFELT % 65))
                                           #48#))))
                                  (LETT #49# (CDR #49#)) (GO G190) G191
                                  (EXIT (NREVERSE #48#)))))
                      (LETT |lg5|
                            (PROGN
                             (LETT #51# NIL)
                             (SEQ (LETT |pc| NIL) (LETT #52# |nlpc|)
                                  (LETT |bv| NIL) (LETT #53# |ncb|) G190
                                  (COND
                                   ((OR (ATOM #53#)
                                        (PROGN (LETT |bv| (CAR #53#)) NIL)
                                        (ATOM #52#)
                                        (PROGN (LETT |pc| (CAR #52#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #51#
                                          (CONS
                                           (SPADCALL
                                            (SPADCALL |bv| |lg4|
                                                      (QREFELT % 47))
                                            |pc| (QREFELT % 65))
                                           #51#))))
                                  (LETT #53#
                                        (PROG1 (CDR #53#)
                                          (LETT #52# (CDR #52#))))
                                  (GO G190) G191 (EXIT (NREVERSE #51#)))))
                      (LETT |lrf| NIL) (LETT |lg6| NIL)
                      (SEQ (LETT |g| NIL) (LETT #54# |lg5|) G190
                           (COND
                            ((OR (ATOM #54#) (PROGN (LETT |g| (CAR #54#)) NIL))
                             (GO G191)))
                           (SEQ (LETT |den| (SPADCALL |g| (QREFELT % 48)))
                                (PROGN
                                 (LETT |#G50|
                                       (SPADCALL (SPADCALL |g| (QREFELT % 75))
                                                 |den| (QREFELT % 81)))
                                 (LETT |q| (QCAR |#G50|))
                                 (LETT |r| (QCDR |#G50|))
                                 |#G50|)
                                (LETT |lrf|
                                      (CONS (SPADCALL |r| |den| (QREFELT % 85))
                                            |lrf|))
                                (EXIT
                                 (LETT |lg6|
                                       (CONS (SPADCALL |q| (QREFELT % 26))
                                             |lg6|))))
                           (LETT #54# (CDR #54#)) (GO G190) G191 (EXIT NIL))
                      (LETT |lrf| (NREVERSE |lrf|))
                      (LETT |lg6| (NREVERSE |lg6|))
                      (LETT |cb4| (SPADCALL |csolve| |lrf| (QREFELT % 46)))
                      (LETT |ncb2|
                            (PROGN
                             (LETT #55# NIL)
                             (SEQ (LETT |bv| NIL) (LETT #56# |cb4|) G190
                                  (COND
                                   ((OR (ATOM #56#)
                                        (PROGN (LETT |bv| (CAR #56#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #55#
                                          (CONS
                                           (SPADCALL |bv| |ncb| (QREFELT % 34))
                                           #55#))))
                                  (LETT #56# (CDR #56#)) (GO G190) G191
                                  (EXIT (NREVERSE #55#)))))
                      (LETT |cb4e|
                            (PROGN
                             (LETT #57# NIL)
                             (SEQ (LETT |bv| NIL) (LETT #58# |cb4|) G190
                                  (COND
                                   ((OR (ATOM #58#)
                                        (PROGN (LETT |bv| (CAR #58#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #57#
                                          (CONS
                                           (SPADCALL |bv| |cb3e|
                                                     (QREFELT % 34))
                                           #57#))))
                                  (LETT #58# (CDR #58#)) (GO G190) G191
                                  (EXIT (NREVERSE #57#)))))
                      (LETT |lg7|
                            (PROGN
                             (LETT #59# NIL)
                             (SEQ (LETT |bv| NIL) (LETT #60# |cb4|) G190
                                  (COND
                                   ((OR (ATOM #60#)
                                        (PROGN (LETT |bv| (CAR #60#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #59#
                                          (CONS
                                           (SPADCALL |bv| |lg6| (QREFELT % 47))
                                           #59#))))
                                  (LETT #60# (CDR #60#)) (GO G190) G191
                                  (EXIT (NREVERSE #59#)))))
                      (LETT |n4| (LENGTH |lg7|))
                      (PROGN
                       (LETT |#G54|
                             (SPADCALL
                              (PROGN
                               (LETT #61# NIL)
                               (SEQ (LETT |g| NIL) (LETT #62# |lg7|) G190
                                    (COND
                                     ((OR (ATOM #62#)
                                          (PROGN (LETT |g| (CAR #62#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #61#
                                            (CONS (SPADCALL |g| (QREFELT % 86))
                                                  #61#))))
                                    (LETT #62# (CDR #62#)) (GO G190) G191
                                    (EXIT (NREVERSE #61#))))
                              |rec|))
                       (LETT |flog| (QCAR |#G54|))
                       (LETT |fbas| (QCDR |#G54|))
                       |#G54|)
                      (EXIT
                       (COND ((NULL |fbas|) (CONS NIL NIL))
                             (#74#
                              (SEQ
                               (LETT |rbasl1|
                                     (PROGN
                                      (LETT #63# NIL)
                                      (SEQ (LETT |up| NIL) (LETT #64# |basl1|)
                                           G190
                                           (COND
                                            ((OR (ATOM #64#)
                                                 (PROGN
                                                  (LETT |up| (CAR #64#))
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (LETT #63#
                                                   (CONS
                                                    (SPADCALL |up|
                                                              (QREFELT % 26))
                                                    #63#))))
                                           (LETT #64# (CDR #64#)) (GO G190)
                                           G191 (EXIT (NREVERSE #63#)))))
                               (LETT |nlog|
                                     (SPADCALL |rbasl1| |flog| (QREFELT % 87)))
                               (LETT |n5| (LENGTH |flog|))
                               (LETT |n6| (+ (+ |n0| |n3|) |n5|))
                               (LETT |rbas|
                                     (PROGN
                                      (LETT #65# NIL)
                                      (SEQ (LETT |bv| NIL) (LETT #66# |fbas|)
                                           G190
                                           (COND
                                            ((OR (ATOM #66#)
                                                 (PROGN
                                                  (LETT |bv| (CAR #66#))
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (LETT #65#
                                                   (CONS
                                                    (MAKEARR1 |n6|
                                                              (|spadConstant| %
                                                                              24))
                                                    #65#))))
                                           (LETT #66# (CDR #66#)) (GO G190)
                                           G191 (EXIT (NREVERSE #65#)))))
                               (SEQ (LETT |bv| NIL) (LETT #67# |fbas|)
                                    (LETT |rbv| NIL) (LETT #68# |rbas|) G190
                                    (COND
                                     ((OR (ATOM #68#)
                                          (PROGN (LETT |rbv| (CAR #68#)) NIL)
                                          (ATOM #67#)
                                          (PROGN (LETT |bv| (CAR #67#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (LETT |bv1|
                                           (SPADCALL |bv|
                                                     (SPADCALL 1 |n4|
                                                               (QREFELT % 31))
                                                     (QREFELT % 32)))
                                     (LETT |pv|
                                           (SPADCALL |bv1| |ncb2|
                                                     (QREFELT % 34)))
                                     (SEQ (LETT |i| 1) (LETT #69# |n0|) G190
                                          (COND
                                           ((|greater_SI| |i| #69#) (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (SPADCALL |rbv| |i|
                                                      (SPADCALL |pv| |i|
                                                                (QREFELT % 35))
                                                      (QREFELT % 36))))
                                          (LETT |i| (|inc_SI| |i|)) (GO G190)
                                          G191 (EXIT NIL))
                                     (LETT |pv|
                                           (SPADCALL |bv1| |cb4e|
                                                     (QREFELT % 34)))
                                     (SEQ (LETT |j| 1) (LETT #70# |n3|)
                                          (LETT |i| (+ |n0| 1))
                                          (LETT #71# (+ |n0| |n3|)) G190
                                          (COND
                                           ((OR (> |i| #71#)
                                                (|greater_SI| |j| #70#))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (SPADCALL |rbv| |i|
                                                      (SPADCALL |pv| |j|
                                                                (QREFELT % 35))
                                                      (QREFELT % 36))))
                                          (LETT |i|
                                                (PROG1 (+ |i| 1)
                                                  (LETT |j| (|inc_SI| |j|))))
                                          (GO G190) G191 (EXIT NIL))
                                     (EXIT
                                      (SEQ (LETT |j| (+ |n4| 1))
                                           (LETT #72# (+ |n4| |n5|))
                                           (LETT |i| (+ (+ |n0| |n3|) 1))
                                           (LETT #73# |n6|) G190
                                           (COND
                                            ((OR (> |i| #73#) (> |j| #72#))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (SPADCALL |rbv| |i|
                                                       (SPADCALL |bv| |j|
                                                                 (QREFELT %
                                                                          35))
                                                       (QREFELT % 36))))
                                           (LETT |i|
                                                 (PROG1 (+ |i| 1)
                                                   (LETT |j| (+ |j| 1))))
                                           (GO G190) G191 (EXIT NIL))))
                                    (LETT #68#
                                          (PROG1 (CDR #68#)
                                            (LETT #67# (CDR #67#))))
                                    (GO G190) G191 (EXIT NIL))
                               (EXIT (CONS |nlog| |rbas|)))))))))))) 

(SDEFUN |INTPAR1;RF_to_GP|
        ((|f| (|Fraction| UP)) (% (|LaurentPolynomial| F UP)))
        (SPROG ((#1=#:G241 NIL))
               (PROG2
                   (LETT #1#
                         (SPADCALL
                          (SPADCALL (SPADCALL |f| (QREFELT % 75))
                                    (QREFELT % 92))
                          (SPADCALL (SPADCALL |f| (QREFELT % 48))
                                    (QREFELT % 92))
                          (QREFELT % 94)))
                   (QCDR #1#)
                 (|check_union2| (QEQCAR #1# 0)
                                 (|LaurentPolynomial| (QREFELT % 6)
                                                      (QREFELT % 7))
                                 (|Union|
                                  (|LaurentPolynomial| (QREFELT % 6)
                                                       (QREFELT % 7))
                                  "failed")
                                 #1#)))) 

(SDEFUN |INTPAR1;primextint;MMMLL;4|
        ((|der| (|Mapping| UP UP))
         (|ext|
          (|Mapping|
           (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
           (|List| F)))
         (|csolve| (|Mapping| (|List| (|Vector| F)) (|Matrix| F)))
         (|lg| (|List| (|Fraction| UP)))
         (%
          (|List|
           (|Record| (|:| |ratpart| (|Fraction| UP))
                     (|:| |coeffs| (|Vector| F))))))
        (SPROG
         ((|n| (|NonNegativeInteger|)) (#1=#:G376 NIL) (|g| NIL)
          (#2=#:G377 NIL)
          (|lghr|
           (|List|
            (|Record| (|:| |answer| #3=(|Fraction| UP))
                      (|:| |logpart| #4=(|Fraction| UP))
                      (|:| |specpart| (|Fraction| UP)) (|:| |polypart| UP))))
          (#5=#:G378 NIL) (#6=#:G379 NIL) (|lg1| (|List| #4#)) (#7=#:G380 NIL)
          (#8=#:G381 NIL) (|a1l| (|List| #3#)) (#9=#:G382 NIL) (#10=#:G383 NIL)
          (#11=#:G384 NIL) (|ghr| NIL) (#12=#:G385 NIL) (|lg2| (|List| UP))
          (|vg2| (|Vector| UP)) (#13=#:G386 NIL) (|g2| NIL) (#14=#:G387 NIL)
          (|ldg| (|List| (|NonNegativeInteger|))) (|d| (|NonNegativeInteger|))
          (|dk| (F)) (#15=#:G388 NIL) (#16=#:G389 NIL) (|j| NIL)
          (|n1| (|NonNegativeInteger|)) (#17=#:G375 NIL) (|i| NIL)
          (#18=#:G390 NIL) (|gi| (UP)) (|gij| (F)) (|lgj| (|List| F))
          (|aa| NIL) (#19=#:G392 NIL) (#20=#:G391 NIL) (|ff| (F))
          (|lgj1| (|List| F))
          (|b2|
           (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
          (|n1p| (|NonNegativeInteger|)) (#21=#:G393 NIL) (#22=#:G394 NIL)
          (|cb0| (|List| (|Vector| F))) (#23=#:G395 NIL) (#24=#:G396 NIL)
          (|ncb| (|List| (|Vector| F))) (#25=#:G397 NIL) (#26=#:G398 NIL)
          (|cba| (|List| F)) (#27=#:G399 NIL) (#28=#:G401 NIL) (|be| NIL)
          (#29=#:G400 NIL) (|cb| (|List| (|Vector| F)))
          (|lba| (|List| (|Fraction| UP))) (#30=#:G402 NIL) (#31=#:G404 NIL)
          (#32=#:G403 NIL) (|nlba| (|List| (|Fraction| UP))) (#33=#:G405 NIL)
          (|ba| NIL) (#34=#:G407 NIL) (|bv| NIL) (#35=#:G406 NIL))
         (SEQ
          (EXIT
           (COND ((NULL |lg|) NIL)
                 ('T
                  (SEQ (LETT |n| (LENGTH |lg|))
                       (LETT |lghr|
                             (PROGN
                              (LETT #1# NIL)
                              (SEQ (LETT |g| NIL) (LETT #2# |lg|) G190
                                   (COND
                                    ((OR (ATOM #2#)
                                         (PROGN (LETT |g| (CAR #2#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #1#
                                           (CONS
                                            (SPADCALL |g| |der| (QREFELT % 44))
                                            #1#))))
                                   (LETT #2# (CDR #2#)) (GO G190) G191
                                   (EXIT (NREVERSE #1#)))))
                       (LETT |lg1|
                             (PROGN
                              (LETT #5# NIL)
                              (SEQ (LETT |ghr| NIL) (LETT #6# |lghr|) G190
                                   (COND
                                    ((OR (ATOM #6#)
                                         (PROGN (LETT |ghr| (CAR #6#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #5# (CONS (QVELT |ghr| 1) #5#))))
                                   (LETT #6# (CDR #6#)) (GO G190) G191
                                   (EXIT (NREVERSE #5#)))))
                       (LETT |cb| (SPADCALL |csolve| |lg1| (QREFELT % 98)))
                       (LETT |a1l|
                             (PROGN
                              (LETT #7# NIL)
                              (SEQ (LETT |ghr| NIL) (LETT #8# |lghr|) G190
                                   (COND
                                    ((OR (ATOM #8#)
                                         (PROGN (LETT |ghr| (CAR #8#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #7# (CONS (QVELT |ghr| 0) #7#))))
                                   (LETT #8# (CDR #8#)) (GO G190) G191
                                   (EXIT (NREVERSE #7#)))))
                       (LETT |lba|
                             (PROGN
                              (LETT #9# NIL)
                              (SEQ (LETT |bv| NIL) (LETT #10# |cb|) G190
                                   (COND
                                    ((OR (ATOM #10#)
                                         (PROGN (LETT |bv| (CAR #10#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #9#
                                           (CONS (|spadConstant| % 99) #9#))))
                                   (LETT #10# (CDR #10#)) (GO G190) G191
                                   (EXIT (NREVERSE #9#)))))
                       (LETT |lg2|
                             (PROGN
                              (LETT #11# NIL)
                              (SEQ (LETT |ghr| NIL) (LETT #12# |lghr|) G190
                                   (COND
                                    ((OR (ATOM #12#)
                                         (PROGN (LETT |ghr| (CAR #12#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #11# (CONS (QVELT |ghr| 3) #11#))))
                                   (LETT #12# (CDR #12#)) (GO G190) G191
                                   (EXIT (NREVERSE #11#)))))
                       (LETT |vg2| (SPADCALL |lg2| (QREFELT % 50)))
                       (LETT |ldg|
                             (PROGN
                              (LETT #13# NIL)
                              (SEQ (LETT |g2| NIL) (LETT #14# |lg2|) G190
                                   (COND
                                    ((OR (ATOM #14#)
                                         (PROGN (LETT |g2| (CAR #14#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #13#
                                           (CONS
                                            (SPADCALL |g2| (QREFELT % 100))
                                            #13#))))
                                   (LETT #14# (CDR #14#)) (GO G190) G191
                                   (EXIT (NREVERSE #13#)))))
                       (LETT |d| (SPADCALL (ELT % 101) |ldg| (QREFELT % 102)))
                       (LETT |dk|
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL (|spadConstant| % 27) 1
                                         (QREFELT % 103))
                               |der|)
                              (QREFELT % 104)))
                       (LETT |cba|
                             (PROGN
                              (LETT #15# NIL)
                              (SEQ (LETT |bv| NIL) (LETT #16# |cb|) G190
                                   (COND
                                    ((OR (ATOM #16#)
                                         (PROGN (LETT |bv| (CAR #16#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #15#
                                           (CONS (|spadConstant| % 8) #15#))))
                                   (LETT #16# (CDR #16#)) (GO G190) G191
                                   (EXIT (NREVERSE #15#)))))
                       (SEQ (LETT |j| |d|) G190 (COND ((< |j| 0) (GO G191)))
                            (SEQ (LETT |n1| (LENGTH |cb|))
                                 (EXIT
                                  (COND
                                   ((EQL |n1| 0)
                                    (PROGN (LETT #17# NIL) (GO #36=#:G374)))
                                   ('T
                                    (SEQ (LETT |lgj| NIL)
                                         (SEQ (LETT |i| 1) (LETT #18# |n|) G190
                                              (COND
                                               ((|greater_SI| |i| #18#)
                                                (GO G191)))
                                              (SEQ
                                               (LETT |gi|
                                                     (SPADCALL |vg2| |i|
                                                               (QREFELT %
                                                                        105)))
                                               (LETT |gij|
                                                     (|spadConstant| % 8))
                                               (COND
                                                ((EQL
                                                  (SPADCALL |gi|
                                                            (QREFELT % 100))
                                                  |j|)
                                                 (SEQ
                                                  (LETT |gij|
                                                        (SPADCALL |gi|
                                                                  (QREFELT %
                                                                           106)))
                                                  (EXIT
                                                   (SPADCALL |vg2| |i|
                                                             (SPADCALL |gi|
                                                                       (QREFELT
                                                                        % 107))
                                                             (QREFELT %
                                                                      108))))))
                                               (EXIT
                                                (LETT |lgj|
                                                      (CONS |gij| |lgj|))))
                                              (LETT |i| (|inc_SI| |i|))
                                              (GO G190) G191 (EXIT NIL))
                                         (LETT |lgj| (NREVERSE |lgj|))
                                         (LETT |lgj1| NIL)
                                         (SEQ (LETT |aa| NIL) (LETT #19# |cba|)
                                              (LETT |bv| NIL) (LETT #20# |cb|)
                                              G190
                                              (COND
                                               ((OR (ATOM #20#)
                                                    (PROGN
                                                     (LETT |bv| (CAR #20#))
                                                     NIL)
                                                    (ATOM #19#)
                                                    (PROGN
                                                     (LETT |aa| (CAR #19#))
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (LETT |ff|
                                                     (SPADCALL
                                                      (SPADCALL |bv| |lgj|
                                                                (QREFELT %
                                                                         110))
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (SPADCALL (+ |j| 1)
                                                                  (QREFELT %
                                                                           111))
                                                        |dk| (QREFELT % 112))
                                                       |aa| (QREFELT % 112))
                                                      (QREFELT % 113)))
                                               (EXIT
                                                (LETT |lgj1|
                                                      (CONS |ff| |lgj1|))))
                                              (LETT #20#
                                                    (PROG1 (CDR #20#)
                                                      (LETT #19# (CDR #19#))))
                                              (GO G190) G191 (EXIT NIL))
                                         (LETT |lgj1| (NREVERSE |lgj1|))
                                         (LETT |b2|
                                               (SPADCALL (CONS |dk| |lgj1|)
                                                         |ext|))
                                         (LETT |n1p| (+ |n1| 1))
                                         (LETT |cb0|
                                               (PROGN
                                                (LETT #21# NIL)
                                                (SEQ (LETT |be| NIL)
                                                     (LETT #22# |b2|) G190
                                                     (COND
                                                      ((OR (ATOM #22#)
                                                           (PROGN
                                                            (LETT |be|
                                                                  (CAR #22#))
                                                            NIL))
                                                       (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (LETT #21#
                                                             (CONS
                                                              (SPADCALL
                                                               (QCDR |be|)
                                                               (SPADCALL 2
                                                                         |n1p|
                                                                         (QREFELT
                                                                          %
                                                                          31))
                                                               (QREFELT % 114))
                                                              #21#))))
                                                     (LETT #22# (CDR #22#))
                                                     (GO G190) G191
                                                     (EXIT (NREVERSE #21#)))))
                                         (LETT |ncb|
                                               (PROGN
                                                (LETT #23# NIL)
                                                (SEQ (LETT |bv| NIL)
                                                     (LETT #24# |cb0|) G190
                                                     (COND
                                                      ((OR (ATOM #24#)
                                                           (PROGN
                                                            (LETT |bv|
                                                                  (CAR #24#))
                                                            NIL))
                                                       (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (LETT #23#
                                                             (CONS
                                                              (SPADCALL |bv|
                                                                        |cb|
                                                                        (QREFELT
                                                                         %
                                                                         115))
                                                              #23#))))
                                                     (LETT #24# (CDR #24#))
                                                     (GO G190) G191
                                                     (EXIT (NREVERSE #23#)))))
                                         (LETT |cba|
                                               (PROGN
                                                (LETT #25# NIL)
                                                (SEQ (LETT |be| NIL)
                                                     (LETT #26# |b2|) G190
                                                     (COND
                                                      ((OR (ATOM #26#)
                                                           (PROGN
                                                            (LETT |be|
                                                                  (CAR #26#))
                                                            NIL))
                                                       (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (LETT #25#
                                                             (CONS (QCAR |be|)
                                                                   #25#))))
                                                     (LETT #26# (CDR #26#))
                                                     (GO G190) G191
                                                     (EXIT (NREVERSE #25#)))))
                                         (LETT |nlba|
                                               (PROGN
                                                (LETT #27# NIL)
                                                (SEQ (LETT |bv| NIL)
                                                     (LETT #28# |cb0|)
                                                     (LETT |be| NIL)
                                                     (LETT #29# |b2|) G190
                                                     (COND
                                                      ((OR (ATOM #29#)
                                                           (PROGN
                                                            (LETT |be|
                                                                  (CAR #29#))
                                                            NIL)
                                                           (ATOM #28#)
                                                           (PROGN
                                                            (LETT |bv|
                                                                  (CAR #28#))
                                                            NIL))
                                                       (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (LETT #27#
                                                             (CONS
                                                              (SPADCALL
                                                               (SPADCALL
                                                                (SPADCALL |bv|
                                                                          |lba|
                                                                          (QREFELT
                                                                           %
                                                                           116))
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  (QCAR |be|)
                                                                  |j|
                                                                  (QREFELT %
                                                                           103))
                                                                 (QREFELT %
                                                                          26))
                                                                (QREFELT % 65))
                                                               (SPADCALL
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   (QCDR |be|)
                                                                   1
                                                                   (QREFELT %
                                                                            117))
                                                                  (SPADCALL
                                                                   (+ |j| 1)
                                                                   (QREFELT %
                                                                            111))
                                                                  (QREFELT %
                                                                           118))
                                                                 (+ |j| 1)
                                                                 (QREFELT %
                                                                          103))
                                                                (QREFELT % 26))
                                                               (QREFELT % 65))
                                                              #27#))))
                                                     (LETT #29#
                                                           (PROG1 (CDR #29#)
                                                             (LETT #28#
                                                                   (CDR
                                                                    #28#))))
                                                     (GO G190) G191
                                                     (EXIT (NREVERSE #27#)))))
                                         (LETT |cb| |ncb|)
                                         (EXIT (LETT |lba| |nlba|)))))))
                            (LETT |j| (+ |j| -1)) (GO G190) G191 (EXIT NIL))
                       (LETT |nlba|
                             (PROGN
                              (LETT #30# NIL)
                              (SEQ (LETT |ba| NIL) (LETT #31# |lba|)
                                   (LETT |bv| NIL) (LETT #32# |cb|) G190
                                   (COND
                                    ((OR (ATOM #32#)
                                         (PROGN (LETT |bv| (CAR #32#)) NIL)
                                         (ATOM #31#)
                                         (PROGN (LETT |ba| (CAR #31#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #30#
                                           (CONS
                                            (SPADCALL |ba|
                                                      (SPADCALL |bv| |a1l|
                                                                (QREFELT %
                                                                         116))
                                                      (QREFELT % 119))
                                            #30#))))
                                   (LETT #32#
                                         (PROG1 (CDR #32#)
                                           (LETT #31# (CDR #31#))))
                                   (GO G190) G191 (EXIT (NREVERSE #30#)))))
                       (EXIT
                        (PROGN
                         (LETT #33# NIL)
                         (SEQ (LETT |ba| NIL) (LETT #34# |nlba|)
                              (LETT |bv| NIL) (LETT #35# |cb|) G190
                              (COND
                               ((OR (ATOM #35#)
                                    (PROGN (LETT |bv| (CAR #35#)) NIL)
                                    (ATOM #34#)
                                    (PROGN (LETT |ba| (CAR #34#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT (LETT #33# (CONS (CONS |ba| |bv|) #33#))))
                              (LETT #35#
                                    (PROG1 (CDR #35#) (LETT #34# (CDR #34#))))
                              (GO G190) G191 (EXIT (NREVERSE #33#)))))))))
          #36# (EXIT #17#)))) 

(SDEFUN |INTPAR1;expextint;MMMLL;5|
        ((|der| (|Mapping| UP UP))
         (|rde|
          (|Mapping|
           (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
           (|Integer|) (|List| F)))
         (|csolve| (|Mapping| (|List| (|Vector| F)) (|Matrix| F)))
         (|lg| (|List| (|Fraction| UP)))
         (%
          (|List|
           (|Record| (|:| |ratpart| (|Fraction| UP))
                     (|:| |coeffs| (|Vector| F))))))
        (SPROG
         ((#1=#:G518 NIL) (|g| NIL) (#2=#:G519 NIL)
          (|lghr|
           (|List|
            (|Record| (|:| |answer| #3=(|Fraction| UP))
                      (|:| |logpart| #4=(|Fraction| UP))
                      (|:| |specpart| (|Fraction| UP)) (|:| |polypart| UP))))
          (#5=#:G520 NIL) (#6=#:G521 NIL) (|lg1| (|List| #4#)) (#7=#:G522 NIL)
          (#8=#:G523 NIL) (|a1l| (|List| #3#)) (#9=#:G524 NIL) (#10=#:G525 NIL)
          (#11=#:G526 NIL) (|ghr| NIL) (#12=#:G527 NIL)
          (|lg2| (|List| #13=(|LaurentPolynomial| F UP)))
          (|vg2| (|Vector| (|LaurentPolynomial| F UP))) (#14=#:G528 NIL)
          (|g2| NIL) (#15=#:G529 NIL) (|ldg| (|List| (|Integer|)))
          (|d| #16=(|Integer|)) (|i| NIL) (#17=#:G530 NIL)
          (|gi| (|LaurentPolynomial| F UP)) (|last_iter| (|Boolean|))
          (|gij| (F)) (#18=#:G516 NIL) (|lgj| (|List| F)) (#19=#:G531 NIL)
          (|ff| (F)) (|lgj1| (|List| F))
          (|b2|
           (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
          (#20=#:G517 NIL) (#21=#:G532 NIL) (#22=#:G533 NIL)
          (|ncb| (|List| (|Vector| F))) (#23=#:G534 NIL) (|be| NIL)
          (#24=#:G535 NIL) (|nlba| (|List| #13#)) (|cb| (|List| (|Vector| F)))
          (|lba| (|List| (|LaurentPolynomial| F UP))) (|j| #16#)
          (#25=#:G536 NIL) (|ba| NIL) (#26=#:G538 NIL) (#27=#:G537 NIL)
          (|lbar| (|List| (|Fraction| UP))) (#28=#:G539 NIL) (|bar| NIL)
          (#29=#:G541 NIL) (|bv| NIL) (#30=#:G540 NIL))
         (SEQ
          (EXIT
           (COND ((NULL |lg|) NIL)
                 ('T
                  (SEQ
                   (LETT |lghr|
                         (PROGN
                          (LETT #1# NIL)
                          (SEQ (LETT |g| NIL) (LETT #2# |lg|) G190
                               (COND
                                ((OR (ATOM #2#)
                                     (PROGN (LETT |g| (CAR #2#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #1#
                                       (CONS
                                        (SPADCALL |g| |der| (QREFELT % 44))
                                        #1#))))
                               (LETT #2# (CDR #2#)) (GO G190) G191
                               (EXIT (NREVERSE #1#)))))
                   (LETT |lg1|
                         (PROGN
                          (LETT #5# NIL)
                          (SEQ (LETT |ghr| NIL) (LETT #6# |lghr|) G190
                               (COND
                                ((OR (ATOM #6#)
                                     (PROGN (LETT |ghr| (CAR #6#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT (LETT #5# (CONS (QVELT |ghr| 1) #5#))))
                               (LETT #6# (CDR #6#)) (GO G190) G191
                               (EXIT (NREVERSE #5#)))))
                   (LETT |cb| (SPADCALL |csolve| |lg1| (QREFELT % 98)))
                   (LETT |a1l|
                         (PROGN
                          (LETT #7# NIL)
                          (SEQ (LETT |ghr| NIL) (LETT #8# |lghr|) G190
                               (COND
                                ((OR (ATOM #8#)
                                     (PROGN (LETT |ghr| (CAR #8#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT (LETT #7# (CONS (QVELT |ghr| 0) #7#))))
                               (LETT #8# (CDR #8#)) (GO G190) G191
                               (EXIT (NREVERSE #7#)))))
                   (LETT |lba|
                         (PROGN
                          (LETT #9# NIL)
                          (SEQ (LETT |bv| NIL) (LETT #10# |cb|) G190
                               (COND
                                ((OR (ATOM #10#)
                                     (PROGN (LETT |bv| (CAR #10#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #9# (CONS (|spadConstant| % 125) #9#))))
                               (LETT #10# (CDR #10#)) (GO G190) G191
                               (EXIT (NREVERSE #9#)))))
                   (LETT |lg2|
                         (PROGN
                          (LETT #11# NIL)
                          (SEQ (LETT |ghr| NIL) (LETT #12# |lghr|) G190
                               (COND
                                ((OR (ATOM #12#)
                                     (PROGN (LETT |ghr| (CAR #12#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #11#
                                       (CONS
                                        (SPADCALL
                                         (SPADCALL (QVELT |ghr| 3)
                                                   (QREFELT % 92))
                                         (|INTPAR1;RF_to_GP| (QVELT |ghr| 2) %)
                                         (QREFELT % 126))
                                        #11#))))
                               (LETT #12# (CDR #12#)) (GO G190) G191
                               (EXIT (NREVERSE #11#)))))
                   (LETT |vg2| (SPADCALL |lg2| (QREFELT % 129)))
                   (LETT |ldg|
                         (PROGN
                          (LETT #14# NIL)
                          (SEQ (LETT |g2| NIL) (LETT #15# |lg2|) G190
                               (COND
                                ((OR (ATOM #15#)
                                     (PROGN (LETT |g2| (CAR #15#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #14#
                                       (CONS (SPADCALL |g2| (QREFELT % 130))
                                             #14#))))
                               (LETT #15# (CDR #15#)) (GO G190) G191
                               (EXIT (NREVERSE #14#)))))
                   (LETT |d| (SPADCALL (ELT % 131) |ldg| (QREFELT % 134)))
                   (LETT |j| |d|)
                   (SEQ
                    (EXIT
                     (SEQ G190 NIL
                          (SEQ (LETT |last_iter| 'T) (LETT |lgj| NIL)
                               (SEQ (LETT |i| 1) (LETT #17# (QVSIZE |vg2|))
                                    G190
                                    (COND ((|greater_SI| |i| #17#) (GO G191)))
                                    (SEQ
                                     (LETT |gi|
                                           (SPADCALL |vg2| |i|
                                                     (QREFELT % 135)))
                                     (LETT |gij| (|spadConstant| % 8))
                                     (COND
                                      ((SPADCALL |gi| (|spadConstant| % 125)
                                                 (QREFELT % 137))
                                       (SEQ (LETT |last_iter| NIL)
                                            (EXIT
                                             (COND
                                              ((EQL
                                                (SPADCALL |gi| (QREFELT % 130))
                                                |j|)
                                               (SEQ
                                                (LETT |gij|
                                                      (SPADCALL |gi|
                                                                (QREFELT %
                                                                         138)))
                                                (EXIT
                                                 (SPADCALL |vg2| |i|
                                                           (SPADCALL |gi|
                                                                     (QREFELT %
                                                                              139))
                                                           (QREFELT %
                                                                    140))))))))))
                                     (EXIT (LETT |lgj| (CONS |gij| |lgj|))))
                                    (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT
                                (COND
                                 (|last_iter|
                                  (PROGN
                                   (LETT #18# |$NoValue|)
                                   (GO #31=#:G507)))
                                 ('T
                                  (SEQ (LETT |lgj| (NREVERSE |lgj|))
                                       (LETT |lgj1| NIL)
                                       (SEQ (LETT |bv| NIL) (LETT #19# |cb|)
                                            G190
                                            (COND
                                             ((OR (ATOM #19#)
                                                  (PROGN
                                                   (LETT |bv| (CAR #19#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (LETT |ff|
                                                   (SPADCALL |bv| |lgj|
                                                             (QREFELT % 110)))
                                             (EXIT
                                              (LETT |lgj1|
                                                    (CONS |ff| |lgj1|))))
                                            (LETT #19# (CDR #19#)) (GO G190)
                                            G191 (EXIT NIL))
                                       (LETT |lgj1| (NREVERSE |lgj1|))
                                       (LETT |b2| (SPADCALL |j| |lgj1| |rde|))
                                       (EXIT
                                        (COND
                                         ((NULL |b2|)
                                          (PROGN
                                           (LETT #20# NIL)
                                           (GO #32=#:G515)))
                                         ('T
                                          (SEQ
                                           (LETT |ncb|
                                                 (PROGN
                                                  (LETT #21# NIL)
                                                  (SEQ (LETT |be| NIL)
                                                       (LETT #22# |b2|) G190
                                                       (COND
                                                        ((OR (ATOM #22#)
                                                             (PROGN
                                                              (LETT |be|
                                                                    (CAR #22#))
                                                              NIL))
                                                         (GO G191)))
                                                       (SEQ
                                                        (EXIT
                                                         (LETT #21#
                                                               (CONS
                                                                (SPADCALL
                                                                 (QCDR |be|)
                                                                 |cb|
                                                                 (QREFELT %
                                                                          115))
                                                                #21#))))
                                                       (LETT #22# (CDR #22#))
                                                       (GO G190) G191
                                                       (EXIT
                                                        (NREVERSE #21#)))))
                                           (LETT |nlba|
                                                 (PROGN
                                                  (LETT #23# NIL)
                                                  (SEQ (LETT |be| NIL)
                                                       (LETT #24# |b2|) G190
                                                       (COND
                                                        ((OR (ATOM #24#)
                                                             (PROGN
                                                              (LETT |be|
                                                                    (CAR #24#))
                                                              NIL))
                                                         (GO G191)))
                                                       (SEQ
                                                        (EXIT
                                                         (LETT #23#
                                                               (CONS
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  (QCDR |be|)
                                                                  |lba|
                                                                  (QREFELT %
                                                                           141))
                                                                 (SPADCALL
                                                                  (QCAR |be|)
                                                                  |j|
                                                                  (QREFELT %
                                                                           142))
                                                                 (QREFELT %
                                                                          126))
                                                                #23#))))
                                                       (LETT #24# (CDR #24#))
                                                       (GO G190) G191
                                                       (EXIT
                                                        (NREVERSE #23#)))))
                                           (LETT |cb| |ncb|)
                                           (LETT |lba| |nlba|)
                                           (EXIT (LETT |j| (- |j| 1))))))))))))
                          NIL (GO G190) G191 (EXIT NIL)))
                    #31# (EXIT #18#))
                   (LETT |lbar|
                         (PROGN
                          (LETT #25# NIL)
                          (SEQ (LETT |ba| NIL) (LETT #26# |lba|)
                               (LETT |bv| NIL) (LETT #27# |cb|) G190
                               (COND
                                ((OR (ATOM #27#)
                                     (PROGN (LETT |bv| (CAR #27#)) NIL)
                                     (ATOM #26#)
                                     (PROGN (LETT |ba| (CAR #26#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #25#
                                       (CONS
                                        (SPADCALL
                                         (SPADCALL |ba| (QREFELT % 143))
                                         (SPADCALL |bv| |a1l| (QREFELT % 116))
                                         (QREFELT % 119))
                                        #25#))))
                               (LETT #27#
                                     (PROG1 (CDR #27#) (LETT #26# (CDR #26#))))
                               (GO G190) G191 (EXIT (NREVERSE #25#)))))
                   (EXIT
                    (PROGN
                     (LETT #28# NIL)
                     (SEQ (LETT |bar| NIL) (LETT #29# |lbar|) (LETT |bv| NIL)
                          (LETT #30# |cb|) G190
                          (COND
                           ((OR (ATOM #30#) (PROGN (LETT |bv| (CAR #30#)) NIL)
                                (ATOM #29#)
                                (PROGN (LETT |bar| (CAR #29#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT (LETT #28# (CONS (CONS |bar| |bv|) #28#))))
                          (LETT #30# (PROG1 (CDR #30#) (LETT #29# (CDR #29#))))
                          (GO G190) G191 (EXIT (NREVERSE #28#)))))))))
          #32# (EXIT #20#)))) 

(SDEFUN |INTPAR1;diffextint1|
        ((|trim| (|Mapping| UP (|Fraction| UP)))
         (|ext|
          (|Mapping|
           #1=(|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
           (|List| UP)))
         (|csolve| (|Mapping| (|List| (|Vector| F)) (|Matrix| F)))
         (|lg| (|List| (|Fraction| UP)))
         (% (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))))
        (SPROG
         ((#2=#:G554 NIL) (#3=#:G555 NIL) (|lup| (|List| UP)) (#4=#:G556 NIL)
          (|up| NIL) (#5=#:G558 NIL) (|g| NIL) (#6=#:G557 NIL)
          (|lg1| (|List| (|Fraction| UP))) (|cb| (|List| (|Vector| F)))
          (#7=#:G559 NIL) (|bv| NIL) (#8=#:G560 NIL) (|lup1| (|List| UP))
          (|res1| #1#) (#9=#:G561 NIL) (|re| NIL) (#10=#:G562 NIL))
         (SEQ
          (LETT |lup|
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |g| NIL) (LETT #3# |lg|) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |g| (CAR #3#)) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS (SPADCALL |g| |trim|) #2#))))
                      (LETT #3# (CDR #3#)) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))
          (LETT |lg1|
                (PROGN
                 (LETT #4# NIL)
                 (SEQ (LETT |up| NIL) (LETT #5# |lup|) (LETT |g| NIL)
                      (LETT #6# |lg|) G190
                      (COND
                       ((OR (ATOM #6#) (PROGN (LETT |g| (CAR #6#)) NIL)
                            (ATOM #5#) (PROGN (LETT |up| (CAR #5#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS
                               (SPADCALL |g| (SPADCALL |up| (QREFELT % 26))
                                         (QREFELT % 119))
                               #4#))))
                      (LETT #6# (PROG1 (CDR #6#) (LETT #5# (CDR #5#))))
                      (GO G190) G191 (EXIT (NREVERSE #4#)))))
          (LETT |cb| (SPADCALL |csolve| |lg1| (QREFELT % 98)))
          (LETT |lup1|
                (PROGN
                 (LETT #7# NIL)
                 (SEQ (LETT |bv| NIL) (LETT #8# |cb|) G190
                      (COND
                       ((OR (ATOM #8#) (PROGN (LETT |bv| (CAR #8#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #7#
                              (CONS (SPADCALL |bv| |lup| (QREFELT % 146))
                                    #7#))))
                      (LETT #8# (CDR #8#)) (GO G190) G191
                      (EXIT (NREVERSE #7#)))))
          (LETT |res1| (SPADCALL |lup1| |ext|))
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
                          (CONS (QCAR |re|)
                                (SPADCALL (QCDR |re|) |cb| (QREFELT % 115)))
                          #9#))))
                 (LETT #10# (CDR #10#)) (GO G190) G191
                 (EXIT (NREVERSE #9#)))))))) 

(SDEFUN |INTPAR1;lin_part| ((|f| (|Fraction| UP)) (% (UP)))
        (SPROG ((|p| (UP)))
               (SEQ
                (LETT |p|
                      (SPADCALL (SPADCALL |f| (QREFELT % 75))
                                (SPADCALL |f| (QREFELT % 48)) (QREFELT % 147)))
                (EXIT
                 (SPADCALL
                  (SPADCALL (SPADCALL |p| 1 (QREFELT % 11)) 1 (QREFELT % 103))
                  (SPADCALL (SPADCALL |p| 0 (QREFELT % 11)) (QREFELT % 12))
                  (QREFELT % 68)))))) 

(SDEFUN |INTPAR1;diffextint;MMLL;8|
        ((|ext|
          (|Mapping|
           (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
           (|List| UP)))
         (|csolve| (|Mapping| (|List| (|Vector| F)) (|Matrix| F)))
         (|lg| (|List| (|Fraction| UP)))
         (% (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))))
        (|INTPAR1;diffextint1| (CONS #'|INTPAR1;diffextint;MMLL;8!0| %) |ext|
         |csolve| |lg| %)) 

(SDEFUN |INTPAR1;diffextint;MMLL;8!0| ((|x| NIL) (% NIL))
        (|INTPAR1;lin_part| |x| %)) 

(SDEFUN |INTPAR1;coeff0| ((|f| (|Fraction| UP)) (% (UP)))
        (SPROG ((|p| (UP)))
               (SEQ
                (LETT |p|
                      (SPADCALL (SPADCALL |f| (QREFELT % 75))
                                (SPADCALL |f| (QREFELT % 48)) (QREFELT % 147)))
                (EXIT
                 (SPADCALL (SPADCALL |p| 0 (QREFELT % 11)) (QREFELT % 12)))))) 

(SDEFUN |INTPAR1;unkextint;MMLL;10|
        ((|ext|
          (|Mapping|
           (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
           (|List| F)))
         (|csolve| (|Mapping| (|List| (|Vector| F)) (|Matrix| F)))
         (|lg| (|List| (|Fraction| UP)))
         (% (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))))
        (SPROG
         ((|ext1|
           (|Mapping|
            (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
            (|List| UP))))
         (SEQ
          (LETT |ext1| (CONS #'|INTPAR1;unkextint;MMLL;10!0| (VECTOR |ext| %)))
          (EXIT
           (|INTPAR1;diffextint1| (CONS #'|INTPAR1;unkextint;MMLL;10!1| %)
            |ext1| |csolve| |lg| %))))) 

(SDEFUN |INTPAR1;unkextint;MMLL;10!1| ((|x| NIL) (% NIL))
        (|INTPAR1;coeff0| |x| %)) 

(SDEFUN |INTPAR1;unkextint;MMLL;10!0| ((|lup| NIL) ($$ NIL))
        (PROG (% |ext|)
          (LETT % (QREFELT $$ 1))
          (LETT |ext| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G577 NIL) (|p| NIL) (#2=#:G578 NIL) (|lf| NIL))
                   (SEQ
                    (LETT |lf|
                          (PROGN
                           (LETT #1# NIL)
                           (SEQ (LETT |p| NIL) (LETT #2# |lup|) G190
                                (COND
                                 ((OR (ATOM #2#)
                                      (PROGN (LETT |p| (CAR #2#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #1#
                                        (CONS (SPADCALL |p| (QREFELT % 104))
                                              #1#))))
                                (LETT #2# (CDR #2#)) (GO G190) G191
                                (EXIT (NREVERSE #1#)))))
                    (EXIT (SPADCALL |lf| |ext|)))))))) 

(DECLAIM (NOTINLINE |ParametricTranscendentalIntegration;|)) 

(DEFUN |ParametricTranscendentalIntegration;| (|#1| |#2|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|ParametricTranscendentalIntegration| DV$1 DV$2))
          (LETT % (GETREFV 152))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache|
                      '|ParametricTranscendentalIntegration| (LIST DV$1 DV$2)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |ParametricTranscendentalIntegration| (&REST #1=#:G584)
  (SPROG NIL
         (PROG (#2=#:G585)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ParametricTranscendentalIntegration|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function| |ParametricTranscendentalIntegration;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|ParametricTranscendentalIntegration|)))))))))) 

(MAKEPROP '|ParametricTranscendentalIntegration| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (0 . |0|)
              (4 . |0|) (|NonNegativeInteger|) (8 . |coefficient|)
              (14 . |coerce|) (19 . -) (|List| 19) (|Mapping| 14 82) (|List| 7)
              (|LiftLinearDependence| 6 23 7) (25 . |csolve_pol|) (|Vector| 23)
              (|List| 6) (|LinearCombinationUtilities| 6 7) (31 . |lin_comb|)
              (|Fraction| 29) (37 . |0|) (|Fraction| 7) (41 . |coerce|)
              (46 . |1|) (50 . |1|) (|Integer|) (|UniversalSegment| 29)
              (54 . SEGMENT) (60 . |elt|)
              (|LinearCombinationUtilities| 23
                                            (|SparseUnivariatePolynomial| 23))
              (66 . |lin_comb|) (72 . |elt|) (78 . |setelt!|)
              (|Record| (|:| |logands| 45) (|:| |basis| 14))
              (|Record| (|:| |logands| 20) (|:| |basis| 14)) (|Mapping| 38 20)
              |INTPAR1;monologextint;LMMR;1|
              (|Record| (|:| |answer| 25) (|:| |logpart| 25)
                        (|:| |specpart| 25) (|:| |polypart| 7))
              (|Mapping| 7 7) (|TranscendentalHermiteIntegration| 6 7)
              (85 . |HermiteIntegrate|) (|List| 25) (91 . |csolve_rf|)
              (97 . |lin_comb|) (103 . |denom|) (|Vector| 7) (108 . |vector|)
              (|Record| (|:| |basis| 49) (|:| |transform| 73)) (|GcdBasis| 7)
              (113 . |gcdDecomposition|) (118 . |entries|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 55) (|:| |factor| 7) (|:| |exponent| 10))
              (|List| 56) (|Factored| 7) (123 . |factorList|) (128 . |concat|)
              (134 . |concat|) (|Mapping| 16 16 16) (|List| 16)
              (140 . |reduce|) (147 . +) (153 . +) (159 . +) (165 . +)
              (171 . +) (|Mapping| 10 10 10) (|List| 10) (177 . |reduce|)
              (|Matrix| 29) (184 . |elt|) (191 . |numer|)
              (|PartialFractionUtilities| 6 7) (196 . |decompose|) (|Matrix| 7)
              (202 . |setelt!|)
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (210 . |divide|) (|Matrix| 6) (|Matrix| %)
              (216 . |reducedSystem|) (221 . /) (227 . |retract|)
              (232 . |concat|) (|Mapping| 58 7) (|Mapping| 37 16)
              |INTPAR1;logextint;MMMMLR;2| (|LaurentPolynomial| 6 7)
              (238 . |coerce|) (|Union| % '"failed") (243 . |exquo|)
              (|List| 109) (|Mapping| 95 82) (|LiftLinearDependence| 6 6 7)
              (249 . |csolve_rf|) (255 . |0|) (259 . |degree|) (264 . |max|)
              (270 . |reduce|) (276 . |monomial|) (282 . |retract|)
              (287 . |elt|) (293 . |leadingCoefficient|) (298 . |reductum|)
              (303 . |setelt!|) (|Vector| 6) (310 . |lin_comb|)
              (316 . |coerce|) (321 . *) (327 . +) (333 . |elt|)
              (339 . |lin_comb|) (345 . |lin_comb|) (351 . |elt|) (357 . /)
              (363 . -) (|Record| (|:| |ratpart| 25) (|:| |coeffs| 109))
              (|List| 120) (|Record| (|:| |ratpart| 6) (|:| |coeffs| 109))
              (|Mapping| 148 20) |INTPAR1;primextint;MMMLL;4| (369 . |0|)
              (373 . +) (|List| 91) (|Vector| 91) (379 . |vector|)
              (384 . |degree|) (389 . |max|) (|Mapping| 29 29 29) (|List| 29)
              (395 . |reduce|) (401 . |elt|) (|Boolean|) (407 . ~=)
              (413 . |leadingCoefficient|) (418 . |reductum|) (423 . |setelt!|)
              (430 . |lin_comb|) (436 . |monomial|) (442 . |convert|)
              (|Mapping| 148 29 20) |INTPAR1;expextint;MMMLL;5|
              (447 . |lin_comb|) (453 . |quo|) (|List| 122) (|Mapping| 148 16)
              |INTPAR1;diffextint;MMLL;8| |INTPAR1;unkextint;MMLL;10|)
           '#(|unkextint| 459 |primextint| 466 |monologextint| 474 |logextint|
              481 |expextint| 490 |diffextint| 498)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|primextint|
                                 ((|List|
                                   (|Record| (|:| |ratpart| (|Fraction| |#2|))
                                             (|:| |coeffs| (|Vector| |#1|))))
                                  (|Mapping| |#2| |#2|)
                                  (|Mapping|
                                   (|List|
                                    (|Record| (|:| |ratpart| |#1|)
                                              (|:| |coeffs| (|Vector| |#1|))))
                                   (|List| |#1|))
                                  (|Mapping| (|List| (|Vector| |#1|))
                                             (|Matrix| |#1|))
                                  (|List| (|Fraction| |#2|))))
                                T)
                              '((|expextint|
                                 ((|List|
                                   (|Record| (|:| |ratpart| (|Fraction| |#2|))
                                             (|:| |coeffs| (|Vector| |#1|))))
                                  (|Mapping| |#2| |#2|)
                                  (|Mapping|
                                   (|List|
                                    (|Record| (|:| |ratpart| |#1|)
                                              (|:| |coeffs| (|Vector| |#1|))))
                                   (|Integer|) (|List| |#1|))
                                  (|Mapping| (|List| (|Vector| |#1|))
                                             (|Matrix| |#1|))
                                  (|List| (|Fraction| |#2|))))
                                T)
                              '((|diffextint|
                                 ((|List|
                                   (|Record| (|:| |ratpart| |#1|)
                                             (|:| |coeffs| (|Vector| |#1|))))
                                  (|Mapping|
                                   (|List|
                                    (|Record| (|:| |ratpart| |#1|)
                                              (|:| |coeffs| (|Vector| |#1|))))
                                   (|List| |#2|))
                                  (|Mapping| (|List| (|Vector| |#1|))
                                             (|Matrix| |#1|))
                                  (|List| (|Fraction| |#2|))))
                                T)
                              '((|unkextint|
                                 ((|List|
                                   (|Record| (|:| |ratpart| |#1|)
                                             (|:| |coeffs| (|Vector| |#1|))))
                                  (|Mapping|
                                   (|List|
                                    (|Record| (|:| |ratpart| |#1|)
                                              (|:| |coeffs| (|Vector| |#1|))))
                                   (|List| |#1|))
                                  (|Mapping| (|List| (|Vector| |#1|))
                                             (|Matrix| |#1|))
                                  (|List| (|Fraction| |#2|))))
                                T)
                              '((|logextint|
                                 ((|Record|
                                   (|:| |logands| (|List| (|Fraction| |#2|)))
                                   (|:| |basis|
                                        (|List|
                                         (|Vector| (|Fraction| (|Integer|))))))
                                  (|Mapping| |#2| |#2|)
                                  (|Mapping| (|Factored| |#2|) |#2|)
                                  (|Mapping|
                                   (|List| (|Vector| (|Fraction| (|Integer|))))
                                   (|Matrix| |#1|))
                                  (|Mapping|
                                   (|Record|
                                    (|:| |logands| (|List| (|Fraction| |#2|)))
                                    (|:| |basis|
                                         (|List|
                                          (|Vector|
                                           (|Fraction| (|Integer|))))))
                                   (|List| |#2|))
                                  (|List| (|Fraction| |#2|))))
                                T)
                              '((|monologextint|
                                 ((|Record|
                                   (|:| |logands| (|List| (|Fraction| |#2|)))
                                   (|:| |basis|
                                        (|List|
                                         (|Vector| (|Fraction| (|Integer|))))))
                                  (|List| |#2|)
                                  (|Mapping|
                                   (|List| (|Vector| (|Fraction| (|Integer|))))
                                   (|Matrix| |#1|))
                                  (|Mapping|
                                   (|Record| (|:| |logands| (|List| |#1|))
                                             (|:| |basis|
                                                  (|List|
                                                   (|Vector|
                                                    (|Fraction|
                                                     (|Integer|))))))
                                   (|List| |#1|))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 151
                                            '(0 6 0 8 0 7 0 9 2 7 6 0 10 11 1 7
                                              0 6 12 2 7 0 0 0 13 2 17 14 15 16
                                              18 2 21 6 19 20 22 0 23 0 24 1 25
                                              0 7 26 0 6 0 27 0 7 0 28 2 30 0
                                              29 29 31 2 19 0 0 30 32 2 33 19
                                              19 14 34 2 19 23 0 29 35 3 19 23
                                              0 29 23 36 2 43 41 25 42 44 2 17
                                              14 15 45 46 2 21 25 19 45 47 1 25
                                              7 0 48 1 49 0 16 50 1 52 51 49 53
                                              1 49 16 0 54 1 58 57 0 59 2 19 0
                                              0 0 60 2 16 0 0 0 61 3 63 16 62 0
                                              16 64 2 25 0 0 0 65 2 23 0 0 0 66
                                              2 19 0 0 0 67 2 7 0 0 0 68 2 10 0
                                              0 0 69 3 71 10 70 0 10 72 3 73 29
                                              0 29 29 74 1 25 7 0 75 2 76 16 7
                                              16 77 4 78 7 0 29 29 7 79 2 7 80
                                              0 0 81 1 7 82 83 84 2 25 0 7 7 85
                                              1 25 7 0 86 2 45 0 0 0 87 1 91 0
                                              7 92 2 91 93 0 0 94 2 97 95 96 45
                                              98 0 25 0 99 1 7 10 0 100 2 10 0
                                              0 0 101 2 71 10 70 0 102 2 7 0 6
                                              10 103 1 7 6 0 104 2 49 7 0 29
                                              105 1 7 6 0 106 1 7 0 0 107 3 49
                                              7 0 29 7 108 2 21 6 109 20 110 1
                                              6 0 29 111 2 6 0 0 0 112 2 6 0 0
                                              0 113 2 109 0 0 30 114 2 21 109
                                              109 95 115 2 21 25 109 45 116 2
                                              109 6 0 29 117 2 6 0 0 0 118 2 25
                                              0 0 0 119 0 91 0 125 2 91 0 0 0
                                              126 1 128 0 127 129 1 91 29 0 130
                                              2 29 0 0 0 131 2 133 29 132 0 134
                                              2 128 91 0 29 135 2 91 136 0 0
                                              137 1 91 6 0 138 1 91 0 0 139 3
                                              128 91 0 29 91 140 2 21 91 109
                                              127 141 2 91 0 6 29 142 1 91 25 0
                                              143 2 21 7 109 16 146 2 7 0 0 0
                                              147 3 0 148 123 96 45 151 4 0 121
                                              42 123 96 45 124 3 0 37 16 15 39
                                              40 5 0 37 42 88 15 89 45 90 4 0
                                              121 42 144 96 45 145 3 0 148 149
                                              96 45 150)))))
           '|lookupComplete|)) 
