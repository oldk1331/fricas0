
(SDEFUN |VECREC2;modInverse|
        ((|c| (|Integer|)) (|p| (|Integer|)) (% (|Integer|)))
        (SPROG ((#1=#:G19 NIL))
               (QCAR
                (PROG2 (LETT #1# (SPADCALL |c| |p| 1 (QREFELT % 10)))
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0)
                                  (|Record| (|:| |coef1| (|Integer|))
                                            (|:| |coef2| (|Integer|)))
                                  (|Union|
                                   (|Record| (|:| |coef1| (|Integer|))
                                             (|:| |coef2| (|Integer|)))
                                   "failed")
                                  #1#))))) 

(SDEFUN |VECREC2;empty;I%;2| ((|nint| (|Integer|)) (% (%)))
        (SPROG ((#1=#:G23 NIL) (|intvec| (|PrimitiveArray| (|Integer|))))
               (SEQ
                (LETT |intvec|
                      (MAKEARR1
                       (PROG1 (LETT #1# |nint|)
                         (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                           '(|Integer|) #1#))
                       0))
                (EXIT
                 (VECTOR 1 0 0 |nint| |intvec| (MAKE-ARRAY 0) 1 0 0
                         (MAKE-ARRAY 0) (MAKE-ARRAY 0)))))) 

(SDEFUN |VECREC2;chinese_update;UvI%V;3|
        ((|vec| (|U32Vector|)) (|p| (|Integer|)) (|statearg| (%)) (% (|Void|)))
        (SPROG
         ((|state| (|Rep|)) (|mp| (|Integer|))
          (|intvec| (|PrimitiveArray| (|Integer|))) (#1=#:G45 NIL)
          (#2=#:G30 NIL) (#3=#:G46 NIL)
          (|bintvec| (|PrimitiveArray| (|Integer|))) (|bmp| (|Integer|))
          (|mpval| #4=(|Integer|)) (|mpcor| (|Integer|))
          (|nbmp| #5=(|Integer|)) (|mpfact| #5#) (|i| NIL) (#6=#:G47 NIL)
          (|ii| (|Integer|)) (|cor| #4#) (|nmp| #5#))
         (SEQ (LETT |state| |statearg|) (LETT |mp| (QVELT |state| 0))
              (LETT |mpval| (SPADCALL |mp| |p| (QREFELT % 12)))
              (EXIT
               (COND ((EQL |mpval| 0) (|error| "Duplicate modulus in update"))
                     (#7='T
                      (SEQ (LETT |mpcor| (|VECREC2;modInverse| |mpval| |p| %))
                           (LETT |mpfact| (* |mpcor| |mp|))
                           (LETT |nmp| (* |mp| |p|))
                           (LETT |mpfact|
                                 (SPADCALL |mpfact| |nmp| (QREFELT % 12)))
                           (QSETVELT |state| 2 (+ (QVELT |state| 2) 1))
                           (LETT |intvec| (QVELT |state| 4))
                           (SEQ (LETT |i| 0) (LETT #1# (- (QVELT |state| 3) 1))
                                G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                                (SEQ (LETT |ii| (QAREF1 |intvec| |i|))
                                     (LETT |cor|
                                           (SPADCALL
                                            (- (ELT_U32 |vec| |i|) |ii|) |p|
                                            (QREFELT % 12)))
                                     (EXIT
                                      (QSETAREF1 |intvec| |i|
                                                 (SPADCALL
                                                  (+ |ii| (* |mpfact| |cor|))
                                                  |nmp| (QREFELT % 12)))))
                                (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                (EXIT NIL))
                           (COND
                            ((>= (QVELT |state| 2) 200)
                             (COND
                              ((EQL
                                (SPADCALL (QVELT |state| 2) 100 (QREFELT % 12))
                                0)
                               (SEQ (QSETVELT |state| 7 (QVELT |state| 2))
                                    (EXIT
                                     (COND
                                      ((SPADCALL (QVELT |state| 5)
                                                 (QREFELT % 15))
                                       (SEQ
                                        (QSETVELT |state| 5
                                                  (MAKEARR1
                                                   (PROG1
                                                       (LETT #2#
                                                             (QVELT |state| 3))
                                                     (|check_subtype2|
                                                      (>= #2# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #2#))
                                                   0))
                                        (LETT |bintvec| (QVELT |state| 5))
                                        (SEQ (LETT |i| 0)
                                             (LETT #3# (- (QVELT |state| 3) 1))
                                             G190
                                             (COND
                                              ((|greater_SI| |i| #3#)
                                               (GO G191)))
                                             (SEQ
                                              (QSETAREF1 |bintvec| |i|
                                                         (QAREF1 |intvec| |i|))
                                              (EXIT
                                               (QSETAREF1 |intvec| |i| 0)))
                                             (LETT |i| (|inc_SI| |i|))
                                             (GO G190) G191 (EXIT NIL))
                                        (QSETVELT |state| 6 |nmp|)
                                        (EXIT (LETT |nmp| 1))))
                                      (#7#
                                       (SEQ (LETT |bintvec| (QVELT |state| 5))
                                            (LETT |bmp| (QVELT |state| 6))
                                            (LETT |mpval|
                                                  (SPADCALL |bmp| |nmp|
                                                            (QREFELT % 12)))
                                            (LETT |mpcor|
                                                  (|VECREC2;modInverse| |mpval|
                                                   |nmp| %))
                                            (LETT |mpfact| (* |mpcor| |bmp|))
                                            (LETT |nbmp| (* |bmp| |nmp|))
                                            (LETT |mpfact|
                                                  (SPADCALL |mpfact| |nbmp|
                                                            (QREFELT % 12)))
                                            (SEQ (LETT |i| 0)
                                                 (LETT #6#
                                                       (- (QVELT |state| 3) 1))
                                                 G190
                                                 (COND
                                                  ((|greater_SI| |i| #6#)
                                                   (GO G191)))
                                                 (SEQ
                                                  (LETT |ii|
                                                        (QAREF1 |bintvec| |i|))
                                                  (LETT |cor|
                                                        (SPADCALL
                                                         (-
                                                          (QAREF1 |intvec| |i|)
                                                          |ii|)
                                                         |nmp| (QREFELT % 12)))
                                                  (QSETAREF1 |bintvec| |i|
                                                             (SPADCALL
                                                              (+ |ii|
                                                                 (* |mpfact|
                                                                    |cor|))
                                                              |nbmp|
                                                              (QREFELT % 12)))
                                                  (EXIT
                                                   (QSETAREF1 |intvec| |i| 0)))
                                                 (LETT |i| (|inc_SI| |i|))
                                                 (GO G190) G191 (EXIT NIL))
                                            (QSETVELT |state| 6 |nbmp|)
                                            (EXIT (LETT |nmp| 1)))))))))))
                           (EXIT (QSETVELT |state| 0 |nmp|))))))))) 

(SDEFUN |VECREC2;hensel_update;UvI%V;4|
        ((|vec| (|U32Vector|)) (|p| (|Integer|)) (|statearg| (%)) (% (|Void|)))
        (SPROG
         ((|state| (|Rep|)) (|mp| (|Integer|))
          (|intvec| (|PrimitiveArray| (|Integer|))) (|i| NIL) (#1=#:G53 NIL))
         (SEQ (LETT |state| |statearg|) (LETT |mp| (QVELT |state| 0))
              (LETT |intvec| (QVELT |state| 4))
              (SEQ (LETT |i| 0) (LETT #1# (- (QVELT |state| 3) 1)) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (QSETAREF1 |intvec| |i|
                                (+ (QAREF1 |intvec| |i|)
                                   (* (ELT_U32 |vec| |i|) |mp|)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT (QSETVELT |state| 0 (* |p| |mp|)))))) 

(SDEFUN |VECREC2;rational_reconstruction;4IU;5|
        ((|x| (|Integer|)) (|y| (|Integer|)) (|i| (|Integer|))
         (|j| (|Integer|))
         (%
          (|Union| (|Record| (|:| |num| (|Integer|)) (|:| |den| (|Integer|)))
                   "failed")))
        (SPROG
         ((|qr|
           (|Record| (|:| |quotient| (|Integer|))
                     (|:| |remainder| (|Integer|))))
          (|r0| (|Integer|)) (|tmp| (|Integer|)) (|s0| (|Integer|))
          (|s1| (|Integer|)) (|r1| (|Integer|)))
         (SEQ (LETT |r0| |y|) (LETT |s0| 0)
              (LETT |r1| (SPADCALL |x| |y| (QREFELT % 12))) (LETT |s1| 1)
              (SEQ G190 (COND ((NULL (> |r1| |i|)) (GO G191)))
                   (SEQ (LETT |qr| (|divide_INT| |r0| |r1|)) (LETT |r0| |r1|)
                        (LETT |r1| (QCDR |qr|))
                        (LETT |tmp| (- |s0| (* (QCAR |qr|) |s1|)))
                        (LETT |s0| |s1|) (EXIT (LETT |s1| |tmp|)))
                   NIL (GO G190) G191 (EXIT NIL))
              (COND
               ((< |s1| 0)
                (SEQ (LETT |s1| (- |s1|)) (EXIT (LETT |r1| (- |r1|))))))
              (EXIT
               (COND
                ((OR (> |s1| |j|) (SPADCALL (GCD |s1| |y|) 1 (QREFELT % 20)))
                 (CONS 1 "failed"))
                ('T (CONS 0 (CONS |r1| |s1|)))))))) 

(SDEFUN |VECREC2;rational_reconstruction2|
        ((|statearg| (%)) (|block_offsets| (|Vector| (|Integer|)))
         (%
          (|Union|
           (|Record| (|:| |numers| (|PrimitiveArray| (|Integer|)))
                     (|:| |denoms| (|PrimitiveArray| (|Integer|))))
           "failed")))
        (SPROG
         ((|state| (|Rep|)) (|modulus| (|Integer|))
          (|intvec| (|PrimitiveArray| (|Integer|))) (|j0| #1=(|Integer|))
          (|bound| (|Integer|)) (|bound2| (|Integer|)) (|n| (|Integer|))
          (|mm| (|NonNegativeInteger|)) (#2=#:G86 NIL) (#3=#:G88 NIL)
          (|nums| (|PrimitiveArray| (|Integer|)))
          (|dens| (|PrimitiveArray| (|Integer|))) (|jj| NIL) (#4=#:G112 NIL)
          (|ctmp| (|Integer|)) (#5=#:G110 NIL) (|j| #1#) (|cb| (|Integer|))
          (|co| (|Integer|)) (|r1| (|Integer|))
          (|pp|
           (|Union|
            (|Record| (|:| |num| (|Integer|)) (|:| |den| #6=(|Integer|)))
            "failed"))
          (|ppr| (|Record| (|:| |num| (|Integer|)) (|:| |den| (|Integer|))))
          (|cden| #6#) (#7=#:G111 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |state| |statearg|) (LETT |modulus| (QVELT |state| 0))
                (LETT |intvec| (QVELT |state| 4))
                (COND
                 ((>= (QVELT |state| 2) 200)
                  (SEQ
                   (COND
                    ((< (- (QVELT |state| 2) (QVELT |state| 8)) 150)
                     (COND
                      ((SPADCALL (QVELT |state| 0) 1 (QREFELT % 20))
                       (EXIT
                        (COND
                         ((EQL (SPADCALL (QVELT |state| 2) 100 (QREFELT % 12))
                               0)
                          (|error| "impossible"))
                         (#8='T
                          (PROGN
                           (LETT #7# (CONS 1 "failed"))
                           (GO #9=#:G109)))))))))
                   (QSETVELT |state| 8 (QVELT |state| 7))
                   (LETT |modulus| (QVELT |state| 6))
                   (EXIT (LETT |intvec| (QVELT |state| 5))))))
                (LETT |j0| (QVELT |state| 1))
                (LETT |bound|
                      (|quotient_INT| (SPADCALL |modulus| (QREFELT % 25)) 10))
                (LETT |bound2| (- |modulus| |bound|))
                (LETT |pp|
                      (SPADCALL (QAREF1 |intvec| |j0|) |modulus| |bound|
                                |bound| (QREFELT % 23)))
                (EXIT
                 (COND ((QEQCAR |pp| 1) (CONS 1 "failed"))
                       (#8#
                        (SEQ (LETT |n| (QVELT |state| 3))
                             (LETT |mm| (QVSIZE |block_offsets|))
                             (COND
                              ((SPADCALL (QVELT |state| 9) (QREFELT % 15))
                               (SEQ
                                (QSETVELT |state| 9
                                          (MAKEARR1
                                           (PROG1 (LETT #2# |n|)
                                             (|check_subtype2| (>= #2# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #2#))
                                           0))
                                (EXIT
                                 (QSETVELT |state| 10
                                           (MAKEARR1
                                            (PROG1 (LETT #3# |n|)
                                              (|check_subtype2| (>= #3# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #3#))
                                            0))))))
                             (LETT |nums| (QVELT |state| 9))
                             (LETT |dens| (QVELT |state| 10))
                             (LETT |ppr| (QCDR |pp|))
                             (QSETAREF1 |nums| |j0| (QCAR |ppr|))
                             (QSETAREF1 |dens| |j0| (QCDR |ppr|))
                             (LETT |cden| (QCDR |ppr|)) (LETT |co| 0)
                             (LETT |cb| 1)
                             (SEQ
                              (EXIT
                               (SEQ (LETT |jj| 1) (LETT #4# |mm|) G190
                                    (COND ((|greater_SI| |jj| #4#) (GO G191)))
                                    (SEQ
                                     (LETT |ctmp|
                                           (SPADCALL |block_offsets| |jj|
                                                     (QREFELT % 27)))
                                     (EXIT
                                      (COND
                                       ((> |ctmp| |j0|)
                                        (SEQ (LETT |cb| |jj|)
                                             (LETT |co| |ctmp|)
                                             (EXIT
                                              (PROGN
                                               (LETT #5# |$NoValue|)
                                               (GO #10=#:G94))))))))
                                    (LETT |jj| (|inc_SI| |jj|)) (GO G190) G191
                                    (EXIT NIL)))
                              #10# (EXIT #5#))
                             (LETT |j| |j0|)
                             (EXIT
                              (SEQ G190 NIL
                                   (SEQ (LETT |j| (+ |j| 1))
                                        (COND
                                         ((>= |j| |n|) (LETT |j| (- |j| |n|))))
                                        (COND
                                         ((EQL |j| |co|)
                                          (COND
                                           ((> |mm| 1)
                                            (SEQ (LETT |cden| 1)
                                                 (LETT |cb|
                                                       (COND
                                                        ((EQL |cb| |mm|) 1)
                                                        ('T (+ |cb| 1))))
                                                 (EXIT
                                                  (LETT |co|
                                                        (SPADCALL
                                                         |block_offsets| |cb|
                                                         (QREFELT % 27)))))))))
                                        (EXIT
                                         (COND
                                          ((EQL |j| |j0|)
                                           (PROGN
                                            (LETT #7#
                                                  (CONS 0
                                                        (CONS |nums| |dens|)))
                                            (GO #9#)))
                                          ('T
                                           (SEQ
                                            (LETT |r1|
                                                  (SPADCALL
                                                   (* |cden|
                                                      (QAREF1 |intvec| |j|))
                                                   |modulus| (QREFELT % 12)))
                                            (EXIT
                                             (COND
                                              ((< |r1| |bound|)
                                               (SEQ (QSETAREF1 |nums| |j| |r1|)
                                                    (EXIT
                                                     (QSETAREF1 |dens| |j|
                                                                |cden|))))
                                              ((> |r1| |bound2|)
                                               (SEQ
                                                (QSETAREF1 |nums| |j|
                                                           (- |r1| |modulus|))
                                                (EXIT
                                                 (QSETAREF1 |dens| |j|
                                                            |cden|))))
                                              ('T
                                               (SEQ
                                                (LETT |pp|
                                                      (SPADCALL |r1| |modulus|
                                                                |bound| |bound|
                                                                (QREFELT %
                                                                         23)))
                                                (EXIT
                                                 (COND
                                                  ((QEQCAR |pp| 1)
                                                   (SEQ
                                                    (QSETVELT |state| 1 |j|)
                                                    (EXIT
                                                     (PROGN
                                                      (LETT #7#
                                                            (CONS 1 "failed"))
                                                      (GO #9#)))))
                                                  ('T
                                                   (SEQ
                                                    (LETT |ppr| (QCDR |pp|))
                                                    (LETT |cden|
                                                          (* |cden|
                                                             (QCDR |ppr|)))
                                                    (EXIT
                                                     (COND
                                                      ((> |cden| |bound|)
                                                       (SEQ
                                                        (QSETVELT |state| 1
                                                                  |j|)
                                                        (EXIT
                                                         (PROGN
                                                          (LETT #7#
                                                                (CONS 1
                                                                      "failed"))
                                                          (GO #9#)))))
                                                      ('T
                                                       (SEQ
                                                        (QSETAREF1 |nums| |j|
                                                                   (QCAR
                                                                    |ppr|))
                                                        (EXIT
                                                         (QSETAREF1 |dens| |j|
                                                                    |cden|)))))))))))))))))))
                                   NIL (GO G190) G191 (EXIT NIL)))))))))
          #9# (EXIT #7#)))) 

(SDEFUN |VECREC2;rational_reconstruction;%U;7|
        ((|statearg| (%))
         (%
          (|Union|
           (|Record| (|:| |numers| (|PrimitiveArray| (|Integer|)))
                     (|:| |denoms| (|PrimitiveArray| (|Integer|))))
           "failed")))
        (|VECREC2;rational_reconstruction2| |statearg| (MAKEARR1 1 0) %)) 

(SDEFUN |VECREC2;lcm|
        ((|nums| (|PrimitiveArray| (|Integer|))) (|lo| (|Integer|))
         (|hi| (|Integer|)) (% (|Integer|)))
        (SPROG ((|i| NIL) (#1=#:G122 NIL) (|res| (|Integer|)))
               (SEQ (LETT |res| (QAREF1 |nums| |lo|))
                    (SEQ (LETT |i| (+ |lo| 1)) (LETT #1# |hi|) G190
                         (COND ((> |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |res|
                                 (SPADCALL |res| (QAREF1 |nums| |i|)
                                           (QREFELT % 31)))))
                         (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                    (EXIT |res|)))) 

(SDEFUN |VECREC2;gcd|
        ((|nums| (|PrimitiveArray| (|Integer|))) (|lo| (|Integer|))
         (|hi| (|Integer|)) (% (|Integer|)))
        (SPROG ((|i| NIL) (#1=#:G127 NIL) (|res| (|Integer|)))
               (SEQ (LETT |res| (QAREF1 |nums| |lo|))
                    (SEQ (LETT |i| (+ |lo| 1)) (LETT #1# |hi|) G190
                         (COND ((> |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT (LETT |res| (GCD |res| (QAREF1 |nums| |i|)))))
                         (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                    (EXIT |res|)))) 

(SDEFUN |VECREC2;remove_denoms;V3Pa;10|
        ((|block_offsets| (|Vector| (|Integer|)))
         (|nums| (|PrimitiveArray| (|Integer|)))
         (|dens| (|PrimitiveArray| (|Integer|)))
         (% (|PrimitiveArray| (|Integer|))))
        (SPROG
         ((|nb| (|NonNegativeInteger|)) (|np| (|NonNegativeInteger|))
          (|res| (|PrimitiveArray| (|Integer|))) (|ib| NIL) (#1=#:G143 NIL)
          (|li| #2=(|Integer|)) (|hi| #2#) (|cden| (|Integer|)) (#3=#:G144 NIL)
          (|tmpp2| (|Integer|)) (|cfactor| (|Integer|)) (|i| NIL)
          (#4=#:G145 NIL) (#5=#:G132 NIL))
         (SEQ (LETT |nb| (QVSIZE |block_offsets|)) (LETT |np| (QVSIZE |nums|))
              (LETT |res| (MAKEARR1 |np| 0))
              (SEQ (LETT |ib| 1) (LETT #1# |nb|) G190
                   (COND ((|greater_SI| |ib| #1#) (GO G191)))
                   (SEQ
                    (LETT |li| (SPADCALL |block_offsets| |ib| (QREFELT % 27)))
                    (LETT |hi|
                          (COND ((EQL |ib| |nb|) |np|)
                                ('T
                                 (SPADCALL |block_offsets| (+ |ib| 1)
                                           (QREFELT % 27)))))
                    (LETT |hi| (- |hi| 1))
                    (LETT |cden| (|VECREC2;lcm| |dens| |li| |hi| %))
                    (SEQ (LETT |i| |li|) (LETT #3# |hi|) G190
                         (COND ((> |i| #3#) (GO G191)))
                         (SEQ
                          (LETT |tmpp2|
                                (PROG2
                                    (LETT #5#
                                          (|exquo_INT| |cden|
                                                       (QAREF1 |dens| |i|)))
                                    (QCDR #5#)
                                  (|check_union2| (QEQCAR #5# 0) (|Integer|)
                                                  (|Union| (|Integer|)
                                                           #6="failed")
                                                  #5#)))
                          (EXIT
                           (QSETAREF1 |res| |i|
                                      (* (QAREF1 |nums| |i|) |tmpp2|))))
                         (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                    (LETT |cfactor| (|VECREC2;gcd| |res| |li| |hi| %))
                    (EXIT
                     (COND
                      ((SPADCALL |cfactor| 1 (QREFELT % 20))
                       (COND
                        ((SPADCALL |cfactor| 0 (QREFELT % 20))
                         (SEQ (LETT |i| |li|) (LETT #4# |hi|) G190
                              (COND ((> |i| #4#) (GO G191)))
                              (SEQ
                               (EXIT
                                (QSETAREF1 |res| |i|
                                           (PROG2
                                               (LETT #5#
                                                     (|exquo_INT|
                                                      (QAREF1 |res| |i|)
                                                      |cfactor|))
                                               (QCDR #5#)
                                             (|check_union2| (QEQCAR #5# 0)
                                                             (|Integer|)
                                                             (|Union|
                                                              (|Integer|) #6#)
                                                             #5#)))))
                              (LETT |i| (+ |i| 1)) (GO G190) G191
                              (EXIT NIL))))))))
                   (LETT |ib| (|inc_SI| |ib|)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |VECREC2;reconstruct;%VU;11|
        ((|statearg| (%)) (|block_offsets| (|Vector| (|Integer|)))
         (% (|Union| (|PrimitiveArray| (|Integer|)) "failed")))
        (SPROG
         ((|pp|
           (|Union|
            (|Record| (|:| |numers| (|PrimitiveArray| (|Integer|)))
                      (|:| |denoms| (|PrimitiveArray| (|Integer|))))
            "failed"))
          (#1=#:G155 NIL)
          (|ppr|
           (|Record| (|:| |numers| (|PrimitiveArray| (|Integer|)))
                     (|:| |denoms| (|PrimitiveArray| (|Integer|))))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |pp|
                  (|VECREC2;rational_reconstruction2| |statearg|
                   |block_offsets| %))
            (EXIT
             (COND
              ((QEQCAR |pp| 1)
               (PROGN (LETT #1# (CONS 1 "failed")) (GO #2=#:G154)))
              ('T
               (SEQ (LETT |ppr| (QCDR |pp|))
                    (EXIT
                     (CONS 0
                           (SPADCALL |block_offsets| (QCAR |ppr|) (QCDR |ppr|)
                                     (QREFELT % 32))))))))))
          #2# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |VectorIntegerReconstructor;|)) 

(DEFUN |VectorIntegerReconstructor;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|VectorIntegerReconstructor|))
          (LETT % (GETREFV 35))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|VectorIntegerReconstructor| NIL
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 6
                    (|Record| (|:| |cmod| (|Integer|)) (|:| |curj| (|Integer|))
                              (|:| |nmods| (|Integer|))
                              (|:| |nints| (|Integer|))
                              (|:| |ints| (|PrimitiveArray| (|Integer|)))
                              (|:| |bints| (|PrimitiveArray| (|Integer|)))
                              (|:| |bcmod| (|Integer|))
                              (|:| |bnmods| (|Integer|))
                              (|:| |nrecs| (|Integer|))
                              (|:| |numers| (|PrimitiveArray| (|Integer|)))
                              (|:| |denoms| (|PrimitiveArray| (|Integer|)))))
          %))) 

(DEFUN |VectorIntegerReconstructor| ()
  (SPROG NIL
         (PROG (#1=#:G157)
           (RETURN
            (COND
             ((LETT #1#
                    (HGET |$ConstructorCache| '|VectorIntegerReconstructor|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|VectorIntegerReconstructor|
                             (LIST
                              (CONS NIL
                                    (CONS 1
                                          (|VectorIntegerReconstructor;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|VectorIntegerReconstructor|)))))))))) 

(MAKEPROP '|VectorIntegerReconstructor| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep|
              (|Record| (|:| |coef1| %) (|:| |coef2| %)) (|Union| 7 '"failed")
              (|Integer|) (0 . |extendedEuclidean|) |VECREC2;empty;I%;2|
              (7 . |positiveRemainder|) (|Boolean|) (|PrimitiveArray| 9)
              (13 . |empty?|) (|Void|) (|U32Vector|)
              |VECREC2;chinese_update;UvI%V;3| |VECREC2;hensel_update;UvI%V;4|
              (18 . ~=) (|Record| (|:| |num| 9) (|:| |den| 9))
              (|Union| 21 '"failed") |VECREC2;rational_reconstruction;4IU;5|
              (|IntegerRoots| 9) (24 . |approxSqrt|) (|Vector| 9) (29 . |elt|)
              (|Record| (|:| |numers| 14) (|:| |denoms| 14))
              (|Union| 28 '"failed") |VECREC2;rational_reconstruction;%U;7|
              (35 . |lcm|) |VECREC2;remove_denoms;V3Pa;10|
              (|Union| 14 '"failed") |VECREC2;reconstruct;%VU;11|)
           '#(|remove_denoms| 41 |reconstruct| 48 |rational_reconstruction| 54
              |hensel_update| 67 |empty| 74 |chinese_update| 79)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|empty| ($$ (|Integer|))) T)
                                   '((|chinese_update|
                                      ((|Void|) (|U32Vector|) (|Integer|) $$))
                                     T)
                                   '((|hensel_update|
                                      ((|Void|) (|U32Vector|) (|Integer|) $$))
                                     T)
                                   '((|rational_reconstruction|
                                      ((|Union|
                                        (|Record| (|:| |num| (|Integer|))
                                                  (|:| |den| (|Integer|)))
                                        "failed")
                                       (|Integer|) (|Integer|) (|Integer|)
                                       (|Integer|)))
                                     T)
                                   '((|rational_reconstruction|
                                      ((|Union|
                                        (|Record|
                                         (|:| |numers|
                                              (|PrimitiveArray| (|Integer|)))
                                         (|:| |denoms|
                                              (|PrimitiveArray| (|Integer|))))
                                        "failed")
                                       $$))
                                     T)
                                   '((|remove_denoms|
                                      ((|PrimitiveArray| (|Integer|))
                                       (|Vector| (|Integer|))
                                       (|PrimitiveArray| (|Integer|))
                                       (|PrimitiveArray| (|Integer|))))
                                     T)
                                   '((|reconstruct|
                                      ((|Union| (|PrimitiveArray| (|Integer|))
                                                "failed")
                                       $$ (|Vector| (|Integer|))))
                                     T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 34
                                            '(3 9 8 0 0 0 10 2 9 0 0 0 12 1 14
                                              13 0 15 2 9 13 0 0 20 1 24 9 9 25
                                              2 26 9 0 9 27 2 9 0 0 0 31 3 0 14
                                              26 14 14 32 2 0 33 0 26 34 4 0 22
                                              9 9 9 9 23 1 0 29 0 30 3 0 16 17
                                              9 0 19 1 0 0 9 11 3 0 16 17 9 0
                                              18)))))
           '|lookupComplete|)) 
