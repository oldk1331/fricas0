
(SDEFUN |FSPECF;abs;2F;1| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 13) |x| (QREFELT % 51))) 

(SDEFUN |FSPECF;sign;2F;2| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 14) |x| (QREFELT % 51))) 

(SDEFUN |FSPECF;unitStep;2F;3| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 15) |x| (QREFELT % 51))) 

(SDEFUN |FSPECF;ceiling;2F;4| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 16) |x| (QREFELT % 51))) 

(SDEFUN |FSPECF;floor;2F;5| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 17) |x| (QREFELT % 51))) 

(SDEFUN |FSPECF;fractionPart;2F;6| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 18) |x| (QREFELT % 51))) 

(SDEFUN |FSPECF;diracDelta;2F;7| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 19) |x| (QREFELT % 51))) 

(SDEFUN |FSPECF;conjugate;2F;8| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 20) |x| (QREFELT % 51))) 

(SDEFUN |FSPECF;Gamma;2F;9| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 21) |x| (QREFELT % 51))) 

(SDEFUN |FSPECF;Gamma;3F;10| ((|a| (F)) (|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 22) |a| |x| (QREFELT % 61))) 

(SDEFUN |FSPECF;Beta;3F;11| ((|x| (F)) (|y| (F)) (% (F)))
        (SPADCALL (QREFELT % 23) |x| |y| (QREFELT % 61))) 

(SDEFUN |FSPECF;digamma;2F;12| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 24) |x| (QREFELT % 51))) 

(SDEFUN |FSPECF;polygamma;3F;13| ((|k| (F)) (|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 25) |k| |x| (QREFELT % 61))) 

(SDEFUN |FSPECF;besselJ;3F;14| ((|a| (F)) (|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 26) |a| |x| (QREFELT % 61))) 

(SDEFUN |FSPECF;besselY;3F;15| ((|a| (F)) (|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 27) |a| |x| (QREFELT % 61))) 

(SDEFUN |FSPECF;besselI;3F;16| ((|a| (F)) (|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 28) |a| |x| (QREFELT % 61))) 

(SDEFUN |FSPECF;besselK;3F;17| ((|a| (F)) (|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 29) |a| |x| (QREFELT % 61))) 

(SDEFUN |FSPECF;airyAi;2F;18| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 30) |x| (QREFELT % 51))) 

(SDEFUN |FSPECF;airyAiPrime;2F;19| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 31) |x| (QREFELT % 51))) 

(SDEFUN |FSPECF;airyBi;2F;20| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 32) |x| (QREFELT % 51))) 

(SDEFUN |FSPECF;airyBiPrime;2F;21| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 33) |x| (QREFELT % 51))) 

(SDEFUN |FSPECF;lambertW;2F;22| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 34) |x| (QREFELT % 51))) 

(SDEFUN |FSPECF;polylog;3F;23| ((|s| (F)) (|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 35) |s| |x| (QREFELT % 61))) 

(SDEFUN |FSPECF;weierstrassP;4F;24| ((|g2| (F)) (|g3| (F)) (|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 36) |g2| |g3| |x| (QREFELT % 76))) 

(SDEFUN |FSPECF;weierstrassPPrime;4F;25|
        ((|g2| (F)) (|g3| (F)) (|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 37) |g2| |g3| |x| (QREFELT % 76))) 

(SDEFUN |FSPECF;weierstrassSigma;4F;26|
        ((|g2| (F)) (|g3| (F)) (|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 38) |g2| |g3| |x| (QREFELT % 76))) 

(SDEFUN |FSPECF;weierstrassZeta;4F;27|
        ((|g2| (F)) (|g3| (F)) (|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 39) |g2| |g3| |x| (QREFELT % 76))) 

(SDEFUN |FSPECF;hypergeometricF;2L2F;28|
        ((|a| (|List| F)) (|b| (|List| F)) (|z| (F)) (% (F)))
        (SPROG
         ((|q| (F)) (|p| (F)) (|nbi| #1=(|NonNegativeInteger|)) (|nai| #1#))
         (SEQ (LETT |nai| (LENGTH |a|)) (LETT |nbi| (LENGTH |b|))
              (COND
               ((SPADCALL |z| (|spadConstant| % 82) (QREFELT % 84))
                (COND ((<= |nai| (+ |nbi| 1)) (EXIT (|spadConstant| % 86))))))
              (LETT |p| (SPADCALL (LENGTH |a|) (QREFELT % 88)))
              (LETT |q| (SPADCALL (LENGTH |b|) (QREFELT % 88)))
              (EXIT
               (SPADCALL (QREFELT % 40)
                         (SPADCALL
                          (SPADCALL |a|
                                    (SPADCALL |b| (LIST |z|) (QREFELT % 90))
                                    (QREFELT % 90))
                          (LIST |p| |q|) (QREFELT % 90))
                         (QREFELT % 92)))))) 

(SDEFUN |FSPECF;meijerG;4L2F;29|
        ((|a| (|List| F)) (|b| (|List| F)) (|c| (|List| F)) (|d| (|List| F))
         (|z| (F)) (% (F)))
        (SPROG ((|m2| (F)) (|m1| (F)) (|n2| (F)) (|n1| (F)))
               (SEQ (LETT |n1| (SPADCALL (LENGTH |a|) (QREFELT % 88)))
                    (LETT |n2| (SPADCALL (LENGTH |b|) (QREFELT % 88)))
                    (LETT |m1| (SPADCALL (LENGTH |c|) (QREFELT % 88)))
                    (LETT |m2| (SPADCALL (LENGTH |d|) (QREFELT % 88)))
                    (EXIT
                     (SPADCALL (QREFELT % 41)
                               (SPADCALL
                                (SPADCALL |a|
                                          (SPADCALL |b|
                                                    (SPADCALL |c|
                                                              (SPADCALL |d|
                                                                        (LIST
                                                                         |z|)
                                                                        (QREFELT
                                                                         % 90))
                                                              (QREFELT % 90))
                                                    (QREFELT % 90))
                                          (QREFELT % 90))
                                (LIST |n1| |n2| |m1| |m2|) (QREFELT % 90))
                               (QREFELT % 92)))))) 

(SDEFUN |FSPECF;grad2|
        ((|l| (|List| F)) (|t| (|Symbol|)) (|op| (|BasicOperator|))
         (|d2| (|Mapping| F F F)) (% (F)))
        (SPROG ((|dm| (F)) (|x2| (F)) (|x1| (F)))
               (SEQ (LETT |x1| (SPADCALL |l| 1 (QREFELT % 107)))
                    (LETT |x2| (SPADCALL |l| 2 (QREFELT % 107)))
                    (LETT |dm|
                          (SPADCALL (SPADCALL (QREFELT % 108))
                                    (QREFELT % 109)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL (SPADCALL |x1| |t| (QREFELT % 110))
                                (SPADCALL (QREFELT % 96)
                                          (LIST
                                           (SPADCALL |op| (LIST |dm| |x2|)
                                                     (QREFELT % 92))
                                           |dm| |x1|)
                                          (QREFELT % 111))
                                (QREFELT % 112))
                      (SPADCALL (SPADCALL |x2| |t| (QREFELT % 110))
                                (SPADCALL |x1| |x2| |d2|) (QREFELT % 112))
                      (QREFELT % 113)))))) 

(SDEFUN |FSPECF;grad3|
        ((|l| (|List| F)) (|t| (|Symbol|)) (|op| (|BasicOperator|))
         (|d3| (|Mapping| F F F F)) (% (F)))
        (SPROG ((|dm2| (F)) (|dm1| (F)) (|x3| (F)) (|x2| (F)) (|x1| (F)))
               (SEQ (LETT |x1| (SPADCALL |l| 1 (QREFELT % 107)))
                    (LETT |x2| (SPADCALL |l| 2 (QREFELT % 107)))
                    (LETT |x3| (SPADCALL |l| 3 (QREFELT % 107)))
                    (LETT |dm1|
                          (SPADCALL (SPADCALL (QREFELT % 108))
                                    (QREFELT % 109)))
                    (LETT |dm2|
                          (SPADCALL (SPADCALL (QREFELT % 108))
                                    (QREFELT % 109)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL |x1| |t| (QREFELT % 110))
                                 (SPADCALL (QREFELT % 96)
                                           (LIST
                                            (SPADCALL |op|
                                                      (LIST |dm1| |x2| |x3|)
                                                      (QREFELT % 92))
                                            |dm1| |x1|)
                                           (QREFELT % 111))
                                 (QREFELT % 112))
                       (SPADCALL (SPADCALL |x2| |t| (QREFELT % 110))
                                 (SPADCALL (QREFELT % 96)
                                           (LIST
                                            (SPADCALL |op|
                                                      (LIST |x1| |dm2| |x3|)
                                                      (QREFELT % 92))
                                            |dm2| |x2|)
                                           (QREFELT % 111))
                                 (QREFELT % 112))
                       (QREFELT % 113))
                      (SPADCALL (SPADCALL |x3| |t| (QREFELT % 110))
                                (SPADCALL |x1| |x2| |x3| |d3|) (QREFELT % 112))
                      (QREFELT % 113)))))) 

(SDEFUN |FSPECF;grad4|
        ((|l| (|List| F)) (|t| (|Symbol|)) (|op| (|BasicOperator|))
         (|d4| (|Mapping| F F F F F)) (% (F)))
        (SPROG
         ((|kd3| (F)) (|kd2| (F)) (|kd1| (F)) (|dm3| (F)) (|dm2| (F))
          (|dm1| (F)) (|x4| (F)) (|x3| (F)) (|x2| (F)) (|x1| (F)))
         (SEQ (LETT |x1| (SPADCALL |l| 1 (QREFELT % 107)))
              (LETT |x2| (SPADCALL |l| 2 (QREFELT % 107)))
              (LETT |x3| (SPADCALL |l| 3 (QREFELT % 107)))
              (LETT |x4| (SPADCALL |l| 4 (QREFELT % 107)))
              (LETT |dm1|
                    (SPADCALL (SPADCALL (QREFELT % 108)) (QREFELT % 109)))
              (LETT |dm2|
                    (SPADCALL (SPADCALL (QREFELT % 108)) (QREFELT % 109)))
              (LETT |dm3|
                    (SPADCALL (SPADCALL (QREFELT % 108)) (QREFELT % 109)))
              (LETT |kd1|
                    (SPADCALL (QREFELT % 96)
                              (LIST
                               (SPADCALL |op| (LIST |dm1| |x2| |x3| |x4|)
                                         (QREFELT % 92))
                               |dm1| |x1|)
                              (QREFELT % 111)))
              (LETT |kd2|
                    (SPADCALL (QREFELT % 96)
                              (LIST
                               (SPADCALL |op| (LIST |x1| |dm2| |x3| |x4|)
                                         (QREFELT % 92))
                               |dm2| |x2|)
                              (QREFELT % 111)))
              (LETT |kd3|
                    (SPADCALL (QREFELT % 96)
                              (LIST
                               (SPADCALL |op| (LIST |x1| |x2| |dm3| |x4|)
                                         (QREFELT % 92))
                               |dm3| |x3|)
                              (QREFELT % 111)))
              (EXIT
               (SPADCALL
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL |x1| |t| (QREFELT % 110)) |kd1|
                            (QREFELT % 112))
                  (SPADCALL (SPADCALL |x2| |t| (QREFELT % 110)) |kd2|
                            (QREFELT % 112))
                  (QREFELT % 113))
                 (SPADCALL (SPADCALL |x3| |t| (QREFELT % 110)) |kd3|
                           (QREFELT % 112))
                 (QREFELT % 113))
                (SPADCALL (SPADCALL |x4| |t| (QREFELT % 110))
                          (SPADCALL |x1| |x2| |x3| |x4| |d4|) (QREFELT % 112))
                (QREFELT % 113)))))) 

(SDEFUN |FSPECF;weierstrassPInverse;4F;33|
        ((|g2| (F)) (|g3| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 114) |g2| |g3| |z| (QREFELT % 76))) 

(SDEFUN |FSPECF;eWeierstrassPInverse| ((|g2| (F)) (|g3| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 114) (LIST |g2| |g3| |z|) (QREFELT % 111))) 

(SDEFUN |FSPECF;elWeierstrassPInverse| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eWeierstrassPInverse| (SPADCALL |l| 1 (QREFELT % 107))
         (SPADCALL |l| 2 (QREFELT % 107)) (SPADCALL |l| 3 (QREFELT % 107)) %)) 

(SDEFUN |FSPECF;eWeierstrassPInverseGrad_g2| ((|l| (|List| F)) (% (F)))
        (SPROG
         ((|s2| (F)) (|s1| (F)) (|delta| (F)) (|wpi| (F)) (|z| (F)) (|g3| (F))
          (|g2| (F)))
         (SEQ (LETT |g2| (SPADCALL |l| 1 (QREFELT % 107)))
              (LETT |g3| (SPADCALL |l| 2 (QREFELT % 107)))
              (LETT |z| (SPADCALL |l| 3 (QREFELT % 107)))
              (LETT |wpi| (SPADCALL |g2| |g3| |z| (QREFELT % 115)))
              (LETT |delta|
                    (SPADCALL (SPADCALL |g2| 3 (QREFELT % 119))
                              (SPADCALL 27 (SPADCALL |g3| 2 (QREFELT % 119))
                                        (QREFELT % 104))
                              (QREFELT % 120)))
              (LETT |s1|
                    (SPADCALL
                     (SPADCALL (SPADCALL 18 |g3| (QREFELT % 104))
                               (SPADCALL |g2| |g3| |wpi| (QREFELT % 80))
                               (QREFELT % 112))
                     (SPADCALL (SPADCALL |g2| 2 (QREFELT % 119)) |wpi|
                               (QREFELT % 112))
                     (QREFELT % 120)))
              (LETT |s2|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (SPADCALL 36 |g3| (QREFELT % 104))
                                (SPADCALL |z| 2 (QREFELT % 119))
                                (QREFELT % 112))
                      (SPADCALL
                       (SPADCALL 2 (SPADCALL |g2| 2 (QREFELT % 119))
                                 (QREFELT % 104))
                       |z| (QREFELT % 112))
                      (QREFELT % 120))
                     (SPADCALL (SPADCALL 6 |g2| (QREFELT % 104)) |g3|
                               (QREFELT % 112))
                     (QREFELT % 120)))
              (EXIT
               (SPADCALL
                (SPADCALL |s1|
                          (SPADCALL |s2|
                                    (SPADCALL |g2| |g3| |wpi| (QREFELT % 78))
                                    (QREFELT % 121))
                          (QREFELT % 113))
                (SPADCALL 4 |delta| (QREFELT % 104)) (QREFELT % 121)))))) 

(SDEFUN |FSPECF;eWeierstrassPInverseGrad_g3| ((|l| (|List| F)) (% (F)))
        (SPROG
         ((|s2| (F)) (|s1| (F)) (|delta| (F)) (|wpi| (F)) (|z| (F)) (|g3| (F))
          (|g2| (F)))
         (SEQ (LETT |g2| (SPADCALL |l| 1 (QREFELT % 107)))
              (LETT |g3| (SPADCALL |l| 2 (QREFELT % 107)))
              (LETT |z| (SPADCALL |l| 3 (QREFELT % 107)))
              (LETT |wpi| (SPADCALL |g2| |g3| |z| (QREFELT % 115)))
              (LETT |delta|
                    (SPADCALL (SPADCALL |g2| 3 (QREFELT % 119))
                              (SPADCALL 27 (SPADCALL |g3| 2 (QREFELT % 119))
                                        (QREFELT % 104))
                              (QREFELT % 120)))
              (LETT |s1|
                    (SPADCALL
                     (SPADCALL (SPADCALL 9 |g3| (QREFELT % 104)) |wpi|
                               (QREFELT % 112))
                     (SPADCALL (SPADCALL 6 |g2| (QREFELT % 104))
                               (SPADCALL |g2| |g3| |wpi| (QREFELT % 80))
                               (QREFELT % 112))
                     (QREFELT % 120)))
              (LETT |s2|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL 12 |g2| (QREFELT % 104))
                                 (SPADCALL |z| 2 (QREFELT % 119))
                                 (QREFELT % 112))
                       (QREFELT % 122))
                      (SPADCALL (SPADCALL 18 |g3| (QREFELT % 104)) |z|
                                (QREFELT % 112))
                      (QREFELT % 113))
                     (SPADCALL 2 (SPADCALL |g2| 2 (QREFELT % 119))
                               (QREFELT % 104))
                     (QREFELT % 113)))
              (EXIT
               (SPADCALL
                (SPADCALL |s1|
                          (SPADCALL |s2|
                                    (SPADCALL |g2| |g3| |wpi| (QREFELT % 78))
                                    (QREFELT % 121))
                          (QREFELT % 113))
                (SPADCALL 2 |delta| (QREFELT % 104)) (QREFELT % 121)))))) 

(SDEFUN |FSPECF;eWeierstrassPInverseGrad_z| ((|l| (|List| F)) (% (F)))
        (SPROG ((|z| (F)) (|g3| (F)) (|g2| (F)))
               (SEQ (LETT |g2| (SPADCALL |l| 1 (QREFELT % 107)))
                    (LETT |g3| (SPADCALL |l| 2 (QREFELT % 107)))
                    (LETT |z| (SPADCALL |l| 3 (QREFELT % 107)))
                    (EXIT
                     (SPADCALL (|spadConstant| % 86)
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL 4 (SPADCALL |z| 3 (QREFELT % 119))
                                            (QREFELT % 104))
                                  (SPADCALL |g2| |z| (QREFELT % 112))
                                  (QREFELT % 120))
                                 |g3| (QREFELT % 120))
                                (QREFELT % 125))
                               (QREFELT % 121)))))) 

(SDEFUN |FSPECF;whittakerM;4F;39| ((|k| (F)) (|m| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 128) |k| |m| |z| (QREFELT % 76))) 

(SDEFUN |FSPECF;eWhittakerM| ((|k| (F)) (|m| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 128) (LIST |k| |m| |z|) (QREFELT % 111))) 

(SDEFUN |FSPECF;elWhittakerM| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eWhittakerM| (SPADCALL |l| 1 (QREFELT % 107))
         (SPADCALL |l| 2 (QREFELT % 107)) (SPADCALL |l| 3 (QREFELT % 107)) %)) 

(SDEFUN |FSPECF;eWhittakerMGrad_z| ((|k| (F)) (|m| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL (QREFELT % 99) (SPADCALL |k| |z| (QREFELT % 121))
                    (QREFELT % 120))
          (SPADCALL |k| |m| |z| (QREFELT % 129)) (QREFELT % 112))
         (SPADCALL
          (SPADCALL
           (SPADCALL (SPADCALL (QREFELT % 99) |k| (QREFELT % 113)) |m|
                     (QREFELT % 113))
           (SPADCALL (SPADCALL |k| (|spadConstant| % 86) (QREFELT % 113)) |m|
                     |z| (QREFELT % 129))
           (QREFELT % 112))
          |z| (QREFELT % 121))
         (QREFELT % 113))) 

(SDEFUN |FSPECF;dWhittakerM| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad3| |l| |t| (QREFELT % 128)
         (CONS (|function| |FSPECF;eWhittakerMGrad_z|) %) %)) 

(SDEFUN |FSPECF;whittakerW;4F;44| ((|k| (F)) (|m| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 132) |k| |m| |z| (QREFELT % 76))) 

(SDEFUN |FSPECF;eWhittakerW| ((|k| (F)) (|m| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 132) (LIST |k| |m| |z|) (QREFELT % 111))) 

(SDEFUN |FSPECF;elWhittakerW| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eWhittakerW| (SPADCALL |l| 1 (QREFELT % 107))
         (SPADCALL |l| 2 (QREFELT % 107)) (SPADCALL |l| 3 (QREFELT % 107)) %)) 

(SDEFUN |FSPECF;eWhittakerWGrad_z| ((|k| (F)) (|m| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL (QREFELT % 99) (SPADCALL |k| |z| (QREFELT % 121))
                    (QREFELT % 120))
          (SPADCALL |k| |m| |z| (QREFELT % 133)) (QREFELT % 112))
         (SPADCALL
          (SPADCALL (SPADCALL |k| (|spadConstant| % 86) (QREFELT % 113)) |m|
                    |z| (QREFELT % 133))
          |z| (QREFELT % 121))
         (QREFELT % 120))) 

(SDEFUN |FSPECF;dWhittakerW| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad3| |l| |t| (QREFELT % 132)
         (CONS (|function| |FSPECF;eWhittakerWGrad_z|) %) %)) 

(SDEFUN |FSPECF;angerJ;3F;49| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 134) |v| |z| (QREFELT % 61))) 

(SDEFUN |FSPECF;eAngerJ| ((|v| (F)) (|z| (F)) (% (F)))
        (COND
         ((SPADCALL |z| (|spadConstant| % 82) (QREFELT % 84))
          (SPADCALL
           (SPADCALL (SPADCALL |v| (SPADCALL (QREFELT % 136)) (QREFELT % 112))
                     (QREFELT % 137))
           (SPADCALL |v| (SPADCALL (QREFELT % 136)) (QREFELT % 112))
           (QREFELT % 121)))
         ('T (SPADCALL (QREFELT % 134) (LIST |v| |z|) (QREFELT % 111))))) 

(SDEFUN |FSPECF;elAngerJ| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eAngerJ| (SPADCALL |l| 1 (QREFELT % 107))
         (SPADCALL |l| 2 (QREFELT % 107)) %)) 

(SDEFUN |FSPECF;eAngerJGrad_z| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL (SPADCALL |v| (|spadConstant| % 86) (QREFELT % 113)) |z|
                     (QREFELT % 135))
           (QREFELT % 122))
          (SPADCALL
           (SPADCALL |v| (SPADCALL |v| |z| (QREFELT % 135)) (QREFELT % 112))
           |z| (QREFELT % 121))
          (QREFELT % 113))
         (SPADCALL
          (SPADCALL (SPADCALL |v| (SPADCALL (QREFELT % 136)) (QREFELT % 112))
                    (QREFELT % 137))
          (SPADCALL (SPADCALL (QREFELT % 136)) |z| (QREFELT % 112))
          (QREFELT % 121))
         (QREFELT % 120))) 

(SDEFUN |FSPECF;dAngerJ| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad2| |l| |t| (QREFELT % 134)
         (CONS (|function| |FSPECF;eAngerJGrad_z|) %) %)) 

(SDEFUN |FSPECF;eeAngerJ| ((|l| (|List| F)) (% (F)))
        (SPADCALL (QREFELT % 134) |l| (QREFELT % 111))) 

(SDEFUN |FSPECF;weberE;3F;55| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 138) |v| |z| (QREFELT % 61))) 

(SDEFUN |FSPECF;eWeberE| ((|v| (F)) (|z| (F)) (% (F)))
        (COND
         ((SPADCALL |z| (|spadConstant| % 82) (QREFELT % 84))
          (SPADCALL
           (SPADCALL 2
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL (QREFELT % 99) |v| (QREFELT % 112))
                                 (SPADCALL (QREFELT % 136)) (QREFELT % 112))
                       (QREFELT % 137))
                      2 (QREFELT % 140))
                     (QREFELT % 104))
           (SPADCALL |v| (SPADCALL (QREFELT % 136)) (QREFELT % 112))
           (QREFELT % 121)))
         ('T (SPADCALL (QREFELT % 138) (LIST |v| |z|) (QREFELT % 111))))) 

(SDEFUN |FSPECF;elWeberE| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eWeberE| (SPADCALL |l| 1 (QREFELT % 107))
         (SPADCALL |l| 2 (QREFELT % 107)) %)) 

(SDEFUN |FSPECF;eWeberEGrad_z| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL (SPADCALL |v| (|spadConstant| % 86) (QREFELT % 113)) |z|
                     (QREFELT % 139))
           (QREFELT % 122))
          (SPADCALL
           (SPADCALL |v| (SPADCALL |v| |z| (QREFELT % 139)) (QREFELT % 112))
           |z| (QREFELT % 121))
          (QREFELT % 113))
         (SPADCALL
          (SPADCALL (|spadConstant| % 86)
                    (SPADCALL
                     (SPADCALL |v| (SPADCALL (QREFELT % 136)) (QREFELT % 112))
                     (QREFELT % 141))
                    (QREFELT % 120))
          (SPADCALL (SPADCALL (QREFELT % 136)) |z| (QREFELT % 112))
          (QREFELT % 121))
         (QREFELT % 120))) 

(SDEFUN |FSPECF;dWeberE| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad2| |l| |t| (QREFELT % 138)
         (CONS (|function| |FSPECF;eWeberEGrad_z|) %) %)) 

(SDEFUN |FSPECF;eeWeberE| ((|l| (|List| F)) (% (F)))
        (SPADCALL (QREFELT % 138) |l| (QREFELT % 111))) 

(SDEFUN |FSPECF;struveH;3F;61| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 142) |v| |z| (QREFELT % 61))) 

(SDEFUN |FSPECF;eStruveH| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 142) (LIST |v| |z|) (QREFELT % 111))) 

(SDEFUN |FSPECF;elStruveH| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eStruveH| (SPADCALL |l| 1 (QREFELT % 107))
         (SPADCALL |l| 2 (QREFELT % 107)) %)) 

(SDEFUN |FSPECF;eStruveHGrad_z| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL (SPADCALL |v| (|spadConstant| % 86) (QREFELT % 113)) |z|
                     (QREFELT % 143))
           (QREFELT % 122))
          (SPADCALL
           (SPADCALL |v| (SPADCALL |v| |z| (QREFELT % 143)) (QREFELT % 112))
           |z| (QREFELT % 121))
          (QREFELT % 113))
         (SPADCALL
          (SPADCALL (SPADCALL (QREFELT % 99) |z| (QREFELT % 112)) |v|
                    (QREFELT % 144))
          (SPADCALL (SPADCALL (SPADCALL (QREFELT % 136)) (QREFELT % 125))
                    (SPADCALL (SPADCALL |v| (QREFELT % 106) (QREFELT % 113))
                              (QREFELT % 60))
                    (QREFELT % 112))
          (QREFELT % 121))
         (QREFELT % 113))) 

(SDEFUN |FSPECF;dStruveH| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad2| |l| |t| (QREFELT % 142)
         (CONS (|function| |FSPECF;eStruveHGrad_z|) %) %)) 

(SDEFUN |FSPECF;struveL;3F;66| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 145) |v| |z| (QREFELT % 61))) 

(SDEFUN |FSPECF;eStruveL| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 145) (LIST |v| |z|) (QREFELT % 111))) 

(SDEFUN |FSPECF;elStruveL| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eStruveL| (SPADCALL |l| 1 (QREFELT % 107))
         (SPADCALL |l| 2 (QREFELT % 107)) %)) 

(SDEFUN |FSPECF;eStruveLGrad_z| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL (SPADCALL |v| (|spadConstant| % 86) (QREFELT % 113)) |z|
                    (QREFELT % 146))
          (SPADCALL
           (SPADCALL |v| (SPADCALL |v| |z| (QREFELT % 146)) (QREFELT % 112))
           |z| (QREFELT % 121))
          (QREFELT % 113))
         (SPADCALL
          (SPADCALL (SPADCALL (QREFELT % 99) |z| (QREFELT % 112)) |v|
                    (QREFELT % 144))
          (SPADCALL (SPADCALL (SPADCALL (QREFELT % 136)) (QREFELT % 125))
                    (SPADCALL (SPADCALL |v| (QREFELT % 106) (QREFELT % 113))
                              (QREFELT % 60))
                    (QREFELT % 112))
          (QREFELT % 121))
         (QREFELT % 113))) 

(SDEFUN |FSPECF;dStruveL| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad2| |l| |t| (QREFELT % 145)
         (CONS (|function| |FSPECF;eStruveLGrad_z|) %) %)) 

(SDEFUN |FSPECF;hankelH1;3F;71| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 147) |v| |z| (QREFELT % 61))) 

(SDEFUN |FSPECF;eHankelH1| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 147) (LIST |v| |z|) (QREFELT % 111))) 

(SDEFUN |FSPECF;elHankelH1| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eHankelH1| (SPADCALL |l| 1 (QREFELT % 107))
         (SPADCALL |l| 2 (QREFELT % 107)) %)) 

(SDEFUN |FSPECF;eHankelH1Grad_z| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL (SPADCALL |v| (|spadConstant| % 86) (QREFELT % 113)) |z|
                    (QREFELT % 148))
          (QREFELT % 122))
         (SPADCALL
          (SPADCALL |v| (SPADCALL |v| |z| (QREFELT % 148)) (QREFELT % 112)) |z|
          (QREFELT % 121))
         (QREFELT % 113))) 

(SDEFUN |FSPECF;dHankelH1| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad2| |l| |t| (QREFELT % 147)
         (CONS (|function| |FSPECF;eHankelH1Grad_z|) %) %)) 

(SDEFUN |FSPECF;hankelH2;3F;76| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 149) |v| |z| (QREFELT % 61))) 

(SDEFUN |FSPECF;eHankelH2| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 149) (LIST |v| |z|) (QREFELT % 111))) 

(SDEFUN |FSPECF;elHankelH2| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eHankelH2| (SPADCALL |l| 1 (QREFELT % 107))
         (SPADCALL |l| 2 (QREFELT % 107)) %)) 

(SDEFUN |FSPECF;eHankelH2Grad_z| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL (SPADCALL |v| (|spadConstant| % 86) (QREFELT % 113)) |z|
                    (QREFELT % 150))
          (QREFELT % 122))
         (SPADCALL
          (SPADCALL |v| (SPADCALL |v| |z| (QREFELT % 150)) (QREFELT % 112)) |z|
          (QREFELT % 121))
         (QREFELT % 113))) 

(SDEFUN |FSPECF;dHankelH2| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad2| |l| |t| (QREFELT % 149)
         (CONS (|function| |FSPECF;eHankelH2Grad_z|) %) %)) 

(SDEFUN |FSPECF;lommelS1;4F;81| ((|m| (F)) (|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 151) |m| |v| |z| (QREFELT % 76))) 

(SDEFUN |FSPECF;eLommelS1| ((|m| (F)) (|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 151) (LIST |m| |v| |z|) (QREFELT % 111))) 

(SDEFUN |FSPECF;elLommelS1| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eLommelS1| (SPADCALL |l| 1 (QREFELT % 107))
         (SPADCALL |l| 2 (QREFELT % 107)) (SPADCALL |l| 3 (QREFELT % 107)) %)) 

(SDEFUN |FSPECF;eLommelS1Grad_z| ((|m| (F)) (|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL |v| (SPADCALL |m| |v| |z| (QREFELT % 152))
                     (QREFELT % 112))
           |z| (QREFELT % 121))
          (QREFELT % 122))
         (SPADCALL
          (SPADCALL (SPADCALL |m| |v| (QREFELT % 113)) (|spadConstant| % 86)
                    (QREFELT % 120))
          (SPADCALL (SPADCALL |m| (|spadConstant| % 86) (QREFELT % 120))
                    (SPADCALL |v| (|spadConstant| % 86) (QREFELT % 120)) |z|
                    (QREFELT % 152))
          (QREFELT % 112))
         (QREFELT % 113))) 

(SDEFUN |FSPECF;dLommelS1| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad3| |l| |t| (QREFELT % 151)
         (CONS (|function| |FSPECF;eLommelS1Grad_z|) %) %)) 

(SDEFUN |FSPECF;lommelS2;4F;86| ((|mu| (F)) (|nu| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 153) |mu| |nu| |z| (QREFELT % 76))) 

(SDEFUN |FSPECF;eLommelS2| ((|mu| (F)) (|nu| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 153) (LIST |mu| |nu| |z|) (QREFELT % 111))) 

(SDEFUN |FSPECF;elLommelS2| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eLommelS2| (SPADCALL |l| 1 (QREFELT % 107))
         (SPADCALL |l| 2 (QREFELT % 107)) (SPADCALL |l| 3 (QREFELT % 107)) %)) 

(SDEFUN |FSPECF;eLommelS2Grad_z| ((|m| (F)) (|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL |v| (SPADCALL |m| |v| |z| (QREFELT % 154))
                     (QREFELT % 112))
           |z| (QREFELT % 121))
          (QREFELT % 122))
         (SPADCALL
          (SPADCALL (SPADCALL |m| |v| (QREFELT % 113)) (|spadConstant| % 86)
                    (QREFELT % 120))
          (SPADCALL (SPADCALL |m| (|spadConstant| % 86) (QREFELT % 120))
                    (SPADCALL |v| (|spadConstant| % 86) (QREFELT % 120)) |z|
                    (QREFELT % 154))
          (QREFELT % 112))
         (QREFELT % 113))) 

(SDEFUN |FSPECF;dLommelS2| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad3| |l| |t| (QREFELT % 153)
         (CONS (|function| |FSPECF;eLommelS2Grad_z|) %) %)) 

(SDEFUN |FSPECF;kummerM;4F;91| ((|mu| (F)) (|nu| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 155) |mu| |nu| |z| (QREFELT % 76))) 

(SDEFUN |FSPECF;eKummerM| ((|a| (F)) (|b| (F)) (|z| (F)) (% (F)))
        (COND
         ((SPADCALL |z| (|spadConstant| % 82) (QREFELT % 84))
          (|spadConstant| % 86))
         ('T (SPADCALL (QREFELT % 155) (LIST |a| |b| |z|) (QREFELT % 111))))) 

(SDEFUN |FSPECF;elKummerM| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eKummerM| (SPADCALL |l| 1 (QREFELT % 107))
         (SPADCALL |l| 2 (QREFELT % 107)) (SPADCALL |l| 3 (QREFELT % 107)) %)) 

(SDEFUN |FSPECF;eKummerMGrad_z| ((|a| (F)) (|b| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL (SPADCALL |z| |a| (QREFELT % 113)) |b| (QREFELT % 120))
           (SPADCALL |a| |b| |z| (QREFELT % 156)) (QREFELT % 112))
          (SPADCALL (SPADCALL |b| |a| (QREFELT % 120))
                    (SPADCALL
                     (SPADCALL |a| (|spadConstant| % 86) (QREFELT % 120)) |b|
                     |z| (QREFELT % 156))
                    (QREFELT % 112))
          (QREFELT % 113))
         |z| (QREFELT % 121))) 

(SDEFUN |FSPECF;dKummerM| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad3| |l| |t| (QREFELT % 155)
         (CONS (|function| |FSPECF;eKummerMGrad_z|) %) %)) 

(SDEFUN |FSPECF;kummerU;4F;96| ((|a| (F)) (|b| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 157) |a| |b| |z| (QREFELT % 76))) 

(SDEFUN |FSPECF;eKummerU| ((|a| (F)) (|b| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 157) (LIST |a| |b| |z|) (QREFELT % 111))) 

(SDEFUN |FSPECF;elKummerU| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eKummerU| (SPADCALL |l| 1 (QREFELT % 107))
         (SPADCALL |l| 2 (QREFELT % 107)) (SPADCALL |l| 3 (QREFELT % 107)) %)) 

(SDEFUN |FSPECF;eKummerUGrad_z| ((|a| (F)) (|b| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL (SPADCALL |z| |a| (QREFELT % 113)) |b| (QREFELT % 120))
           (SPADCALL |a| |b| |z| (QREFELT % 158)) (QREFELT % 112))
          (SPADCALL (SPADCALL |a| (|spadConstant| % 86) (QREFELT % 120)) |b|
                    |z| (QREFELT % 158))
          (QREFELT % 120))
         |z| (QREFELT % 121))) 

(SDEFUN |FSPECF;dKummerU| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad3| |l| |t| (QREFELT % 157)
         (CONS (|function| |FSPECF;eKummerUGrad_z|) %) %)) 

(SDEFUN |FSPECF;legendreP;4F;101| ((|nu| (F)) (|mu| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 159) |nu| |mu| |z| (QREFELT % 76))) 

(SDEFUN |FSPECF;eLegendreP| ((|nu| (F)) (|mu| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 159) (LIST |nu| |mu| |z|) (QREFELT % 111))) 

(SDEFUN |FSPECF;elLegendreP| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eLegendreP| (SPADCALL |l| 1 (QREFELT % 107))
         (SPADCALL |l| 2 (QREFELT % 107)) (SPADCALL |l| 3 (QREFELT % 107)) %)) 

(SDEFUN |FSPECF;eLegendrePGrad_z| ((|nu| (F)) (|mu| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL (SPADCALL |nu| |mu| (QREFELT % 120)) (|spadConstant| % 86)
                    (QREFELT % 113))
          (SPADCALL (SPADCALL |nu| (|spadConstant| % 86) (QREFELT % 113)) |mu|
                    |z| (QREFELT % 160))
          (QREFELT % 112))
         (SPADCALL
          (SPADCALL (SPADCALL |nu| (|spadConstant| % 86) (QREFELT % 113)) |z|
                    (QREFELT % 112))
          (SPADCALL |nu| |mu| |z| (QREFELT % 160)) (QREFELT % 112))
         (QREFELT % 120))) 

(SDEFUN |FSPECF;dLegendreP| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad3| |l| |t| (QREFELT % 159)
         (CONS (|function| |FSPECF;eLegendrePGrad_z|) %) %)) 

(SDEFUN |FSPECF;legendreQ;4F;106| ((|nu| (F)) (|mu| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 161) |nu| |mu| |z| (QREFELT % 76))) 

(SDEFUN |FSPECF;eLegendreQ| ((|nu| (F)) (|mu| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 161) (LIST |nu| |mu| |z|) (QREFELT % 111))) 

(SDEFUN |FSPECF;elLegendreQ| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eLegendreQ| (SPADCALL |l| 1 (QREFELT % 107))
         (SPADCALL |l| 2 (QREFELT % 107)) (SPADCALL |l| 3 (QREFELT % 107)) %)) 

(SDEFUN |FSPECF;eLegendreQGrad_z| ((|nu| (F)) (|mu| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL (SPADCALL |nu| |mu| (QREFELT % 120)) (|spadConstant| % 86)
                    (QREFELT % 113))
          (SPADCALL (SPADCALL |nu| (|spadConstant| % 86) (QREFELT % 113)) |mu|
                    |z| (QREFELT % 162))
          (QREFELT % 112))
         (SPADCALL
          (SPADCALL (SPADCALL |nu| (|spadConstant| % 86) (QREFELT % 113)) |z|
                    (QREFELT % 112))
          (SPADCALL |nu| |mu| |z| (QREFELT % 162)) (QREFELT % 112))
         (QREFELT % 120))) 

(SDEFUN |FSPECF;dLegendreQ| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad3| |l| |t| (QREFELT % 161)
         (CONS (|function| |FSPECF;eLegendreQGrad_z|) %) %)) 

(SDEFUN |FSPECF;kelvinBei;3F;111| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 163) |v| |z| (QREFELT % 61))) 

(SDEFUN |FSPECF;eKelvinBei| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 163) (LIST |v| |z|) (QREFELT % 111))) 

(SDEFUN |FSPECF;elKelvinBei| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eKelvinBei| (SPADCALL |l| 1 (QREFELT % 107))
         (SPADCALL |l| 2 (QREFELT % 107)) %)) 

(SDEFUN |FSPECF;eKelvinBeiGrad_z| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL (QREFELT % 99)
                    (SPADCALL (SPADCALL 2 (QREFELT % 88)) (QREFELT % 125))
                    (QREFELT % 112))
          (SPADCALL
           (SPADCALL (SPADCALL |v| (|spadConstant| % 86) (QREFELT % 113)) |z|
                     (QREFELT % 164))
           (SPADCALL (SPADCALL |v| (|spadConstant| % 86) (QREFELT % 113)) |z|
                     (QREFELT % 165))
           (QREFELT % 120))
          (QREFELT % 112))
         (SPADCALL
          (SPADCALL |v| (SPADCALL |v| |z| (QREFELT % 164)) (QREFELT % 112)) |z|
          (QREFELT % 121))
         (QREFELT % 113))) 

(SDEFUN |FSPECF;dKelvinBei| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad2| |l| |t| (QREFELT % 163)
         (CONS (|function| |FSPECF;eKelvinBeiGrad_z|) %) %)) 

(SDEFUN |FSPECF;kelvinBer;3F;116| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 166) |v| |z| (QREFELT % 61))) 

(SDEFUN |FSPECF;eKelvinBer| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 166) (LIST |v| |z|) (QREFELT % 111))) 

(SDEFUN |FSPECF;elKelvinBer| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eKelvinBer| (SPADCALL |l| 1 (QREFELT % 107))
         (SPADCALL |l| 2 (QREFELT % 107)) %)) 

(SDEFUN |FSPECF;eKelvinBerGrad_z| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL (QREFELT % 99)
                    (SPADCALL (SPADCALL 2 (QREFELT % 88)) (QREFELT % 125))
                    (QREFELT % 112))
          (SPADCALL
           (SPADCALL (SPADCALL |v| (|spadConstant| % 86) (QREFELT % 113)) |z|
                     (QREFELT % 165))
           (SPADCALL (SPADCALL |v| (|spadConstant| % 86) (QREFELT % 113)) |z|
                     (QREFELT % 164))
           (QREFELT % 113))
          (QREFELT % 112))
         (SPADCALL
          (SPADCALL |v| (SPADCALL |v| |z| (QREFELT % 165)) (QREFELT % 112)) |z|
          (QREFELT % 121))
         (QREFELT % 113))) 

(SDEFUN |FSPECF;dKelvinBer| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad2| |l| |t| (QREFELT % 166)
         (CONS (|function| |FSPECF;eKelvinBerGrad_z|) %) %)) 

(SDEFUN |FSPECF;kelvinKei;3F;121| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 167) |v| |z| (QREFELT % 61))) 

(SDEFUN |FSPECF;eKelvinKei| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 167) (LIST |v| |z|) (QREFELT % 111))) 

(SDEFUN |FSPECF;elKelvinKei| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eKelvinKei| (SPADCALL |l| 1 (QREFELT % 107))
         (SPADCALL |l| 2 (QREFELT % 107)) %)) 

(SDEFUN |FSPECF;eKelvinKeiGrad_z| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL (QREFELT % 99)
                    (SPADCALL (SPADCALL 2 (QREFELT % 88)) (QREFELT % 125))
                    (QREFELT % 112))
          (SPADCALL
           (SPADCALL (SPADCALL |v| (|spadConstant| % 86) (QREFELT % 113)) |z|
                     (QREFELT % 168))
           (SPADCALL (SPADCALL |v| (|spadConstant| % 86) (QREFELT % 113)) |z|
                     (QREFELT % 169))
           (QREFELT % 120))
          (QREFELT % 112))
         (SPADCALL
          (SPADCALL |v| (SPADCALL |v| |z| (QREFELT % 168)) (QREFELT % 112)) |z|
          (QREFELT % 121))
         (QREFELT % 113))) 

(SDEFUN |FSPECF;dKelvinKei| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad2| |l| |t| (QREFELT % 167)
         (CONS (|function| |FSPECF;eKelvinKeiGrad_z|) %) %)) 

(SDEFUN |FSPECF;kelvinKer;3F;126| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 170) |v| |z| (QREFELT % 61))) 

(SDEFUN |FSPECF;eKelvinKer| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 170) (LIST |v| |z|) (QREFELT % 111))) 

(SDEFUN |FSPECF;elKelvinKer| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eKelvinKer| (SPADCALL |l| 1 (QREFELT % 107))
         (SPADCALL |l| 2 (QREFELT % 107)) %)) 

(SDEFUN |FSPECF;eKelvinKerGrad_z| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL (QREFELT % 99)
                    (SPADCALL (SPADCALL 2 (QREFELT % 88)) (QREFELT % 125))
                    (QREFELT % 112))
          (SPADCALL
           (SPADCALL (SPADCALL |v| (|spadConstant| % 86) (QREFELT % 113)) |z|
                     (QREFELT % 169))
           (SPADCALL (SPADCALL |v| (|spadConstant| % 86) (QREFELT % 113)) |z|
                     (QREFELT % 168))
           (QREFELT % 113))
          (QREFELT % 112))
         (SPADCALL
          (SPADCALL |v| (SPADCALL |v| |z| (QREFELT % 169)) (QREFELT % 112)) |z|
          (QREFELT % 121))
         (QREFELT % 113))) 

(SDEFUN |FSPECF;dKelvinKer| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad2| |l| |t| (QREFELT % 170)
         (CONS (|function| |FSPECF;eKelvinKerGrad_z|) %) %)) 

(SDEFUN |FSPECF;ellipticK;2F;131| ((|m| (F)) (% (F)))
        (SPADCALL (QREFELT % 171) |m| (QREFELT % 51))) 

(SDEFUN |FSPECF;eEllipticK| ((|m| (F)) (% (F)))
        (SPADCALL (QREFELT % 171) (LIST |m|) (QREFELT % 111))) 

(SDEFUN |FSPECF;elEllipticK| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eEllipticK| (SPADCALL |l| 1 (QREFELT % 107)) %)) 

(SDEFUN |FSPECF;dEllipticK| ((|m| (F)) (% (F)))
        (SPADCALL
         (SPADCALL (QREFELT % 99)
                   (SPADCALL (SPADCALL |m| (QREFELT % 173))
                             (SPADCALL
                              (SPADCALL (|spadConstant| % 86) |m|
                                        (QREFELT % 120))
                              (SPADCALL |m| (QREFELT % 172)) (QREFELT % 112))
                             (QREFELT % 120))
                   (QREFELT % 112))
         (SPADCALL |m| (SPADCALL (|spadConstant| % 86) |m| (QREFELT % 120))
                   (QREFELT % 112))
         (QREFELT % 121))) 

(SDEFUN |FSPECF;ellipticE;2F;135| ((|m| (F)) (% (F)))
        (SPADCALL (QREFELT % 178) |m| (QREFELT % 51))) 

(SDEFUN |FSPECF;eEllipticE| ((|m| (F)) (% (F)))
        (SPADCALL (QREFELT % 178) (LIST |m|) (QREFELT % 111))) 

(SDEFUN |FSPECF;elEllipticE| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eEllipticE| (SPADCALL |l| 1 (QREFELT % 107)) %)) 

(SDEFUN |FSPECF;dEllipticE| ((|m| (F)) (% (F)))
        (SPADCALL
         (SPADCALL (QREFELT % 99)
                   (SPADCALL (SPADCALL |m| (QREFELT % 173))
                             (SPADCALL |m| (QREFELT % 172)) (QREFELT % 120))
                   (QREFELT % 112))
         |m| (QREFELT % 121))) 

(SDEFUN |FSPECF;ellipticE;3F;139| ((|z| (F)) (|m| (F)) (% (F)))
        (SPADCALL (QREFELT % 179) |z| |m| (QREFELT % 61))) 

(SDEFUN |FSPECF;eEllipticE2| ((|z| (F)) (|m| (F)) (% (F)))
        (COND
         ((SPADCALL |z| (|spadConstant| % 82) (QREFELT % 84))
          (|spadConstant| % 82))
         ((SPADCALL |z| (|spadConstant| % 86) (QREFELT % 84))
          (|FSPECF;eEllipticE| |m| %))
         ('T (SPADCALL (QREFELT % 179) (LIST |z| |m|) (QREFELT % 111))))) 

(SDEFUN |FSPECF;elEllipticE2| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eEllipticE2| (SPADCALL |l| 1 (QREFELT % 107))
         (SPADCALL |l| 2 (QREFELT % 107)) %)) 

(SDEFUN |FSPECF;eEllipticE2Grad_z| ((|l| (|List| F)) (% (F)))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ (LETT |z| (SPADCALL |l| 1 (QREFELT % 107)))
                    (LETT |m| (SPADCALL |l| 2 (QREFELT % 107)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (|spadConstant| % 86)
                                 (SPADCALL |m| (SPADCALL |z| 2 (QREFELT % 119))
                                           (QREFELT % 112))
                                 (QREFELT % 120))
                       (QREFELT % 125))
                      (SPADCALL
                       (SPADCALL (|spadConstant| % 86)
                                 (SPADCALL |z| 2 (QREFELT % 119))
                                 (QREFELT % 120))
                       (QREFELT % 125))
                      (QREFELT % 121)))))) 

(SDEFUN |FSPECF;eEllipticE2Grad_m| ((|l| (|List| F)) (% (F)))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ (LETT |z| (SPADCALL |l| 1 (QREFELT % 107)))
                    (LETT |m| (SPADCALL |l| 2 (QREFELT % 107)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL (QREFELT % 99)
                                (SPADCALL (SPADCALL |z| |m| (QREFELT % 180))
                                          (SPADCALL |z| |m| (QREFELT % 181))
                                          (QREFELT % 120))
                                (QREFELT % 112))
                      |m| (QREFELT % 121)))))) 

(SDEFUN |FSPECF;inEllipticE2| ((|li| (|List| (|InputForm|))) (% (|InputForm|)))
        (SPADCALL (CONS (SPADCALL '|ellipticE| (QREFELT % 183)) |li|)
                  (QREFELT % 184))) 

(SDEFUN |FSPECF;ellipticF;3F;145| ((|z| (F)) (|m| (F)) (% (F)))
        (SPADCALL (QREFELT % 187) |z| |m| (QREFELT % 61))) 

(SDEFUN |FSPECF;eEllipticF| ((|z| (F)) (|m| (F)) (% (F)))
        (COND
         ((SPADCALL |z| (|spadConstant| % 82) (QREFELT % 84))
          (|spadConstant| % 82))
         ((SPADCALL |z| (|spadConstant| % 86) (QREFELT % 84))
          (SPADCALL |m| (QREFELT % 172)))
         ('T (SPADCALL (QREFELT % 187) (LIST |z| |m|) (QREFELT % 111))))) 

(SDEFUN |FSPECF;elEllipticF| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eEllipticF| (SPADCALL |l| 1 (QREFELT % 107))
         (SPADCALL |l| 2 (QREFELT % 107)) %)) 

(SDEFUN |FSPECF;eEllipticFGrad_z| ((|l| (|List| F)) (% (F)))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ (LETT |z| (SPADCALL |l| 1 (QREFELT % 107)))
                    (LETT |m| (SPADCALL |l| 2 (QREFELT % 107)))
                    (EXIT
                     (SPADCALL (|spadConstant| % 86)
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (|spadConstant| % 86)
                                           (SPADCALL |m|
                                                     (SPADCALL |z| 2
                                                               (QREFELT % 119))
                                                     (QREFELT % 112))
                                           (QREFELT % 120))
                                 (QREFELT % 125))
                                (SPADCALL
                                 (SPADCALL (|spadConstant| % 86)
                                           (SPADCALL |z| 2 (QREFELT % 119))
                                           (QREFELT % 120))
                                 (QREFELT % 125))
                                (QREFELT % 112))
                               (QREFELT % 121)))))) 

(SDEFUN |FSPECF;eEllipticFGrad_m| ((|l| (|List| F)) (% (F)))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ (LETT |z| (SPADCALL |l| 1 (QREFELT % 107)))
                    (LETT |m| (SPADCALL |l| 2 (QREFELT % 107)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL (QREFELT % 99)
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |z| |m| (QREFELT % 180))
                                            (SPADCALL
                                             (SPADCALL (|spadConstant| % 86)
                                                       |m| (QREFELT % 120))
                                             (SPADCALL |z| |m| (QREFELT % 181))
                                             (QREFELT % 112))
                                            (QREFELT % 120))
                                  |m| (QREFELT % 121))
                                 (SPADCALL
                                  (SPADCALL |z|
                                            (SPADCALL
                                             (SPADCALL (|spadConstant| % 86)
                                                       (SPADCALL |z| 2
                                                                 (QREFELT %
                                                                          119))
                                                       (QREFELT % 120))
                                             (QREFELT % 125))
                                            (QREFELT % 112))
                                  (SPADCALL
                                   (SPADCALL (|spadConstant| % 86)
                                             (SPADCALL |m|
                                                       (SPADCALL |z| 2
                                                                 (QREFELT %
                                                                          119))
                                                       (QREFELT % 112))
                                             (QREFELT % 120))
                                   (QREFELT % 125))
                                  (QREFELT % 121))
                                 (QREFELT % 120))
                                (QREFELT % 112))
                      (SPADCALL (|spadConstant| % 86) |m| (QREFELT % 120))
                      (QREFELT % 121)))))) 

(SDEFUN |FSPECF;ellipticPi;4F;150| ((|z| (F)) (|n| (F)) (|m| (F)) (% (F)))
        (SPADCALL (QREFELT % 188) |z| |n| |m| (QREFELT % 76))) 

(SDEFUN |FSPECF;eEllipticPi| ((|z| (F)) (|n| (F)) (|m| (F)) (% (F)))
        (COND
         ((SPADCALL |z| (|spadConstant| % 82) (QREFELT % 84))
          (|spadConstant| % 82))
         ('T (SPADCALL (QREFELT % 188) (LIST |z| |n| |m|) (QREFELT % 111))))) 

(SDEFUN |FSPECF;elEllipticPi| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eEllipticPi| (SPADCALL |l| 1 (QREFELT % 107))
         (SPADCALL |l| 2 (QREFELT % 107)) (SPADCALL |l| 3 (QREFELT % 107)) %)) 

(SDEFUN |FSPECF;eEllipticPiGrad_z| ((|l| (|List| F)) (% (F)))
        (SPROG ((|m| (F)) (|n| (F)) (|z| (F)))
               (SEQ (LETT |z| (SPADCALL |l| 1 (QREFELT % 107)))
                    (LETT |n| (SPADCALL |l| 2 (QREFELT % 107)))
                    (LETT |m| (SPADCALL |l| 3 (QREFELT % 107)))
                    (EXIT
                     (SPADCALL (|spadConstant| % 86)
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (|spadConstant| % 86)
                                           (SPADCALL |n|
                                                     (SPADCALL |z| 2
                                                               (QREFELT % 119))
                                                     (QREFELT % 112))
                                           (QREFELT % 120))
                                 (SPADCALL
                                  (SPADCALL (|spadConstant| % 86)
                                            (SPADCALL |m|
                                                      (SPADCALL |z| 2
                                                                (QREFELT %
                                                                         119))
                                                      (QREFELT % 112))
                                            (QREFELT % 120))
                                  (QREFELT % 125))
                                 (QREFELT % 112))
                                (SPADCALL
                                 (SPADCALL (|spadConstant| % 86)
                                           (SPADCALL |z| 2 (QREFELT % 119))
                                           (QREFELT % 120))
                                 (QREFELT % 125))
                                (QREFELT % 112))
                               (QREFELT % 121)))))) 

(SDEFUN |FSPECF;eEllipticPiGrad_n| ((|l| (|List| F)) (% (F)))
        (SPROG
         ((|t4| (F)) (|t3| (F)) (|t2| (F)) (|t1| (F)) (|m| (F)) (|n| (F))
          (|z| (F)))
         (SEQ (LETT |z| (SPADCALL |l| 1 (QREFELT % 107)))
              (LETT |n| (SPADCALL |l| 2 (QREFELT % 107)))
              (LETT |m| (SPADCALL |l| 3 (QREFELT % 107)))
              (LETT |t1|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL |n| 2 (QREFELT % 119)) |m|
                                 (QREFELT % 120))
                       (SPADCALL |z| |n| |m| (QREFELT % 189)) (QREFELT % 112))
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL |n| (|spadConstant| % 86) (QREFELT % 120))
                        (SPADCALL |n| |m| (QREFELT % 120)) (QREFELT % 112))
                       |n| (QREFELT % 112))
                      (QREFELT % 121))
                     (QREFELT % 122)))
              (LETT |t2|
                    (SPADCALL (SPADCALL |z| |m| (QREFELT % 181))
                              (SPADCALL
                               (SPADCALL |n| (|spadConstant| % 86)
                                         (QREFELT % 120))
                               |n| (QREFELT % 112))
                              (QREFELT % 121)))
              (LETT |t3|
                    (SPADCALL
                     (SPADCALL (SPADCALL |z| |m| (QREFELT % 180))
                               (SPADCALL
                                (SPADCALL |n| (|spadConstant| % 86)
                                          (QREFELT % 120))
                                (SPADCALL |n| |m| (QREFELT % 120))
                                (QREFELT % 112))
                               (QREFELT % 121))
                     (QREFELT % 122)))
              (LETT |t4|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (SPADCALL |n| |z| (QREFELT % 112))
                                (SPADCALL
                                 (SPADCALL (|spadConstant| % 86)
                                           (SPADCALL |m|
                                                     (SPADCALL |z| 2
                                                               (QREFELT % 119))
                                                     (QREFELT % 112))
                                           (QREFELT % 120))
                                 (QREFELT % 125))
                                (QREFELT % 112))
                      (SPADCALL
                       (SPADCALL (|spadConstant| % 86)
                                 (SPADCALL |z| 2 (QREFELT % 119))
                                 (QREFELT % 120))
                       (QREFELT % 125))
                      (QREFELT % 112))
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (|spadConstant| % 86)
                                 (SPADCALL |n| (SPADCALL |z| 2 (QREFELT % 119))
                                           (QREFELT % 112))
                                 (QREFELT % 120))
                       (SPADCALL |n| (|spadConstant| % 86) (QREFELT % 120))
                       (QREFELT % 112))
                      (SPADCALL |n| |m| (QREFELT % 120)) (QREFELT % 112))
                     (QREFELT % 121)))
              (EXIT
               (SPADCALL (QREFELT % 99)
                         (SPADCALL
                          (SPADCALL (SPADCALL |t1| |t2| (QREFELT % 113)) |t3|
                                    (QREFELT % 113))
                          |t4| (QREFELT % 113))
                         (QREFELT % 112)))))) 

(SDEFUN |FSPECF;eEllipticPiGrad_m| ((|l| (|List| F)) (% (F)))
        (SPROG ((|t2| (F)) (|t1| (F)) (|m| (F)) (|n| (F)) (|z| (F)))
               (SEQ (LETT |z| (SPADCALL |l| 1 (QREFELT % 107)))
                    (LETT |n| (SPADCALL |l| 2 (QREFELT % 107)))
                    (LETT |m| (SPADCALL |l| 3 (QREFELT % 107)))
                    (LETT |t1|
                          (SPADCALL
                           (SPADCALL (SPADCALL |m| |z| (QREFELT % 112))
                                     (SPADCALL
                                      (SPADCALL (|spadConstant| % 86)
                                                (SPADCALL |z| 2
                                                          (QREFELT % 119))
                                                (QREFELT % 120))
                                      (QREFELT % 125))
                                     (QREFELT % 112))
                           (SPADCALL
                            (SPADCALL (|spadConstant| % 86)
                                      (SPADCALL |m|
                                                (SPADCALL |z| 2
                                                          (QREFELT % 119))
                                                (QREFELT % 112))
                                      (QREFELT % 120))
                            (QREFELT % 125))
                           (QREFELT % 121)))
                    (LETT |t2|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL |z| |m| (QREFELT % 180))
                                      (QREFELT % 122))
                            |t1| (QREFELT % 113))
                           (SPADCALL (|spadConstant| % 86) |m| (QREFELT % 120))
                           (QREFELT % 121)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL (QREFELT % 99)
                                (SPADCALL
                                 (SPADCALL |z| |n| |m| (QREFELT % 189)) |t2|
                                 (QREFELT % 113))
                                (QREFELT % 112))
                      (SPADCALL |n| |m| (QREFELT % 120)) (QREFELT % 121)))))) 

(SDEFUN |FSPECF;jacobiSn;3F;156| ((|z| (F)) (|m| (F)) (% (F)))
        (SPADCALL (QREFELT % 190) |z| |m| (QREFELT % 61))) 

(SDEFUN |FSPECF;eJacobiSn| ((|z| (F)) (|m| (F)) (% (F)))
        (SPROG ((#1=#:G905 NIL) (|args| (|List| F)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |z| (|spadConstant| % 82) (QREFELT % 84))
                   (|spadConstant| % 82))
                  ('T
                   (SEQ
                    (COND
                     ((SPADCALL |z| (QREFELT % 187) (QREFELT % 192))
                      (SEQ
                       (LETT |args|
                             (SPADCALL (SPADCALL |z| (QREFELT % 194))
                                       (QREFELT % 196)))
                       (EXIT
                        (COND
                         ((SPADCALL |m| (SPADCALL |args| 2 (QREFELT % 107))
                                    (QREFELT % 84))
                          (PROGN
                           (LETT #1# (SPADCALL |args| 1 (QREFELT % 107)))
                           (GO #2=#:G904))))))))
                    (EXIT
                     (SPADCALL (QREFELT % 190) (LIST |z| |m|)
                               (QREFELT % 111)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |FSPECF;elJacobiSn| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eJacobiSn| (SPADCALL |l| 1 (QREFELT % 107))
         (SPADCALL |l| 2 (QREFELT % 107)) %)) 

(SDEFUN |FSPECF;jacobiGradHelper| ((|z| (F)) (|m| (F)) (% (F)))
        (SPADCALL
         (SPADCALL |z|
                   (SPADCALL
                    (SPADCALL (SPADCALL |z| |m| (QREFELT % 191)) |m|
                              (QREFELT % 180))
                    (SPADCALL (|spadConstant| % 86) |m| (QREFELT % 120))
                    (QREFELT % 121))
                   (QREFELT % 120))
         |m| (QREFELT % 121))) 

(SDEFUN |FSPECF;eJacobiSnGrad_z| ((|l| (|List| F)) (% (F)))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ (LETT |z| (SPADCALL |l| 1 (QREFELT % 107)))
                    (LETT |m| (SPADCALL |l| 2 (QREFELT % 107)))
                    (EXIT
                     (SPADCALL (SPADCALL |z| |m| (QREFELT % 197))
                               (SPADCALL |z| |m| (QREFELT % 198))
                               (QREFELT % 112)))))) 

(SDEFUN |FSPECF;eJacobiSnGrad_m| ((|l| (|List| F)) (% (F)))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ (LETT |z| (SPADCALL |l| 1 (QREFELT % 107)))
                    (LETT |m| (SPADCALL |l| 2 (QREFELT % 107)))
                    (EXIT
                     (SPADCALL (QREFELT % 99)
                               (SPADCALL
                                (SPADCALL (|FSPECF;eJacobiSnGrad_z| |l| %)
                                          (|FSPECF;jacobiGradHelper| |z| |m| %)
                                          (QREFELT % 112))
                                (SPADCALL
                                 (SPADCALL (SPADCALL |z| |m| (QREFELT % 191))
                                           (SPADCALL
                                            (SPADCALL |z| |m| (QREFELT % 197))
                                            2 (QREFELT % 140))
                                           (QREFELT % 112))
                                 (SPADCALL (|spadConstant| % 86) |m|
                                           (QREFELT % 120))
                                 (QREFELT % 121))
                                (QREFELT % 113))
                               (QREFELT % 112)))))) 

(SDEFUN |FSPECF;jacobiCn;3F;162| ((|z| (F)) (|m| (F)) (% (F)))
        (SPADCALL (QREFELT % 199) |z| |m| (QREFELT % 61))) 

(SDEFUN |FSPECF;eJacobiCn| ((|z| (F)) (|m| (F)) (% (F)))
        (COND
         ((SPADCALL |z| (|spadConstant| % 82) (QREFELT % 84))
          (|spadConstant| % 86))
         ('T (SPADCALL (QREFELT % 199) (LIST |z| |m|) (QREFELT % 111))))) 

(SDEFUN |FSPECF;elJacobiCn| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eJacobiCn| (SPADCALL |l| 1 (QREFELT % 107))
         (SPADCALL |l| 2 (QREFELT % 107)) %)) 

(SDEFUN |FSPECF;eJacobiCnGrad_z| ((|l| (|List| F)) (% (F)))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ (LETT |z| (SPADCALL |l| 1 (QREFELT % 107)))
                    (LETT |m| (SPADCALL |l| 2 (QREFELT % 107)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL (SPADCALL |z| |m| (QREFELT % 191))
                                (SPADCALL |z| |m| (QREFELT % 198))
                                (QREFELT % 112))
                      (QREFELT % 122)))))) 

(SDEFUN |FSPECF;eJacobiCnGrad_m| ((|l| (|List| F)) (% (F)))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ (LETT |z| (SPADCALL |l| 1 (QREFELT % 107)))
                    (LETT |m| (SPADCALL |l| 2 (QREFELT % 107)))
                    (EXIT
                     (SPADCALL (QREFELT % 99)
                               (SPADCALL
                                (SPADCALL (|FSPECF;eJacobiCnGrad_z| |l| %)
                                          (|FSPECF;jacobiGradHelper| |z| |m| %)
                                          (QREFELT % 112))
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |z| |m| (QREFELT % 191))
                                            2 (QREFELT % 140))
                                  (SPADCALL |z| |m| (QREFELT % 197))
                                  (QREFELT % 112))
                                 (SPADCALL (|spadConstant| % 86) |m|
                                           (QREFELT % 120))
                                 (QREFELT % 121))
                                (QREFELT % 120))
                               (QREFELT % 112)))))) 

(SDEFUN |FSPECF;jacobiDn;3F;167| ((|z| (F)) (|m| (F)) (% (F)))
        (SPADCALL (QREFELT % 200) |z| |m| (QREFELT % 61))) 

(SDEFUN |FSPECF;eJacobiDn| ((|z| (F)) (|m| (F)) (% (F)))
        (COND
         ((SPADCALL |z| (|spadConstant| % 82) (QREFELT % 84))
          (|spadConstant| % 86))
         ('T (SPADCALL (QREFELT % 200) (LIST |z| |m|) (QREFELT % 111))))) 

(SDEFUN |FSPECF;elJacobiDn| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eJacobiDn| (SPADCALL |l| 1 (QREFELT % 107))
         (SPADCALL |l| 2 (QREFELT % 107)) %)) 

(SDEFUN |FSPECF;eJacobiDnGrad_z| ((|l| (|List| F)) (% (F)))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ (LETT |z| (SPADCALL |l| 1 (QREFELT % 107)))
                    (LETT |m| (SPADCALL |l| 2 (QREFELT % 107)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL |m| (SPADCALL |z| |m| (QREFELT % 191))
                                 (QREFELT % 112))
                       (SPADCALL |z| |m| (QREFELT % 197)) (QREFELT % 112))
                      (QREFELT % 122)))))) 

(SDEFUN |FSPECF;eJacobiDnGrad_m| ((|l| (|List| F)) (% (F)))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ (LETT |z| (SPADCALL |l| 1 (QREFELT % 107)))
                    (LETT |m| (SPADCALL |l| 2 (QREFELT % 107)))
                    (EXIT
                     (SPADCALL (QREFELT % 99)
                               (SPADCALL
                                (SPADCALL (|FSPECF;eJacobiDnGrad_z| |l| %)
                                          (|FSPECF;jacobiGradHelper| |z| |m| %)
                                          (QREFELT % 112))
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |z| |m| (QREFELT % 191))
                                            2 (QREFELT % 140))
                                  (SPADCALL |z| |m| (QREFELT % 198))
                                  (QREFELT % 112))
                                 (SPADCALL (|spadConstant| % 86) |m|
                                           (QREFELT % 120))
                                 (QREFELT % 121))
                                (QREFELT % 120))
                               (QREFELT % 112)))))) 

(SDEFUN |FSPECF;jacobiZeta;3F;172| ((|z| (F)) (|m| (F)) (% (F)))
        (SPADCALL (QREFELT % 201) |z| |m| (QREFELT % 61))) 

(SDEFUN |FSPECF;eJacobiZeta| ((|z| (F)) (|m| (F)) (% (F)))
        (COND
         ((SPADCALL |z| (|spadConstant| % 82) (QREFELT % 84))
          (|spadConstant| % 82))
         ('T (SPADCALL (QREFELT % 201) (LIST |z| |m|) (QREFELT % 111))))) 

(SDEFUN |FSPECF;elJacobiZeta| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eJacobiZeta| (SPADCALL |l| 1 (QREFELT % 107))
         (SPADCALL |l| 2 (QREFELT % 107)) %)) 

(SDEFUN |FSPECF;eJacobiZetaGrad_z| ((|l| (|List| F)) (% (F)))
        (SPROG ((|dn| (F)) (|m| (F)) (|z| (F)))
               (SEQ (LETT |z| (SPADCALL |l| 1 (QREFELT % 107)))
                    (LETT |m| (SPADCALL |l| 2 (QREFELT % 107)))
                    (LETT |dn| (SPADCALL |z| |m| (QREFELT % 198)))
                    (EXIT
                     (SPADCALL (SPADCALL |dn| |dn| (QREFELT % 112))
                               (SPADCALL (SPADCALL |m| (QREFELT % 173))
                                         (SPADCALL |m| (QREFELT % 172))
                                         (QREFELT % 121))
                               (QREFELT % 120)))))) 

(SDEFUN |FSPECF;eJacobiZetaGrad_m| ((|l| (|List| F)) (% (F)))
        (SPROG
         ((|res4| (F)) (|res3| (F)) (|res2| (F)) (|res1| (F)) (|dn| (F))
          (|er| (F)) (|ee| (F)) (|ek| (F)) (|m| (F)) (|z| (F)))
         (SEQ (LETT |z| (SPADCALL |l| 1 (QREFELT % 107)))
              (LETT |m| (SPADCALL |l| 2 (QREFELT % 107)))
              (LETT |ek| (SPADCALL |m| (QREFELT % 172)))
              (LETT |ee| (SPADCALL |m| (QREFELT % 173)))
              (LETT |er| (SPADCALL |ee| |ek| (QREFELT % 121)))
              (LETT |dn| (SPADCALL |z| |m| (QREFELT % 198)))
              (LETT |res1|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (SPADCALL |dn| |dn| (QREFELT % 112)) |m|
                                (QREFELT % 113))
                      (|spadConstant| % 86) (QREFELT % 120))
                     (SPADCALL |z| |m| (QREFELT % 202)) (QREFELT % 112)))
              (LETT |res2|
                    (SPADCALL |res1|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL |m| (|spadConstant| % 86)
                                           (QREFELT % 120))
                                 |z| (QREFELT % 112))
                                |dn| (QREFELT % 112))
                               |dn| (QREFELT % 112))
                              (QREFELT % 113)))
              (LETT |res3|
                    (SPADCALL |res2|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL |m|
                                          (SPADCALL |z| |m| (QREFELT % 197))
                                          (QREFELT % 112))
                                (SPADCALL |z| |m| (QREFELT % 198))
                                (QREFELT % 112))
                               (SPADCALL |z| |m| (QREFELT % 191))
                               (QREFELT % 112))
                              (QREFELT % 120)))
              (LETT |res4|
                    (SPADCALL |res3|
                              (SPADCALL
                               (SPADCALL |z|
                                         (SPADCALL
                                          (SPADCALL (|spadConstant| % 86) |m|
                                                    (QREFELT % 120))
                                          (SPADCALL |dn| |dn| (QREFELT % 112))
                                          (QREFELT % 113))
                                         (QREFELT % 112))
                               |er| (QREFELT % 112))
                              (QREFELT % 113)))
              (EXIT
               (SPADCALL
                (SPADCALL (QREFELT % 99)
                          (SPADCALL |res4|
                                    (SPADCALL
                                     (SPADCALL |z| |er| (QREFELT % 112)) |er|
                                     (QREFELT % 112))
                                    (QREFELT % 120))
                          (QREFELT % 112))
                (SPADCALL (SPADCALL |m| |m| (QREFELT % 112)) |m|
                          (QREFELT % 120))
                (QREFELT % 121)))))) 

(SDEFUN |FSPECF;jacobiTheta;3F;177| ((|z| (F)) (|m| (F)) (% (F)))
        (SPADCALL (QREFELT % 203) |z| |m| (QREFELT % 61))) 

(SDEFUN |FSPECF;eJacobiTheta| ((|z| (F)) (|m| (F)) (% (F)))
        (SPADCALL (QREFELT % 203) (LIST |z| |m|) (QREFELT % 111))) 

(SDEFUN |FSPECF;elJacobiTheta| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eJacobiTheta| (SPADCALL |l| 1 (QREFELT % 107))
         (SPADCALL |l| 2 (QREFELT % 107)) %)) 

(SDEFUN |FSPECF;eJacobiThetaGrad_z| ((|l| (|List| F)) (% (F)))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ (LETT |z| (SPADCALL |l| 1 (QREFELT % 107)))
                    (LETT |m| (SPADCALL |l| 2 (QREFELT % 107)))
                    (EXIT
                     (SPADCALL (SPADCALL |z| |m| (QREFELT % 202))
                               (SPADCALL |z| |m| (QREFELT % 204))
                               (QREFELT % 112)))))) 

(SDEFUN |FSPECF;eJacobiThetaGrad_m| ((|l| (|List| F)) (% (F)))
        (SPROG ((|dm| (F)) (|m| (F)) (|z| (F)))
               (SEQ (LETT |z| (SPADCALL |l| 1 (QREFELT % 107)))
                    (LETT |m| (SPADCALL |l| 2 (QREFELT % 107)))
                    (LETT |dm|
                          (SPADCALL (SPADCALL (QREFELT % 108))
                                    (QREFELT % 109)))
                    (EXIT
                     (SPADCALL (QREFELT % 96)
                               (LIST
                                (SPADCALL (QREFELT % 203) (LIST |z| |dm|)
                                          (QREFELT % 92))
                                |dm| |m|)
                               (QREFELT % 111)))))) 

(SDEFUN |FSPECF;lerchPhi;4F;182| ((|z| (F)) (|s| (F)) (|a| (F)) (% (F)))
        (SPADCALL (QREFELT % 205) |z| |s| |a| (QREFELT % 76))) 

(SDEFUN |FSPECF;eLerchPhi| ((|z| (F)) (|s| (F)) (|a| (F)) (% (F)))
        (COND
         ((SPADCALL |a| (|spadConstant| % 86) (QREFELT % 84))
          (SPADCALL (SPADCALL |s| |z| (QREFELT % 75)) |z| (QREFELT % 121)))
         ('T (SPADCALL (QREFELT % 205) (LIST |z| |s| |a|) (QREFELT % 111))))) 

(SDEFUN |FSPECF;elLerchPhi| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eLerchPhi| (SPADCALL |l| 1 (QREFELT % 107))
         (SPADCALL |l| 2 (QREFELT % 107)) (SPADCALL |l| 3 (QREFELT % 107)) %)) 

(SDEFUN |FSPECF;dLerchPhi| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (SPROG ((|dm| (F)) (|da| (F)) (|dz| (F)) (|a| (F)) (|s| (F)) (|z| (F)))
               (SEQ (LETT |z| (SPADCALL |l| 1 (QREFELT % 107)))
                    (LETT |s| (SPADCALL |l| 2 (QREFELT % 107)))
                    (LETT |a| (SPADCALL |l| 3 (QREFELT % 107)))
                    (LETT |dz|
                          (SPADCALL
                           (SPADCALL (SPADCALL |z| |t| (QREFELT % 110))
                                     (SPADCALL
                                      (SPADCALL |z|
                                                (SPADCALL |s|
                                                          (|spadConstant| % 86)
                                                          (QREFELT % 120))
                                                |a| (QREFELT % 206))
                                      (SPADCALL |a|
                                                (SPADCALL |z| |s| |a|
                                                          (QREFELT % 206))
                                                (QREFELT % 112))
                                      (QREFELT % 120))
                                     (QREFELT % 112))
                           |z| (QREFELT % 121)))
                    (LETT |da|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL |a| |t| (QREFELT % 110)) |s|
                                      (QREFELT % 112))
                            (SPADCALL |z|
                                      (SPADCALL |s| (|spadConstant| % 86)
                                                (QREFELT % 113))
                                      |a| (QREFELT % 206))
                            (QREFELT % 112))
                           (QREFELT % 122)))
                    (LETT |dm|
                          (SPADCALL (SPADCALL (QREFELT % 108))
                                    (QREFELT % 109)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL |s| |t| (QREFELT % 110))
                                 (SPADCALL (QREFELT % 96)
                                           (LIST
                                            (SPADCALL (QREFELT % 205)
                                                      (LIST |z| |dm| |a|)
                                                      (QREFELT % 92))
                                            |dm| |s|)
                                           (QREFELT % 111))
                                 (QREFELT % 112))
                       |dz| (QREFELT % 113))
                      |da| (QREFELT % 113)))))) 

(SDEFUN |FSPECF;riemannZeta;2F;186| ((|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 207) |z| (QREFELT % 51))) 

(SDEFUN |FSPECF;eRiemannZeta| ((|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 207) (LIST |z|) (QREFELT % 111))) 

(SDEFUN |FSPECF;elRiemannZeta| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eRiemannZeta| (SPADCALL |l| 1 (QREFELT % 107)) %)) 

(SDEFUN |FSPECF;charlierC;4F;189| ((|n| (F)) (|a| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 42) |n| |a| |z| (QREFELT % 76))) 

(SDEFUN |FSPECF;eCharlierC| ((|n| (F)) (|a| (F)) (|z| (F)) (% (F)))
        (COND
         ((SPADCALL |n| (|spadConstant| % 82) (QREFELT % 84))
          (|spadConstant| % 86))
         ((SPADCALL |n| (|spadConstant| % 86) (QREFELT % 84))
          (SPADCALL (SPADCALL |z| |a| (QREFELT % 120)) |a| (QREFELT % 121)))
         ('T (SPADCALL (QREFELT % 42) (LIST |n| |a| |z|) (QREFELT % 111))))) 

(SDEFUN |FSPECF;elCharlierC| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eCharlierC| (SPADCALL |l| 1 (QREFELT % 107))
         (SPADCALL |l| 2 (QREFELT % 107)) (SPADCALL |l| 3 (QREFELT % 107)) %)) 

(SDEFUN |FSPECF;hermiteH;3F;192| ((|n| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 43) |n| |z| (QREFELT % 61))) 

(SDEFUN |FSPECF;eHermiteH| ((|n| (F)) (|z| (F)) (% (F)))
        (COND
         ((SPADCALL |n| (SPADCALL (|spadConstant| % 86) (QREFELT % 122))
                    (QREFELT % 84))
          (|spadConstant| % 82))
         ((SPADCALL |n| (|spadConstant| % 82) (QREFELT % 84))
          (|spadConstant| % 86))
         ((SPADCALL |n| (|spadConstant| % 86) (QREFELT % 84))
          (SPADCALL (SPADCALL 2 (QREFELT % 88)) |z| (QREFELT % 112)))
         ('T (SPADCALL (QREFELT % 43) (LIST |n| |z|) (QREFELT % 111))))) 

(SDEFUN |FSPECF;elHermiteH| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eHermiteH| (SPADCALL |l| 1 (QREFELT % 107))
         (SPADCALL |l| 2 (QREFELT % 107)) %)) 

(SDEFUN |FSPECF;eHermiteHGrad_z| ((|n| (F)) (|z| (F)) (% (F)))
        (SPADCALL (SPADCALL (SPADCALL 2 (QREFELT % 88)) |n| (QREFELT % 112))
                  (SPADCALL
                   (SPADCALL |n| (|spadConstant| % 86) (QREFELT % 120)) |z|
                   (QREFELT % 210))
                  (QREFELT % 112))) 

(SDEFUN |FSPECF;dHermiteH| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad2| |l| |t| (QREFELT % 43)
         (CONS (|function| |FSPECF;eHermiteHGrad_z|) %) %)) 

(SDEFUN |FSPECF;jacobiP;5F;197|
        ((|n| (F)) (|a| (F)) (|b| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 44) |n| |a| |b| |z| (QREFELT % 211))) 

(SDEFUN |FSPECF;eJacobiP| ((|n| (F)) (|a| (F)) (|b| (F)) (|z| (F)) (% (F)))
        (COND
         ((SPADCALL |n| (SPADCALL (|spadConstant| % 86) (QREFELT % 122))
                    (QREFELT % 84))
          (|spadConstant| % 82))
         ((SPADCALL |n| (|spadConstant| % 82) (QREFELT % 84))
          (|spadConstant| % 86))
         ((SPADCALL |n| (|spadConstant| % 86) (QREFELT % 84))
          (SPADCALL
           (SPADCALL (QREFELT % 99) (SPADCALL |a| |b| (QREFELT % 120))
                     (QREFELT % 112))
           (SPADCALL
            (SPADCALL (|spadConstant| % 86)
                      (SPADCALL (QREFELT % 99)
                                (SPADCALL |a| |b| (QREFELT % 113))
                                (QREFELT % 112))
                      (QREFELT % 113))
            |z| (QREFELT % 112))
           (QREFELT % 113)))
         ('T (SPADCALL (QREFELT % 44) (LIST |n| |a| |b| |z|) (QREFELT % 111))))) 

(SDEFUN |FSPECF;elJacobiP| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eJacobiP| (SPADCALL |l| 1 (QREFELT % 107))
         (SPADCALL |l| 2 (QREFELT % 107)) (SPADCALL |l| 3 (QREFELT % 107))
         (SPADCALL |l| 4 (QREFELT % 107)) %)) 

(SDEFUN |FSPECF;eJacobiPGrad_z|
        ((|n| (F)) (|a| (F)) (|b| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL (QREFELT % 99)
                   (SPADCALL
                    (SPADCALL (SPADCALL |a| |b| (QREFELT % 113)) |n|
                              (QREFELT % 113))
                    (|spadConstant| % 86) (QREFELT % 113))
                   (QREFELT % 112))
         (SPADCALL (SPADCALL |n| (|spadConstant| % 86) (QREFELT % 120))
                   (SPADCALL |a| (|spadConstant| % 86) (QREFELT % 113))
                   (SPADCALL |b| (|spadConstant| % 86) (QREFELT % 113)) |z|
                   (QREFELT % 212))
         (QREFELT % 112))) 

(SDEFUN |FSPECF;dJacobiP| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad4| |l| |t| (QREFELT % 44)
         (CONS (|function| |FSPECF;eJacobiPGrad_z|) %) %)) 

(SDEFUN |FSPECF;laguerreL;4F;202| ((|n| (F)) (|a| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 45) |n| |a| |z| (QREFELT % 76))) 

(SDEFUN |FSPECF;eLaguerreL| ((|n| (F)) (|a| (F)) (|z| (F)) (% (F)))
        (COND
         ((SPADCALL |n| (SPADCALL (|spadConstant| % 86) (QREFELT % 122))
                    (QREFELT % 84))
          (|spadConstant| % 82))
         ((SPADCALL |n| (|spadConstant| % 82) (QREFELT % 84))
          (|spadConstant| % 86))
         ((SPADCALL |n| (|spadConstant| % 86) (QREFELT % 84))
          (SPADCALL (SPADCALL (|spadConstant| % 86) |a| (QREFELT % 113)) |z|
                    (QREFELT % 120)))
         ('T (SPADCALL (QREFELT % 45) (LIST |n| |a| |z|) (QREFELT % 111))))) 

(SDEFUN |FSPECF;elLaguerreL| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eLaguerreL| (SPADCALL |l| 1 (QREFELT % 107))
         (SPADCALL |l| 2 (QREFELT % 107)) (SPADCALL |l| 3 (QREFELT % 107)) %)) 

(SDEFUN |FSPECF;eLaguerreLGrad_z| ((|n| (F)) (|a| (F)) (|z| (F)) (% (F)))
        (SPADCALL (SPADCALL |n| (|spadConstant| % 86) (QREFELT % 120))
                  (SPADCALL |a| (|spadConstant| % 86) (QREFELT % 113)) |z|
                  (QREFELT % 213))) 

(SDEFUN |FSPECF;dLaguerreL| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad3| |l| |t| (QREFELT % 45)
         (CONS (|function| |FSPECF;eLaguerreLGrad_z|) %) %)) 

(SDEFUN |FSPECF;meixnerM;5F;207|
        ((|n| (F)) (|b| (F)) (|c| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 46) |n| |b| |c| |z| (QREFELT % 211))) 

(SDEFUN |FSPECF;eMeixnerM| ((|n| (F)) (|b| (F)) (|c| (F)) (|z| (F)) (% (F)))
        (COND
         ((SPADCALL |n| (|spadConstant| % 82) (QREFELT % 84))
          (|spadConstant| % 86))
         ((SPADCALL |n| (|spadConstant| % 86) (QREFELT % 84))
          (SPADCALL
           (SPADCALL
            (SPADCALL (SPADCALL |c| (|spadConstant| % 86) (QREFELT % 120)) |z|
                      (QREFELT % 112))
            (SPADCALL |c| |b| (QREFELT % 112)) (QREFELT % 121))
           (|spadConstant| % 86) (QREFELT % 113)))
         ('T (SPADCALL (QREFELT % 46) (LIST |n| |b| |c| |z|) (QREFELT % 111))))) 

(SDEFUN |FSPECF;elMeixnerM| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eMeixnerM| (SPADCALL |l| 1 (QREFELT % 107))
         (SPADCALL |l| 2 (QREFELT % 107)) (SPADCALL |l| 3 (QREFELT % 107))
         (SPADCALL |l| 4 (QREFELT % 107)) %)) 

(SDEFUN |FSPECF;belong?;BoB;210| ((|op| (|BasicOperator|)) (% (|Boolean|)))
        (SPADCALL |op| (QREFELT % 8) (QREFELT % 215))) 

(SDEFUN |FSPECF;operator;2Bo;211|
        ((|op| (|BasicOperator|)) (% (|BasicOperator|)))
        (COND ((SPADCALL |op| '|abs| (QREFELT % 217)) (QREFELT % 13))
              ((SPADCALL |op| '|sign| (QREFELT % 217)) (QREFELT % 14))
              ((SPADCALL |op| '|unitStep| (QREFELT % 217)) (QREFELT % 15))
              ((SPADCALL |op| '|ceiling| (QREFELT % 217)) (QREFELT % 16))
              ((SPADCALL |op| '|floor| (QREFELT % 217)) (QREFELT % 17))
              ((SPADCALL |op| '|fractionPart| (QREFELT % 217)) (QREFELT % 18))
              ((SPADCALL |op| '|diracDelta| (QREFELT % 217)) (QREFELT % 19))
              ((SPADCALL |op| '|conjugate| (QREFELT % 217)) (QREFELT % 20))
              ((SPADCALL |op| '|Gamma| (QREFELT % 217)) (QREFELT % 21))
              ((SPADCALL |op| '|Gamma2| (QREFELT % 217)) (QREFELT % 22))
              ((SPADCALL |op| '|Beta| (QREFELT % 217)) (QREFELT % 23))
              ((SPADCALL |op| '|digamma| (QREFELT % 217)) (QREFELT % 24))
              ((SPADCALL |op| '|polygamma| (QREFELT % 217)) (QREFELT % 25))
              ((SPADCALL |op| '|besselJ| (QREFELT % 217)) (QREFELT % 26))
              ((SPADCALL |op| '|besselY| (QREFELT % 217)) (QREFELT % 27))
              ((SPADCALL |op| '|besselI| (QREFELT % 217)) (QREFELT % 28))
              ((SPADCALL |op| '|besselK| (QREFELT % 217)) (QREFELT % 29))
              ((SPADCALL |op| '|airyAi| (QREFELT % 217)) (QREFELT % 30))
              ((SPADCALL |op| '|airyAiPrime| (QREFELT % 217)) (QREFELT % 31))
              ((SPADCALL |op| '|airyBi| (QREFELT % 217)) (QREFELT % 32))
              ((SPADCALL |op| '|airyBiPrime| (QREFELT % 217)) (QREFELT % 33))
              ((SPADCALL |op| '|lambertW| (QREFELT % 217)) (QREFELT % 34))
              ((SPADCALL |op| '|polylog| (QREFELT % 217)) (QREFELT % 35))
              ((SPADCALL |op| '|weierstrassP| (QREFELT % 217)) (QREFELT % 36))
              ((SPADCALL |op| '|weierstrassPPrime| (QREFELT % 217))
               (QREFELT % 37))
              ((SPADCALL |op| '|weierstrassSigma| (QREFELT % 217))
               (QREFELT % 38))
              ((SPADCALL |op| '|weierstrassZeta| (QREFELT % 217))
               (QREFELT % 39))
              ((SPADCALL |op| '|hypergeometricF| (QREFELT % 217))
               (QREFELT % 40))
              ((SPADCALL |op| '|meijerG| (QREFELT % 217)) (QREFELT % 41))
              ((SPADCALL |op| '|weierstrassPInverse| (QREFELT % 217))
               (QREFELT % 114))
              ((SPADCALL |op| '|whittakerM| (QREFELT % 217)) (QREFELT % 128))
              ((SPADCALL |op| '|whittakerW| (QREFELT % 217)) (QREFELT % 132))
              ((SPADCALL |op| '|angerJ| (QREFELT % 217)) (QREFELT % 134))
              ((SPADCALL |op| '|weberE| (QREFELT % 217)) (QREFELT % 138))
              ((SPADCALL |op| '|struveH| (QREFELT % 217)) (QREFELT % 142))
              ((SPADCALL |op| '|struveL| (QREFELT % 217)) (QREFELT % 145))
              ((SPADCALL |op| '|hankelH1| (QREFELT % 217)) (QREFELT % 147))
              ((SPADCALL |op| '|hankelH2| (QREFELT % 217)) (QREFELT % 149))
              ((SPADCALL |op| '|lommelS1| (QREFELT % 217)) (QREFELT % 151))
              ((SPADCALL |op| '|lommelS2| (QREFELT % 217)) (QREFELT % 153))
              ((SPADCALL |op| '|kummerM| (QREFELT % 217)) (QREFELT % 155))
              ((SPADCALL |op| '|kummerU| (QREFELT % 217)) (QREFELT % 157))
              ((SPADCALL |op| '|legendreP| (QREFELT % 217)) (QREFELT % 159))
              ((SPADCALL |op| '|legendreQ| (QREFELT % 217)) (QREFELT % 161))
              ((SPADCALL |op| '|kelvinBei| (QREFELT % 217)) (QREFELT % 163))
              ((SPADCALL |op| '|kelvinBer| (QREFELT % 217)) (QREFELT % 166))
              ((SPADCALL |op| '|kelvinKei| (QREFELT % 217)) (QREFELT % 167))
              ((SPADCALL |op| '|kelvinKer| (QREFELT % 217)) (QREFELT % 170))
              ((SPADCALL |op| '|ellipticK| (QREFELT % 217)) (QREFELT % 171))
              ((SPADCALL |op| '|ellipticE| (QREFELT % 217)) (QREFELT % 178))
              ((SPADCALL |op| '|ellipticE2| (QREFELT % 217)) (QREFELT % 179))
              ((SPADCALL |op| '|ellipticF| (QREFELT % 217)) (QREFELT % 187))
              ((SPADCALL |op| '|ellipticPi| (QREFELT % 217)) (QREFELT % 188))
              ((SPADCALL |op| '|jacobiSn| (QREFELT % 217)) (QREFELT % 190))
              ((SPADCALL |op| '|jacobiCn| (QREFELT % 217)) (QREFELT % 199))
              ((SPADCALL |op| '|jacobiDn| (QREFELT % 217)) (QREFELT % 200))
              ((SPADCALL |op| '|jacobiZeta| (QREFELT % 217)) (QREFELT % 201))
              ((SPADCALL |op| '|jacobiTheta| (QREFELT % 217)) (QREFELT % 203))
              ((SPADCALL |op| '|lerchPhi| (QREFELT % 217)) (QREFELT % 205))
              ((SPADCALL |op| '|riemannZeta| (QREFELT % 217)) (QREFELT % 207))
              ((SPADCALL |op| '|charlierC| (QREFELT % 217)) (QREFELT % 42))
              ((SPADCALL |op| '|hermiteH| (QREFELT % 217)) (QREFELT % 43))
              ((SPADCALL |op| '|jacobiP| (QREFELT % 217)) (QREFELT % 44))
              ((SPADCALL |op| '|laguerreL| (QREFELT % 217)) (QREFELT % 45))
              ((SPADCALL |op| '|meixnerM| (QREFELT % 217)) (QREFELT % 46))
              ((SPADCALL |op| '|%logGamma| (QREFELT % 217)) (QREFELT % 47))
              ((SPADCALL |op| '|%eis| (QREFELT % 217)) (QREFELT % 48))
              ((SPADCALL |op| '|%erfs| (QREFELT % 217)) (QREFELT % 49))
              ((SPADCALL |op| '|%erfis| (QREFELT % 217)) (QREFELT % 50))
              ('T (|error| "Not a special operator")))) 

(SDEFUN |FSPECF;iGamma| ((|x| (F)) (% (F)))
        (COND ((SPADCALL |x| (|spadConstant| % 86) (QREFELT % 84)) |x|)
              ('T (SPADCALL (QREFELT % 21) |x| (QREFELT % 219))))) 

(SDEFUN |FSPECF;iabs| ((|x| (F)) (% (F)))
        (COND ((SPADCALL |x| (QREFELT % 220)) (|spadConstant| % 82))
              ((SPADCALL |x| (QREFELT % 221)) (|spadConstant| % 86))
              ((SPADCALL |x| (QREFELT % 13) (QREFELT % 192)) |x|)
              ((SPADCALL |x| (QREFELT % 20) (QREFELT % 192))
               (SPADCALL (QREFELT % 13)
                         (SPADCALL
                          (SPADCALL (SPADCALL |x| (QREFELT % 194))
                                    (QREFELT % 196))
                          1 (QREFELT % 107))
                         (QREFELT % 219)))
              ((SPADCALL |x| (|spadConstant| % 82) (QREFELT % 222))
               (SPADCALL (QREFELT % 13) (SPADCALL |x| (QREFELT % 122))
                         (QREFELT % 219)))
              ('T (SPADCALL (QREFELT % 13) |x| (QREFELT % 219))))) 

(SDEFUN |FSPECF;iconjugate| ((|x| (F)) (% (F)))
        (COND ((SPADCALL |x| (QREFELT % 220)) (|spadConstant| % 82))
              ((SPADCALL |x| (QREFELT % 20) (QREFELT % 192))
               (SPADCALL
                (SPADCALL (SPADCALL |x| (QREFELT % 194)) (QREFELT % 196)) 1
                (QREFELT % 107)))
              ((SPADCALL |x| (QREFELT % 13) (QREFELT % 192)) |x|)
              ('T (SPADCALL (QREFELT % 20) |x| (QREFELT % 219))))) 

(SDEFUN |FSPECF;retract_Q;FU;215|
        ((|x| (F)) (% (|Union| (|Fraction| (|Integer|)) "failed")))
        (SPADCALL |x| (QREFELT % 224))) 

(SDEFUN |FSPECF;coerce_Q;FF;216| ((|x| (|Fraction| (|Integer|))) (% (F)))
        (SPADCALL |x| (QREFELT % 226))) 

(PUT '|FSPECF;retract_Q;FU;217| '|SPADreplace| '(XLAM (|x|) (CONS 1 "failed"))) 

(SDEFUN |FSPECF;retract_Q;FU;217|
        ((|x| (F)) (% (|Union| (|Fraction| (|Integer|)) "failed")))
        (CONS 1 "failed")) 

(SDEFUN |FSPECF;isign| ((|x| (F)) (% (F)))
        (SPROG
         ((|r1| (|Integer|))
          (|ru| (|Union| (|Fraction| (|Integer|)) "failed")))
         (SEQ
          (COND ((SPADCALL |x| (QREFELT % 220)) (|spadConstant| % 82))
                (#1='T
                 (SEQ (LETT |ru| (SPADCALL |x| (QREFELT % 225)))
                      (EXIT
                       (COND
                        ((QEQCAR |ru| 0)
                         (SEQ
                          (LETT |r1| (SPADCALL (QCDR |ru|) (QREFELT % 228)))
                          (EXIT
                           (COND ((EQL |r1| 1) (|spadConstant| % 86))
                                 ((EQL |r1| 0) (|spadConstant| % 82))
                                 (#1#
                                  (SPADCALL (|spadConstant| % 86)
                                            (QREFELT % 122)))))))
                        ((SPADCALL |x| (QREFELT % 14) (QREFELT % 192)) |x|)
                        (#1#
                         (SPADCALL (QREFELT % 14) |x| (QREFELT % 219))))))))))) 

(SDEFUN |FSPECF;i_unitStep| ((|x| (F)) (% (F)))
        (SPROG
         ((|r1| (|Integer|))
          (|ru| (|Union| (|Fraction| (|Integer|)) "failed")))
         (SEQ
          (COND ((SPADCALL |x| (QREFELT % 220)) (|spadConstant| % 86))
                ('T
                 (SEQ (LETT |ru| (SPADCALL |x| (QREFELT % 225)))
                      (EXIT
                       (COND
                        ((QEQCAR |ru| 0)
                         (SEQ
                          (LETT |r1| (SPADCALL (QCDR |ru|) (QREFELT % 228)))
                          (EXIT
                           (COND
                            ((OR (EQL |r1| 1) (EQL |r1| 0))
                             (|spadConstant| % 86))
                            ('T (|spadConstant| % 82))))))
                        ((OR (SPADCALL |x| (QREFELT % 13) (QREFELT % 192))
                             (OR (SPADCALL |x| (QREFELT % 15) (QREFELT % 192))
                                 (SPADCALL |x| (QREFELT % 18)
                                           (QREFELT % 192))))
                         (|spadConstant| % 86))
                        ('T
                         (SPADCALL (QREFELT % 15) |x| (QREFELT % 219))))))))))) 

(SDEFUN |FSPECF;i_ceiling| ((|x| (F)) (% (F)))
        (SPROG ((|ru| (|Union| (|Fraction| (|Integer|)) "failed")))
               (SEQ
                (COND ((SPADCALL |x| (QREFELT % 220)) (|spadConstant| % 82))
                      ('T
                       (SEQ (LETT |ru| (SPADCALL |x| (QREFELT % 225)))
                            (EXIT
                             (COND
                              ((QEQCAR |ru| 0)
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (QCDR |ru|) (QREFELT % 230))
                                 (QREFELT % 231))
                                (QREFELT % 227)))
                              ((OR
                                (SPADCALL |x| (QREFELT % 16) (QREFELT % 192))
                                (SPADCALL |x| (QREFELT % 17) (QREFELT % 192)))
                               |x|)
                              ('T
                               (SPADCALL (QREFELT % 16) |x|
                                         (QREFELT % 219))))))))))) 

(SDEFUN |FSPECF;i_floor| ((|x| (F)) (% (F)))
        (SPROG ((|ru| (|Union| (|Fraction| (|Integer|)) "failed")))
               (SEQ
                (COND ((SPADCALL |x| (QREFELT % 220)) (|spadConstant| % 82))
                      (#1='T
                       (SEQ (LETT |ru| (SPADCALL |x| (QREFELT % 225)))
                            (EXIT
                             (COND
                              ((QEQCAR |ru| 0)
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (QCDR |ru|) (QREFELT % 232))
                                 (QREFELT % 231))
                                (QREFELT % 227)))
                              ((OR
                                (SPADCALL |x| (QREFELT % 16) (QREFELT % 192))
                                (SPADCALL |x| (QREFELT % 17) (QREFELT % 192)))
                               |x|)
                              ((SPADCALL |x| (QREFELT % 18) (QREFELT % 192))
                               (|spadConstant| % 82))
                              (#1#
                               (SPADCALL (QREFELT % 17) |x|
                                         (QREFELT % 219))))))))))) 

(SDEFUN |FSPECF;i_fractionPart| ((|x| (F)) (% (F)))
        (SPROG ((|ru| (|Union| (|Fraction| (|Integer|)) "failed")))
               (SEQ
                (COND ((SPADCALL |x| (QREFELT % 220)) (|spadConstant| % 82))
                      (#1='T
                       (SEQ (LETT |ru| (SPADCALL |x| (QREFELT % 225)))
                            (EXIT
                             (COND
                              ((QEQCAR |ru| 0)
                               (SPADCALL (SPADCALL (QCDR |ru|) (QREFELT % 233))
                                         (QREFELT % 227)))
                              ((OR
                                (SPADCALL |x| (QREFELT % 16) (QREFELT % 192))
                                (SPADCALL |x| (QREFELT % 17) (QREFELT % 192)))
                               (|spadConstant| % 82))
                              ((SPADCALL |x| (QREFELT % 18) (QREFELT % 192))
                               |x|)
                              (#1#
                               (SPADCALL (QREFELT % 18) |x|
                                         (QREFELT % 219))))))))))) 

(SDEFUN |FSPECF;i_diracDelta| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 19) |x| (QREFELT % 219))) 

(SDEFUN |FSPECF;iBeta| ((|x| (F)) (|y| (F)) (% (F)))
        (SPADCALL (QREFELT % 23) (LIST |x| |y|) (QREFELT % 111))) 

(SDEFUN |FSPECF;idigamma| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 24) |x| (QREFELT % 219))) 

(SDEFUN |FSPECF;iiipolygamma| ((|n| (F)) (|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 25) (LIST |n| |x|) (QREFELT % 111))) 

(SDEFUN |FSPECF;iiiBesselJ| ((|x| (F)) (|y| (F)) (% (F)))
        (SPADCALL (QREFELT % 26) (LIST |x| |y|) (QREFELT % 111))) 

(SDEFUN |FSPECF;iiiBesselY| ((|x| (F)) (|y| (F)) (% (F)))
        (SPADCALL (QREFELT % 27) (LIST |x| |y|) (QREFELT % 111))) 

(SDEFUN |FSPECF;iiiBesselI| ((|x| (F)) (|y| (F)) (% (F)))
        (SPADCALL (QREFELT % 28) (LIST |x| |y|) (QREFELT % 111))) 

(SDEFUN |FSPECF;iiiBesselK| ((|x| (F)) (|y| (F)) (% (F)))
        (SPADCALL (QREFELT % 29) (LIST |x| |y|) (QREFELT % 111))) 

(SDEFUN |FSPECF;iAiryAi;2F;231| ((|x| (F)) (% (F)))
        (COND
         ((SPADCALL |x| (QREFELT % 220))
          (SPADCALL (|spadConstant| % 86)
                    (SPADCALL
                     (SPADCALL (SPADCALL 3 (QREFELT % 88)) (QREFELT % 105)
                               (QREFELT % 144))
                     (SPADCALL (QREFELT % 105) (QREFELT % 60)) (QREFELT % 112))
                    (QREFELT % 121)))
         ('T (SPADCALL (QREFELT % 30) |x| (QREFELT % 219))))) 

(SDEFUN |FSPECF;iAiryAiPrime;2F;232| ((|x| (F)) (% (F)))
        (COND
         ((SPADCALL |x| (QREFELT % 220))
          (SPADCALL
           (SPADCALL (|spadConstant| % 86)
                     (SPADCALL
                      (SPADCALL (SPADCALL 3 (QREFELT % 88)) (QREFELT % 100)
                                (QREFELT % 144))
                      (SPADCALL (QREFELT % 100) (QREFELT % 60))
                      (QREFELT % 112))
                     (QREFELT % 121))
           (QREFELT % 122)))
         ('T (SPADCALL (QREFELT % 31) |x| (QREFELT % 219))))) 

(SDEFUN |FSPECF;iAiryBi;2F;233| ((|x| (F)) (% (F)))
        (COND
         ((SPADCALL |x| (QREFELT % 220))
          (SPADCALL (|spadConstant| % 86)
                    (SPADCALL
                     (SPADCALL (SPADCALL 3 (QREFELT % 88)) (QREFELT % 102)
                               (QREFELT % 144))
                     (SPADCALL (QREFELT % 105) (QREFELT % 60)) (QREFELT % 112))
                    (QREFELT % 121)))
         ('T (SPADCALL (QREFELT % 32) |x| (QREFELT % 219))))) 

(SDEFUN |FSPECF;iAiryBiPrime;2F;234| ((|x| (F)) (% (F)))
        (COND
         ((SPADCALL |x| (QREFELT % 220))
          (SPADCALL
           (SPADCALL (SPADCALL 3 (QREFELT % 88)) (QREFELT % 102)
                     (QREFELT % 144))
           (SPADCALL (QREFELT % 100) (QREFELT % 60)) (QREFELT % 121)))
         ('T (SPADCALL (QREFELT % 33) |x| (QREFELT % 219))))) 

(SDEFUN |FSPECF;iAiryAi;2F;235| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 30) |x| (QREFELT % 219))) 

(SDEFUN |FSPECF;iAiryAiPrime;2F;236| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 31) |x| (QREFELT % 219))) 

(SDEFUN |FSPECF;iAiryBi;2F;237| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 32) |x| (QREFELT % 219))) 

(SDEFUN |FSPECF;iAiryBiPrime;2F;238| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 33) |x| (QREFELT % 219))) 

(SDEFUN |FSPECF;iLambertW;2F;239| ((|x| (F)) (% (F)))
        (COND ((SPADCALL |x| (QREFELT % 220)) (|spadConstant| % 82))
              ((SPADCALL |x| (SPADCALL (|spadConstant| % 86) (QREFELT % 238))
                         (QREFELT % 84))
               (|spadConstant| % 86))
              ((SPADCALL |x|
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (|spadConstant| % 86) (QREFELT % 122))
                           (QREFELT % 238))
                          (QREFELT % 122))
                         (QREFELT % 84))
               (SPADCALL (|spadConstant| % 86) (QREFELT % 122)))
              ('T (SPADCALL (QREFELT % 34) |x| (QREFELT % 219))))) 

(SDEFUN |FSPECF;iLambertW;2F;240| ((|x| (F)) (% (F)))
        (COND ((SPADCALL |x| (QREFELT % 220)) (|spadConstant| % 82))
              ('T (SPADCALL (QREFELT % 34) |x| (QREFELT % 219))))) 

(SDEFUN |FSPECF;iiiPolylog| ((|s| (F)) (|x| (F)) (% (F)))
        (COND
         ((SPADCALL |x| (|spadConstant| % 82) (QREFELT % 84))
          (|spadConstant| % 82))
         ('T (SPADCALL (QREFELT % 35) (LIST |s| |x|) (QREFELT % 111))))) 

(SDEFUN |FSPECF;iiPolylog;3F;242| ((|s| (F)) (|x| (F)) (% (F)))
        (COND
         ((SPADCALL |s| (|spadConstant| % 86) (QREFELT % 84))
          (SPADCALL
           (SPADCALL (SPADCALL (|spadConstant| % 86) |x| (QREFELT % 120))
                     (QREFELT % 240))
           (QREFELT % 122)))
         ((SPADCALL |s| (SPADCALL 2 (QREFELT % 88)) (QREFELT % 84))
          (SPADCALL (SPADCALL (|spadConstant| % 86) |x| (QREFELT % 120))
                    (QREFELT % 241)))
         ('T (|FSPECF;iiiPolylog| |s| |x| %)))) 

(SDEFUN |FSPECF;iiPolylog;3F;243| ((|s| (F)) (|x| (F)) (% (F)))
        (COND
         ((SPADCALL |s| (|spadConstant| % 86) (QREFELT % 84))
          (SPADCALL
           (SPADCALL (SPADCALL (|spadConstant| % 86) |x| (QREFELT % 120))
                     (QREFELT % 240))
           (QREFELT % 122)))
         ('T (|FSPECF;iiiPolylog| |s| |x| %)))) 

(SDEFUN |FSPECF;iiPolylog;3F;244| ((|s| (F)) (|x| (F)) (% (F)))
        (|FSPECF;iiiPolylog| |s| |x| %)) 

(SDEFUN |FSPECF;iPolylog| ((|l| (|List| F)) (% (F)))
        (SPADCALL (|SPADfirst| |l|) (SPADCALL |l| (QREFELT % 243))
                  (QREFELT % 242))) 

(SDEFUN |FSPECF;iWeierstrassP| ((|g2| (F)) (|g3| (F)) (|x| (F)) (% (F)))
        (SPROG ((#1=#:G1268 NIL) (|args| (|List| F)))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL |x| (QREFELT % 114) (QREFELT % 192))
                    (SEQ
                     (LETT |args|
                           (SPADCALL (SPADCALL |x| (QREFELT % 194))
                                     (QREFELT % 196)))
                     (EXIT
                      (COND
                       ((SPADCALL |g2| (SPADCALL |args| 1 (QREFELT % 107))
                                  (QREFELT % 84))
                        (COND
                         ((SPADCALL |g3| (SPADCALL |args| 2 (QREFELT % 107))
                                    (QREFELT % 84))
                          (PROGN
                           (LETT #1# (SPADCALL |args| 3 (QREFELT % 107)))
                           (GO #2=#:G1267))))))))))
                  (EXIT
                   (SPADCALL (QREFELT % 36) (LIST |g2| |g3| |x|)
                             (QREFELT % 111)))))
                #2# (EXIT #1#)))) 

(SDEFUN |FSPECF;iWeierstrassPPrime| ((|g2| (F)) (|g3| (F)) (|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 37) (LIST |g2| |g3| |x|) (QREFELT % 111))) 

(SDEFUN |FSPECF;iWeierstrassSigma| ((|g2| (F)) (|g3| (F)) (|x| (F)) (% (F)))
        (COND
         ((SPADCALL |x| (|spadConstant| % 82) (QREFELT % 84))
          (|spadConstant| % 82))
         ('T (SPADCALL (QREFELT % 38) (LIST |g2| |g3| |x|) (QREFELT % 111))))) 

(SDEFUN |FSPECF;iWeierstrassZeta| ((|g2| (F)) (|g3| (F)) (|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 39) (LIST |g2| |g3| |x|) (QREFELT % 111))) 

(SDEFUN |FSPECF;iiabs;2F;250| ((|x| (F)) (% (F)))
        (SPROG
         ((#1=#:G1289 NIL) (|b| #2=(|Union| R "failed")) (|a| #2#)
          (|f| (|Fraction| (|Polynomial| R)))
          (|r| (|Union| (|Fraction| (|Polynomial| R)) "failed")))
         (SEQ (LETT |r| (SPADCALL |x| (QREFELT % 245)))
              (EXIT
               (COND ((QEQCAR |r| 1) (|FSPECF;iabs| |x| %))
                     (#3='T
                      (SEQ
                       (EXIT
                        (SEQ (LETT |f| (QCDR |r|))
                             (SEQ
                              (LETT |a|
                                    (SPADCALL (SPADCALL |f| (QREFELT % 248))
                                              (QREFELT % 250)))
                              (EXIT
                               (COND
                                ((QEQCAR |a| 1)
                                 (PROGN
                                  (LETT #1# (|FSPECF;iabs| |x| %))
                                  (GO #4=#:G1286)))
                                (#3#
                                 (SEQ
                                  (LETT |b|
                                        (SPADCALL
                                         (SPADCALL |f| (QREFELT % 251))
                                         (QREFELT % 250)))
                                  (EXIT
                                   (COND
                                    ((QEQCAR |b| 1)
                                     (PROGN
                                      (LETT #1# (|FSPECF;iabs| |x| %))
                                      (GO #4#))))))))))
                             (EXIT
                              (SPADCALL
                               (SPADCALL (SPADCALL (QCDR |a|) (QREFELT % 252))
                                         (QREFELT % 253))
                               (SPADCALL (SPADCALL (QCDR |b|) (QREFELT % 252))
                                         (QREFELT % 253))
                               (QREFELT % 121)))))
                       #4# (EXIT #1#)))))))) 

(SDEFUN |FSPECF;iiabs;2F;251| ((|x| (F)) (% (F))) (|FSPECF;iabs| |x| %)) 

(SDEFUN |FSPECF;iiconjugate;2F;252| ((|x| (F)) (% (F)))
        (SPROG ((#1=#:G1335 NIL))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |x| (QREFELT % 20) (QREFELT % 192))
                   (SPADCALL
                    (SPADCALL (SPADCALL |x| (QREFELT % 194)) (QREFELT % 196)) 1
                    (QREFELT % 107)))
                  ((SPADCALL |x| (QREFELT % 13) (QREFELT % 192)) |x|)
                  ((QEQCAR (SPADCALL |x| (QREFELT % 256)) 0)
                   (|FSPECF;iconjugate| |x| %))
                  ('T
                   (SEQ
                    (LETT |x|
                          (SPADCALL |x| (SPADCALL |x| (QREFELT % 258))
                                    (SPADCALL
                                     (CONS #'|FSPECF;iiconjugate;2F;252!0| %)
                                     (SPADCALL |x| (QREFELT % 258))
                                     (QREFELT % 271))
                                    (QREFELT % 272)))
                    (COND
                     ((|HasSignature| (QREFELT % 6)
                                      (LIST '|conjugate|
                                            (LIST (|devaluate| (QREFELT % 6))
                                                  (|devaluate|
                                                   (QREFELT % 6)))))
                      (LETT |x|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (ELT % 273)
                                        (SPADCALL |x| (QREFELT % 275))
                                        (QREFELT % 277))
                              (QREFELT % 278))
                             (SPADCALL
                              (SPADCALL (ELT % 273)
                                        (SPADCALL |x| (QREFELT % 279))
                                        (QREFELT % 277))
                              (QREFELT % 278))
                             (QREFELT % 121)))))
                    (EXIT (PROGN (LETT #1# |x|) (GO #2=#:G1334)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |FSPECF;iiconjugate;2F;252!0| ((|k| NIL) (% NIL))
        (SEQ
         (COND
          ((SPADCALL (SPADCALL |k| (QREFELT % 260)) (|spadConstant| % 261)
                     (QREFELT % 262))
           (EXIT (|FSPECF;iconjugate| (SPADCALL |k| (QREFELT % 263)) %)))
          ((SPADCALL (SPADCALL |k| (QREFELT % 260)) (|spadConstant| % 264)
                     (QREFELT % 262))
           (COND
            ((QEQCAR (SPADCALL (SPADCALL |k| (QREFELT % 263)) (QREFELT % 256))
                     0)
             (EXIT (|FSPECF;iconjugate| (SPADCALL |k| (QREFELT % 263)) %))))))
         (EXIT (SPADCALL (ELT % 265) |k| (QREFELT % 267))))) 

(SDEFUN |FSPECF;iiGamma;2F;253| ((|x| (F)) (% (F)))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT % 280)))
                    (EXIT
                     (COND ((QEQCAR |r| 1) (|FSPECF;iGamma| |x| %))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT % 281))
                                      (QREFELT % 253)))))))) 

(SDEFUN |FSPECF;iiBeta;LF;254| ((|l| (|List| F)) (% (F)))
        (SPROG ((#1=#:G1348 NIL) (|s| #2=(|Union| R "failed")) (|r| #2#))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |r| (SPADCALL (|SPADfirst| |l|) (QREFELT % 280)))
                       (EXIT
                        (COND
                         ((QEQCAR |r| 1)
                          (PROGN
                           (LETT #1#
                                 (|FSPECF;iBeta| (|SPADfirst| |l|)
                                  (SPADCALL |l| (QREFELT % 243)) %))
                           (GO #3=#:G1346)))
                         ('T
                          (SEQ
                           (LETT |s|
                                 (SPADCALL (SPADCALL |l| (QREFELT % 243))
                                           (QREFELT % 280)))
                           (EXIT
                            (COND
                             ((QEQCAR |s| 1)
                              (PROGN
                               (LETT #1#
                                     (|FSPECF;iBeta| (|SPADfirst| |l|)
                                      (SPADCALL |l| (QREFELT % 243)) %))
                               (GO #3#))))))))))
                  (EXIT
                   (SPADCALL (SPADCALL (QCDR |r|) (QCDR |s|) (QREFELT % 283))
                             (QREFELT % 253)))))
                #3# (EXIT #1#)))) 

(SDEFUN |FSPECF;iidigamma;2F;255| ((|x| (F)) (% (F)))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT % 280)))
                    (EXIT
                     (COND ((QEQCAR |r| 1) (|FSPECF;idigamma| |x| %))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT % 285))
                                      (QREFELT % 253)))))))) 

(SDEFUN |FSPECF;iipolygamma;LF;256| ((|l| (|List| F)) (% (F)))
        (SPROG ((#1=#:G1361 NIL) (|r| #2=(|Union| R "failed")) (|s| #2#))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |s| (SPADCALL (|SPADfirst| |l|) (QREFELT % 280)))
                       (EXIT
                        (COND
                         ((QEQCAR |s| 1)
                          (PROGN
                           (LETT #1#
                                 (|FSPECF;iiipolygamma| (|SPADfirst| |l|)
                                  (SPADCALL |l| (QREFELT % 243)) %))
                           (GO #3=#:G1359)))
                         ('T
                          (SEQ
                           (LETT |r|
                                 (SPADCALL (SPADCALL |l| (QREFELT % 243))
                                           (QREFELT % 280)))
                           (EXIT
                            (COND
                             ((QEQCAR |r| 1)
                              (PROGN
                               (LETT #1#
                                     (|FSPECF;iiipolygamma| (|SPADfirst| |l|)
                                      (SPADCALL |l| (QREFELT % 243)) %))
                               (GO #3#))))))))))
                  (EXIT
                   (SPADCALL (SPADCALL (QCDR |s|) (QCDR |r|) (QREFELT % 287))
                             (QREFELT % 253)))))
                #3# (EXIT #1#)))) 

(SDEFUN |FSPECF;iiBesselJ;LF;257| ((|l| (|List| F)) (% (F)))
        (SPROG ((#1=#:G1369 NIL) (|s| #2=(|Union| R "failed")) (|r| #2#))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |r| (SPADCALL (|SPADfirst| |l|) (QREFELT % 280)))
                       (EXIT
                        (COND
                         ((QEQCAR |r| 1)
                          (PROGN
                           (LETT #1#
                                 (|FSPECF;iiiBesselJ| (|SPADfirst| |l|)
                                  (SPADCALL |l| (QREFELT % 243)) %))
                           (GO #3=#:G1367)))
                         ('T
                          (SEQ
                           (LETT |s|
                                 (SPADCALL (SPADCALL |l| (QREFELT % 243))
                                           (QREFELT % 280)))
                           (EXIT
                            (COND
                             ((QEQCAR |s| 1)
                              (PROGN
                               (LETT #1#
                                     (|FSPECF;iiiBesselJ| (|SPADfirst| |l|)
                                      (SPADCALL |l| (QREFELT % 243)) %))
                               (GO #3#))))))))))
                  (EXIT
                   (SPADCALL (SPADCALL (QCDR |r|) (QCDR |s|) (QREFELT % 289))
                             (QREFELT % 253)))))
                #3# (EXIT #1#)))) 

(SDEFUN |FSPECF;iiBesselY;LF;258| ((|l| (|List| F)) (% (F)))
        (SPROG ((#1=#:G1377 NIL) (|s| #2=(|Union| R "failed")) (|r| #2#))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |r| (SPADCALL (|SPADfirst| |l|) (QREFELT % 280)))
                       (EXIT
                        (COND
                         ((QEQCAR |r| 1)
                          (PROGN
                           (LETT #1#
                                 (|FSPECF;iiiBesselY| (|SPADfirst| |l|)
                                  (SPADCALL |l| (QREFELT % 243)) %))
                           (GO #3=#:G1375)))
                         ('T
                          (SEQ
                           (LETT |s|
                                 (SPADCALL (SPADCALL |l| (QREFELT % 243))
                                           (QREFELT % 280)))
                           (EXIT
                            (COND
                             ((QEQCAR |s| 1)
                              (PROGN
                               (LETT #1#
                                     (|FSPECF;iiiBesselY| (|SPADfirst| |l|)
                                      (SPADCALL |l| (QREFELT % 243)) %))
                               (GO #3#))))))))))
                  (EXIT
                   (SPADCALL (SPADCALL (QCDR |r|) (QCDR |s|) (QREFELT % 291))
                             (QREFELT % 253)))))
                #3# (EXIT #1#)))) 

(SDEFUN |FSPECF;iiBesselI;LF;259| ((|l| (|List| F)) (% (F)))
        (SPROG ((#1=#:G1385 NIL) (|s| #2=(|Union| R "failed")) (|r| #2#))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |r| (SPADCALL (|SPADfirst| |l|) (QREFELT % 280)))
                       (EXIT
                        (COND
                         ((QEQCAR |r| 1)
                          (PROGN
                           (LETT #1#
                                 (|FSPECF;iiiBesselI| (|SPADfirst| |l|)
                                  (SPADCALL |l| (QREFELT % 243)) %))
                           (GO #3=#:G1383)))
                         ('T
                          (SEQ
                           (LETT |s|
                                 (SPADCALL (SPADCALL |l| (QREFELT % 243))
                                           (QREFELT % 280)))
                           (EXIT
                            (COND
                             ((QEQCAR |s| 1)
                              (PROGN
                               (LETT #1#
                                     (|FSPECF;iiiBesselI| (|SPADfirst| |l|)
                                      (SPADCALL |l| (QREFELT % 243)) %))
                               (GO #3#))))))))))
                  (EXIT
                   (SPADCALL (SPADCALL (QCDR |r|) (QCDR |s|) (QREFELT % 293))
                             (QREFELT % 253)))))
                #3# (EXIT #1#)))) 

(SDEFUN |FSPECF;iiBesselK;LF;260| ((|l| (|List| F)) (% (F)))
        (SPROG ((#1=#:G1393 NIL) (|s| #2=(|Union| R "failed")) (|r| #2#))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |r| (SPADCALL (|SPADfirst| |l|) (QREFELT % 280)))
                       (EXIT
                        (COND
                         ((QEQCAR |r| 1)
                          (PROGN
                           (LETT #1#
                                 (|FSPECF;iiiBesselK| (|SPADfirst| |l|)
                                  (SPADCALL |l| (QREFELT % 243)) %))
                           (GO #3=#:G1391)))
                         ('T
                          (SEQ
                           (LETT |s|
                                 (SPADCALL (SPADCALL |l| (QREFELT % 243))
                                           (QREFELT % 280)))
                           (EXIT
                            (COND
                             ((QEQCAR |s| 1)
                              (PROGN
                               (LETT #1#
                                     (|FSPECF;iiiBesselK| (|SPADfirst| |l|)
                                      (SPADCALL |l| (QREFELT % 243)) %))
                               (GO #3#))))))))))
                  (EXIT
                   (SPADCALL (SPADCALL (QCDR |r|) (QCDR |s|) (QREFELT % 295))
                             (QREFELT % 253)))))
                #3# (EXIT #1#)))) 

(SDEFUN |FSPECF;iiAiryAi;2F;261| ((|x| (F)) (% (F)))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT % 280)))
                    (EXIT
                     (COND ((QEQCAR |r| 1) (SPADCALL |x| (QREFELT % 234)))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT % 297))
                                      (QREFELT % 253)))))))) 

(SDEFUN |FSPECF;iiAiryAiPrime;2F;262| ((|x| (F)) (% (F)))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT % 280)))
                    (EXIT
                     (COND ((QEQCAR |r| 1) (SPADCALL |x| (QREFELT % 235)))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT % 299))
                                      (QREFELT % 253)))))))) 

(SDEFUN |FSPECF;iiAiryBi;2F;263| ((|x| (F)) (% (F)))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT % 280)))
                    (EXIT
                     (COND ((QEQCAR |r| 1) (SPADCALL |x| (QREFELT % 236)))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT % 301))
                                      (QREFELT % 253)))))))) 

(SDEFUN |FSPECF;iiAiryBiPrime;2F;264| ((|x| (F)) (% (F)))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT % 280)))
                    (EXIT
                     (COND ((QEQCAR |r| 1) (SPADCALL |x| (QREFELT % 237)))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT % 303))
                                      (QREFELT % 253)))))))) 

(SDEFUN |FSPECF;iiGamma;2F;265| ((|x| (F)) (% (F)))
        (SPROG ((#1=#:G1421 NIL) (|r| (|Union| (|Integer|) "failed")))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |r| (SPADCALL |x| (QREFELT % 306)))
                       (EXIT
                        (COND
                         ((QEQCAR |r| 0)
                          (COND
                           ((>= (QCDR |r|) 1)
                            (PROGN
                             (LETT #1#
                                   (SPADCALL
                                    (SPADCALL (- (QCDR |r|) 1) (QREFELT % 307))
                                    (QREFELT % 88)))
                             (GO #2=#:G1419))))))))
                  (EXIT (|FSPECF;iGamma| |x| %))))
                #2# (EXIT #1#)))) 

(SDEFUN |FSPECF;iiGamma;2F;266| ((|x| (F)) (% (F))) (|FSPECF;iGamma| |x| %)) 

(SDEFUN |FSPECF;iiBeta;LF;267| ((|l| (|List| F)) (% (F)))
        (|FSPECF;iBeta| (|SPADfirst| |l|) (SPADCALL |l| (QREFELT % 243)) %)) 

(SDEFUN |FSPECF;iidigamma;2F;268| ((|x| (F)) (% (F))) (|FSPECF;idigamma| |x| %)) 

(SDEFUN |FSPECF;iipolygamma;LF;269| ((|l| (|List| F)) (% (F)))
        (|FSPECF;iiipolygamma| (|SPADfirst| |l|) (SPADCALL |l| (QREFELT % 243))
         %)) 

(SDEFUN |FSPECF;iiBesselJ;LF;270| ((|l| (|List| F)) (% (F)))
        (|FSPECF;iiiBesselJ| (|SPADfirst| |l|) (SPADCALL |l| (QREFELT % 243))
         %)) 

(SDEFUN |FSPECF;iiBesselY;LF;271| ((|l| (|List| F)) (% (F)))
        (|FSPECF;iiiBesselY| (|SPADfirst| |l|) (SPADCALL |l| (QREFELT % 243))
         %)) 

(SDEFUN |FSPECF;iiBesselI;LF;272| ((|l| (|List| F)) (% (F)))
        (|FSPECF;iiiBesselI| (|SPADfirst| |l|) (SPADCALL |l| (QREFELT % 243))
         %)) 

(SDEFUN |FSPECF;iiBesselK;LF;273| ((|l| (|List| F)) (% (F)))
        (|FSPECF;iiiBesselK| (|SPADfirst| |l|) (SPADCALL |l| (QREFELT % 243))
         %)) 

(SDEFUN |FSPECF;iiAiryAi;2F;274| ((|x| (F)) (% (F)))
        (SPADCALL |x| (QREFELT % 234))) 

(SDEFUN |FSPECF;iiAiryAiPrime;2F;275| ((|x| (F)) (% (F)))
        (SPADCALL |x| (QREFELT % 235))) 

(SDEFUN |FSPECF;iiAiryBi;2F;276| ((|x| (F)) (% (F)))
        (SPADCALL |x| (QREFELT % 236))) 

(SDEFUN |FSPECF;iiAiryBiPrime;2F;277| ((|x| (F)) (% (F)))
        (SPADCALL |x| (QREFELT % 237))) 

(SDEFUN |FSPECF;iiWeierstrassP| ((|l| (|List| F)) (% (F)))
        (|FSPECF;iWeierstrassP| (|SPADfirst| |l|)
         (SPADCALL |l| (QREFELT % 243)) (SPADCALL |l| (QREFELT % 308)) %)) 

(SDEFUN |FSPECF;iiWeierstrassPPrime| ((|l| (|List| F)) (% (F)))
        (|FSPECF;iWeierstrassPPrime| (|SPADfirst| |l|)
         (SPADCALL |l| (QREFELT % 243)) (SPADCALL |l| (QREFELT % 308)) %)) 

(SDEFUN |FSPECF;iiWeierstrassSigma| ((|l| (|List| F)) (% (F)))
        (|FSPECF;iWeierstrassSigma| (|SPADfirst| |l|)
         (SPADCALL |l| (QREFELT % 243)) (SPADCALL |l| (QREFELT % 308)) %)) 

(SDEFUN |FSPECF;iiWeierstrassZeta| ((|l| (|List| F)) (% (F)))
        (|FSPECF;iWeierstrassZeta| (|SPADfirst| |l|)
         (SPADCALL |l| (QREFELT % 243)) (SPADCALL |l| (QREFELT % 308)) %)) 

(SDEFUN |FSPECF;diff1| ((|op| (|BasicOperator|)) (|n| (F)) (|x| (F)) (% (F)))
        (SPROG ((|dm| (F)))
               (SEQ
                (LETT |dm|
                      (SPADCALL (SPADCALL (QREFELT % 108)) (QREFELT % 109)))
                (EXIT
                 (SPADCALL (QREFELT % 96)
                           (LIST (SPADCALL |op| (LIST |dm| |x|) (QREFELT % 92))
                                 |dm| |n|)
                           (QREFELT % 111)))))) 

(SDEFUN |FSPECF;iBesselJ| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (SPROG ((|x| (F)) (|n| (F)))
               (SEQ (LETT |n| (|SPADfirst| |l|))
                    (LETT |x| (SPADCALL |l| (QREFELT % 243)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL (SPADCALL |n| |t| (QREFELT % 110))
                                (|FSPECF;diff1| (QREFELT % 26) |n| |x| %)
                                (QREFELT % 112))
                      (SPADCALL
                       (SPADCALL (SPADCALL |x| |t| (QREFELT % 110))
                                 (QREFELT % 99) (QREFELT % 112))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL |n| (|spadConstant| % 86) (QREFELT % 120))
                         |x| (QREFELT % 66))
                        (SPADCALL
                         (SPADCALL |n| (|spadConstant| % 86) (QREFELT % 113))
                         |x| (QREFELT % 66))
                        (QREFELT % 120))
                       (QREFELT % 112))
                      (QREFELT % 113)))))) 

(SDEFUN |FSPECF;iBesselY| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (SPROG ((|x| (F)) (|n| (F)))
               (SEQ (LETT |n| (|SPADfirst| |l|))
                    (LETT |x| (SPADCALL |l| (QREFELT % 243)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL (SPADCALL |n| |t| (QREFELT % 110))
                                (|FSPECF;diff1| (QREFELT % 27) |n| |x| %)
                                (QREFELT % 112))
                      (SPADCALL
                       (SPADCALL (SPADCALL |x| |t| (QREFELT % 110))
                                 (QREFELT % 99) (QREFELT % 112))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL |n| (|spadConstant| % 86) (QREFELT % 120))
                         |x| (QREFELT % 67))
                        (SPADCALL
                         (SPADCALL |n| (|spadConstant| % 86) (QREFELT % 113))
                         |x| (QREFELT % 67))
                        (QREFELT % 120))
                       (QREFELT % 112))
                      (QREFELT % 113)))))) 

(SDEFUN |FSPECF;iBesselI| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (SPROG ((|x| (F)) (|n| (F)))
               (SEQ (LETT |n| (|SPADfirst| |l|))
                    (LETT |x| (SPADCALL |l| (QREFELT % 243)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL (SPADCALL |n| |t| (QREFELT % 110))
                                (|FSPECF;diff1| (QREFELT % 28) |n| |x| %)
                                (QREFELT % 112))
                      (SPADCALL
                       (SPADCALL (SPADCALL |x| |t| (QREFELT % 110))
                                 (QREFELT % 99) (QREFELT % 112))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL |n| (|spadConstant| % 86) (QREFELT % 120))
                         |x| (QREFELT % 68))
                        (SPADCALL
                         (SPADCALL |n| (|spadConstant| % 86) (QREFELT % 113))
                         |x| (QREFELT % 68))
                        (QREFELT % 113))
                       (QREFELT % 112))
                      (QREFELT % 113)))))) 

(SDEFUN |FSPECF;iBesselK| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (SPROG ((|x| (F)) (|n| (F)))
               (SEQ (LETT |n| (|SPADfirst| |l|))
                    (LETT |x| (SPADCALL |l| (QREFELT % 243)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL (SPADCALL |n| |t| (QREFELT % 110))
                                (|FSPECF;diff1| (QREFELT % 29) |n| |x| %)
                                (QREFELT % 112))
                      (SPADCALL
                       (SPADCALL (SPADCALL |x| |t| (QREFELT % 110))
                                 (QREFELT % 99) (QREFELT % 112))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL |n| (|spadConstant| % 86) (QREFELT % 120))
                         |x| (QREFELT % 69))
                        (SPADCALL
                         (SPADCALL |n| (|spadConstant| % 86) (QREFELT % 113))
                         |x| (QREFELT % 69))
                        (QREFELT % 113))
                       (QREFELT % 112))
                      (QREFELT % 120)))))) 

(SDEFUN |FSPECF;dPolylog| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (SPROG ((|x| (F)) (|s| (F)))
               (SEQ (LETT |s| (|SPADfirst| |l|))
                    (LETT |x| (SPADCALL |l| (QREFELT % 243)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL (SPADCALL |s| |t| (QREFELT % 110))
                                (|FSPECF;diff1| (QREFELT % 35) |s| |x| %)
                                (QREFELT % 112))
                      (SPADCALL
                       (SPADCALL (SPADCALL |x| |t| (QREFELT % 110))
                                 (SPADCALL
                                  (SPADCALL |s| (|spadConstant| % 86)
                                            (QREFELT % 120))
                                  |x| (QREFELT % 75))
                                 (QREFELT % 112))
                       |x| (QREFELT % 121))
                      (QREFELT % 113)))))) 

(SDEFUN |FSPECF;ipolygamma| ((|l| (|List| F)) (|x| (|Symbol|)) (% (F)))
        (SPROG ((|y| (F)) (|n| (F)))
               (SEQ
                (COND
                 ((SPADCALL |x| (SPADCALL (|SPADfirst| |l|) (QREFELT % 311))
                            (QREFELT % 312))
                  (|error|
                   "cannot differentiate polygamma with respect to the first argument"))
                 ('T
                  (SEQ (LETT |n| (|SPADfirst| |l|))
                       (LETT |y| (SPADCALL |l| (QREFELT % 243)))
                       (EXIT
                        (SPADCALL (SPADCALL |y| |x| (QREFELT % 110))
                                  (SPADCALL
                                   (SPADCALL |n| (|spadConstant| % 86)
                                             (QREFELT % 113))
                                   |y| (QREFELT % 65))
                                  (QREFELT % 112))))))))) 

(SDEFUN |FSPECF;iBetaGrad1| ((|l| (|List| F)) (% (F)))
        (SPROG ((|y| (F)) (|x| (F)))
               (SEQ (LETT |x| (|SPADfirst| |l|))
                    (LETT |y| (SPADCALL |l| (QREFELT % 243)))
                    (EXIT
                     (SPADCALL (SPADCALL |x| |y| (QREFELT % 63))
                               (SPADCALL (SPADCALL |x| (QREFELT % 64))
                                         (SPADCALL
                                          (SPADCALL |x| |y| (QREFELT % 113))
                                          (QREFELT % 64))
                                         (QREFELT % 120))
                               (QREFELT % 112)))))) 

(SDEFUN |FSPECF;iBetaGrad2| ((|l| (|List| F)) (% (F)))
        (SPROG ((|y| (F)) (|x| (F)))
               (SEQ (LETT |x| (|SPADfirst| |l|))
                    (LETT |y| (SPADCALL |l| (QREFELT % 243)))
                    (EXIT
                     (SPADCALL (SPADCALL |x| |y| (QREFELT % 63))
                               (SPADCALL (SPADCALL |y| (QREFELT % 64))
                                         (SPADCALL
                                          (SPADCALL |x| |y| (QREFELT % 113))
                                          (QREFELT % 64))
                                         (QREFELT % 120))
                               (QREFELT % 112)))))) 

(SDEFUN |FSPECF;iGamma2| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (SPROG ((|x| (F)) (|a| (F)))
               (SEQ (LETT |a| (|SPADfirst| |l|))
                    (LETT |x| (SPADCALL |l| (QREFELT % 243)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL (SPADCALL |a| |t| (QREFELT % 110))
                                (|FSPECF;diff1| (QREFELT % 22) |a| |x| %)
                                (QREFELT % 112))
                      (SPADCALL
                       (SPADCALL (SPADCALL |x| |t| (QREFELT % 110))
                                 (SPADCALL |x|
                                           (SPADCALL |a| (|spadConstant| % 86)
                                                     (QREFELT % 120))
                                           (QREFELT % 144))
                                 (QREFELT % 112))
                       (SPADCALL (SPADCALL |x| (QREFELT % 122))
                                 (QREFELT % 238))
                       (QREFELT % 112))
                      (QREFELT % 120)))))) 

(SDEFUN |FSPECF;inGamma2| ((|li| (|List| (|InputForm|))) (% (|InputForm|)))
        (SPADCALL (CONS (SPADCALL '|Gamma| (QREFELT % 183)) |li|)
                  (QREFELT % 184))) 

(SDEFUN |FSPECF;dLambertW| ((|x| (F)) (% (F)))
        (SPROG ((|lw| (F)))
               (SEQ (LETT |lw| (SPADCALL |x| (QREFELT % 74)))
                    (EXIT
                     (SPADCALL |lw|
                               (SPADCALL |x|
                                         (SPADCALL (|spadConstant| % 86) |lw|
                                                   (QREFELT % 113))
                                         (QREFELT % 112))
                               (QREFELT % 121)))))) 

(SDEFUN |FSPECF;iWeierstrassPGrad1| ((|l| (|List| F)) (% (F)))
        (SPROG ((|wp| (F)) (|delta| (F)) (|x| (F)) (|g3| (F)) (|g2| (F)))
               (SEQ (LETT |g2| (|SPADfirst| |l|))
                    (LETT |g3| (SPADCALL |l| (QREFELT % 243)))
                    (LETT |x| (SPADCALL |l| (QREFELT % 308)))
                    (LETT |delta|
                          (SPADCALL (SPADCALL |g2| 3 (QREFELT % 119))
                                    (SPADCALL 27
                                              (SPADCALL |g3| 2 (QREFELT % 119))
                                              (QREFELT % 104))
                                    (QREFELT % 120)))
                    (LETT |wp| (SPADCALL |g2| |g3| |x| (QREFELT % 77)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (SPADCALL |g2| |g3| |x| (QREFELT % 78))
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL 9 (QREFELT % 99)
                                                 (QREFELT % 104))
                                       |g3| (QREFELT % 112))
                                      (SPADCALL |g2| |g3| |x| (QREFELT % 80))
                                      (QREFELT % 112))
                                     (QREFELT % 122))
                                    (SPADCALL
                                     (SPADCALL (QREFELT % 101)
                                               (SPADCALL |g2| 2
                                                         (QREFELT % 119))
                                               (QREFELT % 112))
                                     |x| (QREFELT % 112))
                                    (QREFELT % 113))
                                   (QREFELT % 112))
                         (SPADCALL (SPADCALL 9 |g3| (QREFELT % 104))
                                   (SPADCALL |wp| 2 (QREFELT % 119))
                                   (QREFELT % 112))
                         (QREFELT % 120))
                        (SPADCALL
                         (SPADCALL (QREFELT % 99)
                                   (SPADCALL |g2| 2 (QREFELT % 119))
                                   (QREFELT % 112))
                         |wp| (QREFELT % 112))
                        (QREFELT % 113))
                       (SPADCALL
                        (SPADCALL (SPADCALL 3 (QREFELT % 99) (QREFELT % 104))
                                  |g2| (QREFELT % 112))
                        |g3| (QREFELT % 112))
                       (QREFELT % 113))
                      |delta| (QREFELT % 121)))))) 

(SDEFUN |FSPECF;iWeierstrassPGrad2| ((|l| (|List| F)) (% (F)))
        (SPROG ((|wp| (F)) (|delta| (F)) (|x| (F)) (|g3| (F)) (|g2| (F)))
               (SEQ (LETT |g2| (|SPADfirst| |l|))
                    (LETT |g3| (SPADCALL |l| (QREFELT % 243)))
                    (LETT |x| (SPADCALL |l| (QREFELT % 308)))
                    (LETT |delta|
                          (SPADCALL (SPADCALL |g2| 3 (QREFELT % 119))
                                    (SPADCALL 27
                                              (SPADCALL |g3| 2 (QREFELT % 119))
                                              (QREFELT % 104))
                                    (QREFELT % 120)))
                    (LETT |wp| (SPADCALL |g2| |g3| |x| (QREFELT % 77)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (SPADCALL |g2| |g3| |x| (QREFELT % 78))
                                   (SPADCALL
                                    (SPADCALL (SPADCALL 3 |g2| (QREFELT % 104))
                                              (SPADCALL |g2| |g3| |x|
                                                        (QREFELT % 80))
                                              (QREFELT % 112))
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL 9 (QREFELT % 99)
                                                (QREFELT % 104))
                                      |g3| (QREFELT % 112))
                                     |x| (QREFELT % 112))
                                    (QREFELT % 120))
                                   (QREFELT % 112))
                         (SPADCALL (SPADCALL 6 |g2| (QREFELT % 104))
                                   (SPADCALL |wp| 2 (QREFELT % 119))
                                   (QREFELT % 112))
                         (QREFELT % 113))
                        (SPADCALL (SPADCALL 9 |g3| (QREFELT % 104)) |wp|
                                  (QREFELT % 112))
                        (QREFELT % 120))
                       (SPADCALL |g2| 2 (QREFELT % 119)) (QREFELT % 120))
                      |delta| (QREFELT % 121)))))) 

(SDEFUN |FSPECF;iWeierstrassPGrad3| ((|l| (|List| F)) (% (F)))
        (SPADCALL (|SPADfirst| |l|) (SPADCALL |l| (QREFELT % 243))
                  (SPADCALL |l| (QREFELT % 308)) (QREFELT % 78))) 

(SDEFUN |FSPECF;iWeierstrassPPrimeGrad1| ((|l| (|List| F)) (% (F)))
        (SPROG
         ((|wpp2| (F)) (|wpp| (F)) (|wp| (F)) (|delta| (F)) (|x| (F))
          (|g3| (F)) (|g2| (F)))
         (SEQ (LETT |g2| (|SPADfirst| |l|))
              (LETT |g3| (SPADCALL |l| (QREFELT % 243)))
              (LETT |x| (SPADCALL |l| (QREFELT % 308)))
              (LETT |delta|
                    (SPADCALL (SPADCALL |g2| 3 (QREFELT % 119))
                              (SPADCALL 27 (SPADCALL |g3| 2 (QREFELT % 119))
                                        (QREFELT % 104))
                              (QREFELT % 120)))
              (LETT |wp| (SPADCALL |g2| |g3| |x| (QREFELT % 77)))
              (LETT |wpp| (SPADCALL |g2| |g3| |x| (QREFELT % 78)))
              (LETT |wpp2|
                    (SPADCALL
                     (SPADCALL 6 (SPADCALL |wp| 2 (QREFELT % 119))
                               (QREFELT % 104))
                     (SPADCALL (QREFELT % 99) |g2| (QREFELT % 112))
                     (QREFELT % 120)))
              (EXIT
               (SPADCALL
                (SPADCALL
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL |wpp2|
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL 9 (QREFELT % 99) (QREFELT % 104))
                                 |g3| (QREFELT % 112))
                                (SPADCALL |g2| |g3| |x| (QREFELT % 80))
                                (QREFELT % 112))
                               (QREFELT % 122))
                              (SPADCALL
                               (SPADCALL (QREFELT % 101)
                                         (SPADCALL |g2| 2 (QREFELT % 119))
                                         (QREFELT % 112))
                               |x| (QREFELT % 112))
                              (QREFELT % 113))
                             (QREFELT % 112))
                   (SPADCALL |wpp|
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL 9 (QREFELT % 99) (QREFELT % 104))
                                |g3| (QREFELT % 112))
                               |wp| (QREFELT % 112))
                              (SPADCALL (QREFELT % 101)
                                        (SPADCALL |g2| 2 (QREFELT % 119))
                                        (QREFELT % 112))
                              (QREFELT % 113))
                             (QREFELT % 112))
                   (QREFELT % 113))
                  (SPADCALL
                   (SPADCALL (SPADCALL 18 |g3| (QREFELT % 104)) |wp|
                             (QREFELT % 112))
                   |wpp| (QREFELT % 112))
                  (QREFELT % 120))
                 (SPADCALL
                  (SPADCALL (QREFELT % 99) (SPADCALL |g2| 2 (QREFELT % 119))
                            (QREFELT % 112))
                  |wpp| (QREFELT % 112))
                 (QREFELT % 113))
                |delta| (QREFELT % 121)))))) 

(SDEFUN |FSPECF;iWeierstrassPPrimeGrad2| ((|l| (|List| F)) (% (F)))
        (SPROG
         ((|wpp2| (F)) (|wpp| (F)) (|wp| (F)) (|delta| (F)) (|x| (F))
          (|g3| (F)) (|g2| (F)))
         (SEQ (LETT |g2| (|SPADfirst| |l|))
              (LETT |g3| (SPADCALL |l| (QREFELT % 243)))
              (LETT |x| (SPADCALL |l| (QREFELT % 308)))
              (LETT |delta|
                    (SPADCALL (SPADCALL |g2| 3 (QREFELT % 119))
                              (SPADCALL 27 (SPADCALL |g3| 2 (QREFELT % 119))
                                        (QREFELT % 104))
                              (QREFELT % 120)))
              (LETT |wp| (SPADCALL |g2| |g3| |x| (QREFELT % 77)))
              (LETT |wpp| (SPADCALL |g2| |g3| |x| (QREFELT % 78)))
              (LETT |wpp2|
                    (SPADCALL
                     (SPADCALL 6 (SPADCALL |wp| 2 (QREFELT % 119))
                               (QREFELT % 104))
                     (SPADCALL (QREFELT % 99) |g2| (QREFELT % 112))
                     (QREFELT % 120)))
              (EXIT
               (SPADCALL
                (SPADCALL
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL |wpp2|
                             (SPADCALL
                              (SPADCALL (SPADCALL 3 |g2| (QREFELT % 104))
                                        (SPADCALL |g2| |g3| |x| (QREFELT % 80))
                                        (QREFELT % 112))
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL 9 (QREFELT % 99) (QREFELT % 104))
                                |g3| (QREFELT % 112))
                               |x| (QREFELT % 112))
                              (QREFELT % 120))
                             (QREFELT % 112))
                   (SPADCALL |wpp|
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL (SPADCALL 3 |g2| (QREFELT % 104)) |wp|
                                         (QREFELT % 112))
                               (QREFELT % 122))
                              (SPADCALL
                               (SPADCALL 9 (QREFELT % 99) (QREFELT % 104)) |g3|
                               (QREFELT % 112))
                              (QREFELT % 120))
                             (QREFELT % 112))
                   (QREFELT % 113))
                  (SPADCALL
                   (SPADCALL (SPADCALL 12 |g2| (QREFELT % 104)) |wp|
                             (QREFELT % 112))
                   |wpp| (QREFELT % 112))
                  (QREFELT % 113))
                 (SPADCALL (SPADCALL 9 |g3| (QREFELT % 104)) |wpp|
                           (QREFELT % 112))
                 (QREFELT % 120))
                |delta| (QREFELT % 121)))))) 

(SDEFUN |FSPECF;iWeierstrassPPrimeGrad3| ((|l| (|List| F)) (% (F)))
        (SPROG ((|g2| (F)))
               (SEQ (LETT |g2| (|SPADfirst| |l|))
                    (EXIT
                     (SPADCALL
                      (SPADCALL 6
                                (SPADCALL
                                 (SPADCALL |g2| (SPADCALL |l| (QREFELT % 243))
                                           (SPADCALL |l| (QREFELT % 308))
                                           (QREFELT % 77))
                                 2 (QREFELT % 140))
                                (QREFELT % 104))
                      (SPADCALL (QREFELT % 99) |g2| (QREFELT % 112))
                      (QREFELT % 120)))))) 

(SDEFUN |FSPECF;iWeierstrassSigmaGrad1| ((|l| (|List| F)) (% (F)))
        (SPROG
         ((|wsp2| (F)) (|wsp| (F)) (|wz| (F)) (|ws| (F)) (|delta| (F))
          (|x| (F)) (|g3| (F)) (|g2| (F)))
         (SEQ (LETT |g2| (|SPADfirst| |l|))
              (LETT |g3| (SPADCALL |l| (QREFELT % 243)))
              (LETT |x| (SPADCALL |l| (QREFELT % 308)))
              (LETT |delta|
                    (SPADCALL (SPADCALL |g2| 3 (QREFELT % 119))
                              (SPADCALL 27 (SPADCALL |g3| 2 (QREFELT % 119))
                                        (QREFELT % 104))
                              (QREFELT % 120)))
              (LETT |ws| (SPADCALL |g2| |g3| |x| (QREFELT % 79)))
              (LETT |wz| (SPADCALL |g2| |g3| |x| (QREFELT % 80)))
              (LETT |wsp| (SPADCALL |wz| |ws| (QREFELT % 112)))
              (LETT |wsp2|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (SPADCALL |g2| |g3| |x| (QREFELT % 77)) |ws|
                                (QREFELT % 112))
                      (QREFELT % 122))
                     (SPADCALL (SPADCALL |wz| 2 (QREFELT % 119)) |ws|
                               (QREFELT % 112))
                     (QREFELT % 113)))
              (EXIT
               (SPADCALL
                (SPADCALL (QREFELT % 101)
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (SPADCALL 9 |g3| (QREFELT % 104))
                                        |wsp2| (QREFELT % 112))
                              (QREFELT % 122))
                             (SPADCALL (SPADCALL |g2| 2 (QREFELT % 119)) |ws|
                                       (QREFELT % 112))
                             (QREFELT % 120))
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL 3 (QREFELT % 101) (QREFELT % 104))
                                |g2| (QREFELT % 112))
                               |g3| (QREFELT % 112))
                              (SPADCALL |x| 2 (QREFELT % 119)) (QREFELT % 112))
                             |ws| (QREFELT % 112))
                            (QREFELT % 120))
                           (SPADCALL
                            (SPADCALL (SPADCALL |g2| 2 (QREFELT % 119)) |x|
                                      (QREFELT % 112))
                            |wsp| (QREFELT % 112))
                           (QREFELT % 113))
                          (QREFELT % 112))
                |delta| (QREFELT % 121)))))) 

(SDEFUN |FSPECF;iWeierstrassSigmaGrad2| ((|l| (|List| F)) (% (F)))
        (SPROG
         ((|wsp2| (F)) (|wsp| (F)) (|wz| (F)) (|ws| (F)) (|delta| (F))
          (|x| (F)) (|g3| (F)) (|g2| (F)))
         (SEQ (LETT |g2| (|SPADfirst| |l|))
              (LETT |g3| (SPADCALL |l| (QREFELT % 243)))
              (LETT |x| (SPADCALL |l| (QREFELT % 308)))
              (LETT |delta|
                    (SPADCALL (SPADCALL |g2| 3 (QREFELT % 119))
                              (SPADCALL 27 (SPADCALL |g3| 2 (QREFELT % 119))
                                        (QREFELT % 104))
                              (QREFELT % 120)))
              (LETT |ws| (SPADCALL |g2| |g3| |x| (QREFELT % 79)))
              (LETT |wz| (SPADCALL |g2| |g3| |x| (QREFELT % 80)))
              (LETT |wsp| (SPADCALL |wz| |ws| (QREFELT % 112)))
              (LETT |wsp2|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (SPADCALL |g2| |g3| |x| (QREFELT % 77)) |ws|
                                (QREFELT % 112))
                      (QREFELT % 122))
                     (SPADCALL (SPADCALL |wz| 2 (QREFELT % 119)) |ws|
                               (QREFELT % 112))
                     (QREFELT % 113)))
              (EXIT
               (SPADCALL
                (SPADCALL (QREFELT % 99)
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (SPADCALL 3 |g2| (QREFELT % 104)) |wsp2|
                                       (QREFELT % 112))
                             (SPADCALL (SPADCALL 9 |g3| (QREFELT % 104)) |ws|
                                       (QREFELT % 112))
                             (QREFELT % 113))
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (QREFELT % 101)
                                        (SPADCALL |g2| 2 (QREFELT % 119))
                                        (QREFELT % 112))
                              (SPADCALL |x| 2 (QREFELT % 119)) (QREFELT % 112))
                             |ws| (QREFELT % 112))
                            (QREFELT % 113))
                           (SPADCALL
                            (SPADCALL (SPADCALL 9 |g3| (QREFELT % 104)) |x|
                                      (QREFELT % 112))
                            |wsp| (QREFELT % 112))
                           (QREFELT % 120))
                          (QREFELT % 112))
                |delta| (QREFELT % 121)))))) 

(SDEFUN |FSPECF;iWeierstrassSigmaGrad3| ((|l| (|List| F)) (% (F)))
        (SPROG ((|x| (F)) (|g3| (F)) (|g2| (F)))
               (SEQ (LETT |g2| (|SPADfirst| |l|))
                    (LETT |g3| (SPADCALL |l| (QREFELT % 243)))
                    (LETT |x| (SPADCALL |l| (QREFELT % 308)))
                    (EXIT
                     (SPADCALL (SPADCALL |g2| |g3| |x| (QREFELT % 80))
                               (SPADCALL |g2| |g3| |x| (QREFELT % 79))
                               (QREFELT % 112)))))) 

(SDEFUN |FSPECF;iWeierstrassZetaGrad1| ((|l| (|List| F)) (% (F)))
        (SPROG ((|wp| (F)) (|delta| (F)) (|x| (F)) (|g3| (F)) (|g2| (F)))
               (SEQ (LETT |g2| (|SPADfirst| |l|))
                    (LETT |g3| (SPADCALL |l| (QREFELT % 243)))
                    (LETT |x| (SPADCALL |l| (QREFELT % 308)))
                    (LETT |delta|
                          (SPADCALL (SPADCALL |g2| 3 (QREFELT % 119))
                                    (SPADCALL 27
                                              (SPADCALL |g3| 2 (QREFELT % 119))
                                              (QREFELT % 104))
                                    (QREFELT % 120)))
                    (LETT |wp| (SPADCALL |g2| |g3| |x| (QREFELT % 77)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (QREFELT % 99)
                                   (SPADCALL |g2| |g3| |x| (QREFELT % 80))
                                   (QREFELT % 112))
                         (SPADCALL
                          (SPADCALL (SPADCALL 9 |g3| (QREFELT % 104)) |wp|
                                    (QREFELT % 112))
                          (SPADCALL (QREFELT % 99)
                                    (SPADCALL |g2| 2 (QREFELT % 119))
                                    (QREFELT % 112))
                          (QREFELT % 113))
                         (QREFELT % 112))
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (QREFELT % 99) |g2| (QREFELT % 112)) |x|
                          (QREFELT % 112))
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (QREFELT % 99) |g2| (QREFELT % 112)) |wp|
                           (QREFELT % 112))
                          (SPADCALL
                           (SPADCALL 3 (QREFELT % 101) (QREFELT % 104)) |g3|
                           (QREFELT % 112))
                          (QREFELT % 113))
                         (QREFELT % 112))
                        (QREFELT % 120))
                       (SPADCALL
                        (SPADCALL (SPADCALL 9 (QREFELT % 101) (QREFELT % 104))
                                  |g3| (QREFELT % 112))
                        (SPADCALL |g2| |g3| |x| (QREFELT % 78))
                        (QREFELT % 112))
                       (QREFELT % 113))
                      |delta| (QREFELT % 121)))))) 

(SDEFUN |FSPECF;iWeierstrassZetaGrad2| ((|l| (|List| F)) (% (F)))
        (SPROG ((|wp| (F)) (|delta| (F)) (|x| (F)) (|g3| (F)) (|g2| (F)))
               (SEQ (LETT |g2| (|SPADfirst| |l|))
                    (LETT |g3| (SPADCALL |l| (QREFELT % 243)))
                    (LETT |x| (SPADCALL |l| (QREFELT % 308)))
                    (LETT |delta|
                          (SPADCALL (SPADCALL |g2| 3 (QREFELT % 119))
                                    (SPADCALL 27
                                              (SPADCALL |g3| 2 (QREFELT % 119))
                                              (QREFELT % 104))
                                    (QREFELT % 120)))
                    (LETT |wp| (SPADCALL |g2| |g3| |x| (QREFELT % 77)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL 3 (SPADCALL |g2| |g3| |x| (QREFELT % 80))
                                    (QREFELT % 104))
                          (SPADCALL (SPADCALL |g2| |wp| (QREFELT % 112))
                                    (SPADCALL
                                     (SPADCALL 3 (QREFELT % 99)
                                               (QREFELT % 104))
                                     |g3| (QREFELT % 112))
                                    (QREFELT % 113))
                          (QREFELT % 112))
                         (QREFELT % 122))
                        (SPADCALL (SPADCALL (QREFELT % 99) |x| (QREFELT % 112))
                                  (SPADCALL
                                   (SPADCALL (SPADCALL 9 |g3| (QREFELT % 104))
                                             |wp| (QREFELT % 112))
                                   (SPADCALL (QREFELT % 99)
                                             (SPADCALL |g2| 2 (QREFELT % 119))
                                             (QREFELT % 112))
                                   (QREFELT % 113))
                                  (QREFELT % 112))
                        (QREFELT % 113))
                       (SPADCALL
                        (SPADCALL (SPADCALL 3 (QREFELT % 99) (QREFELT % 104))
                                  |g2| (QREFELT % 112))
                        (SPADCALL |g2| |g3| |x| (QREFELT % 78))
                        (QREFELT % 112))
                       (QREFELT % 120))
                      |delta| (QREFELT % 121)))))) 

(SDEFUN |FSPECF;iWeierstrassZetaGrad3| ((|l| (|List| F)) (% (F)))
        (SPADCALL
         (SPADCALL (|SPADfirst| |l|) (SPADCALL |l| (QREFELT % 243))
                   (SPADCALL |l| (QREFELT % 308)) (QREFELT % 77))
         (QREFELT % 122))) 

(SDEFUN |FSPECF;dconjugate| ((|lo| (|List| (|OutputForm|))) (% (|OutputForm|)))
        (SPADCALL (SPADCALL |lo| 1 (QREFELT % 315)) (QREFELT % 316))) 

(SDEFUN |FSPECF;get_int_listf| ((|lf| (|List| F)) (% (|List| (|Integer|))))
        (SPADCALL (ELT % 319) |lf| (QREFELT % 323))) 

(SDEFUN |FSPECF;replace_i|
        ((|lp| (|List| F)) (|v| (F)) (|i| (|NonNegativeInteger|))
         (% (|List| F)))
        (SPROG ((#1=#:G1539 NIL))
               (SPADCALL
                (SPADCALL |lp|
                          (PROG1 (LETT #1# (- |i| 1))
                            (|check_subtype2| (>= #1# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #1#))
                          (QREFELT % 324))
                (CONS |v| (SPADCALL |lp| |i| (QREFELT % 325))) (QREFELT % 90)))) 

(SDEFUN |FSPECF;iiHypergeometricF;LF;309| ((|l| (|List| F)) (% (F)))
        (SPROG
         ((#1=#:G1545 NIL) (#2=#:G1546 NIL) (|q| #3=(|Integer|)) (|p| #3#)
          (|pqi| (|List| (|Integer|))) (|pq| (|List| F))
          (|nn| (|NonNegativeInteger|)) (#4=#:G1541 NIL) (|z| (F))
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (LENGTH |l|))
                (LETT |z| (SPADCALL |l| (- |n| 2) (QREFELT % 107)))
                (COND
                 ((SPADCALL |z| (|spadConstant| % 82) (QREFELT % 84))
                  (SEQ
                   (EXIT
                    (SEQ
                     (LETT |nn|
                           (PROG1 (LETT #4# (- |n| 2))
                             (|check_subtype2| (>= #4# 0)
                                               '(|NonNegativeInteger|)
                                               '(|Integer|) #4#)))
                     (LETT |pq| (SPADCALL |l| |nn| (QREFELT % 325)))
                     (LETT |pqi| (|FSPECF;get_int_listf| |pq| %))
                     (LETT |p| (|SPADfirst| |pqi|))
                     (LETT |q| (|SPADfirst| (CDR |pqi|)))
                     (EXIT
                      (COND
                       ((<= |p| (+ |q| 1))
                        (PROGN
                         (LETT #1#
                               (PROGN
                                (LETT #2# (|spadConstant| % 86))
                                (GO #5=#:G1544)))
                         (GO #6=#:G1542)))))))
                   #6# (EXIT #1#))))
                (EXIT (SPADCALL (QREFELT % 40) |l| (QREFELT % 111)))))
          #5# (EXIT #2#)))) 

(SDEFUN |FSPECF;idvsum|
        ((|op| (|BasicOperator|)) (|n| (|Integer|)) (|l| (|List| F))
         (|x| (|Symbol|)) (% (F)))
        (SPROG
         ((|res| (F)) (|nl| (|List| F)) (|dm| (F)) (#1=#:G1554 NIL) (|i| NIL)
          (#2=#:G1555 NIL) (|a| NIL))
         (SEQ (LETT |res| (|spadConstant| % 82))
              (SEQ (LETT |a| NIL) (LETT #2# |l|) (LETT |i| 1) (LETT #1# |n|)
                   G190
                   (COND
                    ((OR (|greater_SI| |i| #1#) (ATOM #2#)
                         (PROGN (LETT |a| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |dm|
                          (SPADCALL (SPADCALL (QREFELT % 108))
                                    (QREFELT % 109)))
                    (LETT |nl| (|FSPECF;replace_i| |l| |dm| |i| %))
                    (EXIT
                     (LETT |res|
                           (SPADCALL |res|
                                     (SPADCALL
                                      (SPADCALL |a| |x| (QREFELT % 110))
                                      (SPADCALL (QREFELT % 96)
                                                (LIST
                                                 (SPADCALL |op| |nl|
                                                           (QREFELT % 92))
                                                 |dm| |a|)
                                                (QREFELT % 111))
                                      (QREFELT % 112))
                                     (QREFELT % 113)))))
                   (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #2# (CDR #2#))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |FSPECF;dvhypergeom| ((|l| #1=(|List| F)) (|x| (|Symbol|)) (% (F)))
        (SPROG
         ((|aprod| (F)) (|nl| (|List| F)) (|nl1| (|List| F)) (|nl0| (|List| F))
          (|bprod| (F)) (|b| (F)) (#2=#:G1566 NIL) (|i| NIL) (|a| (F))
          (#3=#:G1565 NIL) (|q| #4=(|Integer|)) (|p| #4#) (|z| (F))
          (|l1| (|List| F)) (|ol| #1#) (|pqi| (|List| (|Integer|)))
          (|pq| (|List| F)) (|nn| (|NonNegativeInteger|)) (#5=#:G1556 NIL)
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (LENGTH |l|))
              (LETT |nn|
                    (PROG1 (LETT #5# (- |n| 2))
                      (|check_subtype2| (>= #5# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #5#)))
              (LETT |pq| (SPADCALL |l| |nn| (QREFELT % 325)))
              (LETT |pqi| (|FSPECF;get_int_listf| |pq| %)) (LETT |ol| |l|)
              (LETT |l| (SPADCALL |l| |nn| (QREFELT % 324)))
              (LETT |l1| (REVERSE |l|)) (LETT |z| (|SPADfirst| |l1|))
              (LETT |p| (|SPADfirst| |pqi|))
              (LETT |q| (|SPADfirst| (CDR |pqi|)))
              (LETT |aprod| (|spadConstant| % 86)) (LETT |nl| NIL)
              (SEQ (LETT |i| 1) (LETT #3# |p|) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ (LETT |a| (|SPADfirst| |l|))
                        (LETT |nl|
                              (CONS
                               (SPADCALL |a| (|spadConstant| % 86)
                                         (QREFELT % 113))
                               |nl|))
                        (LETT |aprod| (SPADCALL |aprod| |a| (QREFELT % 112)))
                        (EXIT (LETT |l| (CDR |l|))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |bprod| (|spadConstant| % 86))
              (SEQ (LETT |i| 1) (LETT #2# |q|) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ (LETT |b| (|SPADfirst| |l|))
                        (LETT |nl|
                              (CONS
                               (SPADCALL |b| (|spadConstant| % 86)
                                         (QREFELT % 113))
                               |nl|))
                        (LETT |bprod| (SPADCALL |bprod| |b| (QREFELT % 112)))
                        (EXIT (LETT |l| (CDR |l|))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |nl0| (NREVERSE |nl|)) (LETT |nl1| (CONS |z| |pq|))
              (LETT |nl| (SPADCALL |nl0| |nl1| (QREFELT % 90)))
              (LETT |aprod| (SPADCALL |aprod| |bprod| (QREFELT % 121)))
              (EXIT
               (SPADCALL (|FSPECF;idvsum| (QREFELT % 40) (- |nn| 1) |ol| |x| %)
                         (SPADCALL
                          (SPADCALL (SPADCALL |z| |x| (QREFELT % 110)) |aprod|
                                    (QREFELT % 112))
                          (SPADCALL (QREFELT % 40) |nl| (QREFELT % 92))
                          (QREFELT % 112))
                         (QREFELT % 113)))))) 

(SDEFUN |FSPECF;add_pairs_to_list|
        ((|lp| (|List| (|List| F))) (|l| (|List| F)) (% (|List| F)))
        (SPROG ((#1=#:G1572 NIL) (|p| NIL))
               (SEQ
                (SEQ (LETT |p| NIL) (LETT #1# |lp|) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL (LENGTH |p|) 2 (QREFELT % 326))
                         (|error| "not a list of pairs"))
                        ('T
                         (LETT |l|
                               (CONS (SPADCALL |p| 2 (QREFELT % 107))
                                     (CONS (SPADCALL |p| 1 (QREFELT % 107))
                                           |l|)))))))
                     (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                (EXIT |l|)))) 

(SDEFUN |FSPECF;dvmeijer| ((|l| #1=(|List| F)) (|x| (|Symbol|)) (% (F)))
        (SPROG
         ((|om| (F)) (|nm| (F)) (|l2| (|List| F)) (|sign| (F)) (|na| (F))
          (|a| (F)) (|n2| (|Integer|)) (|n1| (|Integer|)) (|z| (F))
          (|l1| (|List| F)) (|nli| (|List| (|Integer|))) (|nl| (|List| F))
          (|l0| #1#) (|nn| (|NonNegativeInteger|)) (#2=#:G1573 NIL)
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (LENGTH |l|))
              (LETT |nn|
                    (PROG1 (LETT #2# (- |n| 4))
                      (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #2#)))
              (LETT |l0| |l|) (LETT |nl| (SPADCALL |l| |nn| (QREFELT % 325)))
              (LETT |nli| (|FSPECF;get_int_listf| |nl| %))
              (LETT |l| (SPADCALL |l| |nn| (QREFELT % 324)))
              (LETT |l1| (REVERSE |l|)) (LETT |z| (|SPADfirst| |l1|))
              (LETT |n1| (|SPADfirst| |nli|))
              (LETT |n2| (SPADCALL |nli| 2 (QREFELT % 327)))
              (LETT |a| (|SPADfirst| |l|)) (LETT |sign| (|spadConstant| % 86))
              (COND
               ((OR (> |n1| 0) (> |n2| 0))
                (SEQ
                 (LETT |na|
                       (SPADCALL |a| (|spadConstant| % 86) (QREFELT % 120)))
                 (COND
                  ((EQL |n1| 0)
                   (LETT |sign|
                         (SPADCALL (|spadConstant| % 86) (QREFELT % 122)))))
                 (EXIT (LETT |l2| (CONS |na| (CDR |l|))))))
               ('T
                (SEQ (LETT |na| |a|)
                     (COND
                      ((> (SPADCALL |nli| 3 (QREFELT % 327)) 0)
                       (LETT |sign|
                             (SPADCALL (|spadConstant| % 86)
                                       (QREFELT % 122)))))
                     (EXIT
                      (LETT |l2|
                            (CONS
                             (SPADCALL |a| (|spadConstant| % 86)
                                       (QREFELT % 113))
                             (CDR |l|)))))))
              (LETT |nm|
                    (SPADCALL (QREFELT % 41)
                              (SPADCALL |l2| |nl| (QREFELT % 90))
                              (QREFELT % 92)))
              (LETT |om| (SPADCALL (QREFELT % 41) |l0| (QREFELT % 92)))
              (EXIT
               (SPADCALL (|FSPECF;idvsum| (QREFELT % 41) (- |nn| 1) |l0| |x| %)
                         (SPADCALL
                          (SPADCALL (SPADCALL |z| |x| (QREFELT % 110))
                                    (SPADCALL
                                     (SPADCALL |sign| |nm| (QREFELT % 112))
                                     (SPADCALL |na| |om| (QREFELT % 112))
                                     (QREFELT % 113))
                                    (QREFELT % 112))
                          |z| (QREFELT % 121))
                         (QREFELT % 113)))))) 

(SDEFUN |FSPECF;get_if_list|
        ((|n| (|Integer|)) (|lf| (|List| (|InputForm|)))
         (% (|List| (|List| (|InputForm|)))))
        (SPROG ((|a| (|List| (|InputForm|))) (#1=#:G1586 NIL) (|i| NIL))
               (SEQ (LETT |a| NIL)
                    (SEQ (LETT |i| 1) (LETT #1# |n|) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ (LETT |a| (CONS (|SPADfirst| |lf|) |a|))
                              (EXIT (LETT |lf| (CDR |lf|))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (LETT |a|
                          (CONS (SPADCALL '|construct| (QREFELT % 183))
                                (NREVERSE |a|)))
                    (EXIT (LIST |a| |lf|))))) 

(SDEFUN |FSPECF;get_if_lists|
        ((|ln| (|List| (|Integer|))) (|lf| (|List| (|InputForm|)))
         (% (|List| (|List| (|InputForm|)))))
        (SPROG
         ((|rl| (|List| (|List| (|InputForm|))))
          (|al| (|List| (|List| (|InputForm|)))) (#1=#:G1592 NIL) (|n| NIL))
         (SEQ (LETT |rl| NIL)
              (SEQ (LETT |n| NIL) (LETT #1# |ln|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |n| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |al| (|FSPECF;get_if_list| |n| |lf| %))
                        (LETT |rl| (CONS (|SPADfirst| |al|) |rl|))
                        (EXIT (LETT |lf| (|SPADfirst| (CDR |al|)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (LETT |rl| (NREVERSE |rl|)) (EXIT (CONS |lf| |rl|))))) 

(SDEFUN |FSPECF;get_int_listi|
        ((|n| (|Integer|)) (|lo| (|List| (|InputForm|)))
         (% (|List| (|Integer|))))
        (SPROG
         ((|rl| (|List| (|Integer|))) (|p| (|Integer|)) (#1=#:G1599 NIL)
          (|i| NIL) (|n0| (|NonNegativeInteger|)) (#2=#:G1593 NIL))
         (SEQ
          (LETT |n0|
                (PROG1 (LETT #2# (- (LENGTH |lo|) |n|))
                  (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #2#)))
          (LETT |lo| (SPADCALL |lo| |n0| (QREFELT % 329))) (LETT |rl| NIL)
          (SEQ (LETT |i| 1) (LETT #1# |n|) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ (LETT |p| (SPADCALL (|SPADfirst| |lo|) (QREFELT % 331)))
                    (LETT |rl| (CONS |p| |rl|)) (EXIT (LETT |lo| (CDR |lo|))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (LETT |rl| (NREVERSE |rl|)) (EXIT |rl|)))) 

(SDEFUN |FSPECF;get_of_list|
        ((|n| (|Integer|)) (|lo| (|List| (|OutputForm|)))
         (% (|List| (|List| (|OutputForm|)))))
        (SPROG ((|a| (|List| (|OutputForm|))) (#1=#:G1605 NIL) (|i| NIL))
               (SEQ (LETT |a| NIL)
                    (SEQ (LETT |i| 1) (LETT #1# |n|) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ (LETT |a| (CONS (|SPADfirst| |lo|) |a|))
                              (EXIT (LETT |lo| (CDR |lo|))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (LETT |a| (NREVERSE |a|)) (EXIT (LIST |a| |lo|))))) 

(SDEFUN |FSPECF;get_of_lists|
        ((|ln| (|List| (|Integer|))) (|lo| (|List| (|OutputForm|)))
         (% (|List| (|List| (|OutputForm|)))))
        (SPROG
         ((|rl| (|List| (|List| (|OutputForm|))))
          (|al| (|List| (|List| (|OutputForm|)))) (#1=#:G1611 NIL) (|n| NIL))
         (SEQ (LETT |rl| NIL)
              (SEQ (LETT |n| NIL) (LETT #1# |ln|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |n| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |al| (|FSPECF;get_of_list| |n| |lo| %))
                        (LETT |rl| (CONS (|SPADfirst| |al|) |rl|))
                        (EXIT (LETT |lo| (|SPADfirst| (CDR |al|)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (LETT |rl| (NREVERSE |rl|)) (EXIT (CONS |lo| |rl|))))) 

(SDEFUN |FSPECF;get_int_listo|
        ((|n| (|Integer|)) (|lo| (|List| (|OutputForm|)))
         (% (|List| (|Integer|))))
        (SPROG
         ((|rl| (|List| (|Integer|))) (|p| (|Integer|)) (#1=#:G1618 NIL)
          (|i| NIL) (|n0| (|NonNegativeInteger|)) (#2=#:G1612 NIL))
         (SEQ
          (LETT |n0|
                (PROG1 (LETT #2# (- (LENGTH |lo|) |n|))
                  (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #2#)))
          (LETT |lo| (SPADCALL |lo| |n0| (QREFELT % 332))) (LETT |rl| NIL)
          (SEQ (LETT |i| 1) (LETT #1# |n|) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ (LETT |p| (SPADCALL (|SPADfirst| |lo|) (QREFELT % 331)))
                    (LETT |rl| (CONS |p| |rl|)) (EXIT (LETT |lo| (CDR |lo|))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (LETT |rl| (NREVERSE |rl|)) (EXIT |rl|)))) 

(SDEFUN |FSPECF;dhyper0|
        ((|op| (|OutputForm|)) (|lo| (|List| (|OutputForm|)))
         (% (|OutputForm|)))
        (SPROG
         ((|z| (|OutputForm|)) (|b| #1=(|List| (|OutputForm|))) (|a| #1#)
          (|al| (|List| (|List| (|OutputForm|)))) (|pql| (|List| (|Integer|)))
          (|n0| (|NonNegativeInteger|)) (#2=#:G1619 NIL))
         (SEQ
          (LETT |n0|
                (PROG1 (LETT #2# (- (LENGTH |lo|) 2))
                  (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #2#)))
          (LETT |pql| (|FSPECF;get_int_listo| 2 |lo| %))
          (LETT |lo| (SPADCALL |lo| |n0| (QREFELT % 333)))
          (LETT |al| (|FSPECF;get_of_lists| |pql| |lo| %))
          (LETT |lo| (|SPADfirst| |al|)) (LETT |al| (CDR |al|))
          (LETT |a| (|SPADfirst| |al|)) (LETT |b| (|SPADfirst| (CDR |al|)))
          (LETT |z| (|SPADfirst| |lo|))
          (EXIT
           (SPADCALL |op|
                     (LIST (SPADCALL |a| (QREFELT % 334))
                           (SPADCALL |b| (QREFELT % 334)) |z|)
                     (QREFELT % 335)))))) 

(SDEFUN |FSPECF;dhyper| ((|lo| (|List| (|OutputForm|))) (% (|OutputForm|)))
        (|FSPECF;dhyper0| (SPADCALL '|hypergeometricF| (QREFELT % 336)) |lo| %)) 

(SDEFUN |FSPECF;ddhyper| ((|lo| (|List| (|OutputForm|))) (% (|OutputForm|)))
        (|FSPECF;dhyper0| (|SPADfirst| |lo|) (CDR |lo|) %)) 

(SDEFUN |FSPECF;dmeijer0|
        ((|op| (|OutputForm|)) (|lo| (|List| (|OutputForm|)))
         (% (|OutputForm|)))
        (SPROG
         ((|z| (|OutputForm|)) (|al| (|List| (|List| (|OutputForm|))))
          (|nl| (|List| (|Integer|))) (|n0| (|NonNegativeInteger|))
          (#1=#:G1624 NIL))
         (SEQ
          (LETT |n0|
                (PROG1 (LETT #1# (- (LENGTH |lo|) 4))
                  (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #1#)))
          (LETT |nl| (|FSPECF;get_int_listo| 4 |lo| %))
          (LETT |lo| (SPADCALL |lo| |n0| (QREFELT % 333)))
          (LETT |al| (|FSPECF;get_of_lists| |nl| |lo| %))
          (LETT |lo| (|SPADfirst| |al|)) (LETT |al| (CDR |al|))
          (LETT |z| (|SPADfirst| |lo|))
          (EXIT
           (SPADCALL |op|
                     (SPADCALL (SPADCALL (ELT % 334) |al| (QREFELT % 339))
                               (LIST |z|) (QREFELT % 340))
                     (QREFELT % 335)))))) 

(SDEFUN |FSPECF;dmeijer| ((|lo| (|List| (|OutputForm|))) (% (|OutputForm|)))
        (|FSPECF;dmeijer0| (SPADCALL '|meijerG| (QREFELT % 336)) |lo| %)) 

(SDEFUN |FSPECF;ddmeijer| ((|lo| (|List| (|OutputForm|))) (% (|OutputForm|)))
        (|FSPECF;dmeijer0| (|SPADfirst| |lo|) (CDR |lo|) %)) 

(SDEFUN |FSPECF;inhyper| ((|lf| (|List| (|InputForm|))) (% (|InputForm|)))
        (SPROG
         ((|li| (|List| #1=(|InputForm|))) (|zi| #1#) (|bi| #2=(|InputForm|))
          (|b| #3=(|List| (|InputForm|))) (|ai| #2#) (|a| #3#)
          (|al| (|List| (|List| (|InputForm|)))) (|pqi| (|List| (|Integer|))))
         (SEQ (LETT |pqi| (|FSPECF;get_int_listi| 2 |lf| %))
              (LETT |al| (|FSPECF;get_if_lists| |pqi| |lf| %))
              (LETT |lf| (|SPADfirst| |al|)) (LETT |al| (CDR |al|))
              (LETT |a| (|SPADfirst| |al|))
              (LETT |ai| (SPADCALL |a| (QREFELT % 184)))
              (LETT |b| (|SPADfirst| (CDR |al|)))
              (LETT |bi| (SPADCALL |b| (QREFELT % 184)))
              (LETT |zi| (|SPADfirst| |lf|))
              (LETT |li|
                    (LIST (SPADCALL '|hypergeometricF| (QREFELT % 183)) |ai|
                          |bi| |zi|))
              (EXIT (SPADCALL |li| (QREFELT % 184)))))) 

(SDEFUN |FSPECF;inmeijer| ((|lf| (|List| (|InputForm|))) (% (|InputForm|)))
        (SPROG
         ((|li| (|List| #1=(|InputForm|))) (|zi| #1#) (|di| #2=(|InputForm|))
          (|d| #3=(|List| (|InputForm|)))
          (|al| (|List| (|List| (|InputForm|)))) (|ci| #2#) (|c| #3#)
          (|bi| #2#) (|b| #3#) (|ai| #2#) (|a| #3#)
          (|pqi| (|List| (|Integer|))))
         (SEQ (LETT |pqi| (|FSPECF;get_int_listi| 4 |lf| %))
              (LETT |al| (|FSPECF;get_if_lists| |pqi| |lf| %))
              (LETT |lf| (|SPADfirst| |al|)) (LETT |al| (CDR |al|))
              (LETT |a| (|SPADfirst| |al|))
              (LETT |ai| (SPADCALL |a| (QREFELT % 184))) (LETT |al| (CDR |al|))
              (LETT |b| (|SPADfirst| |al|))
              (LETT |bi| (SPADCALL |b| (QREFELT % 184))) (LETT |al| (CDR |al|))
              (LETT |c| (|SPADfirst| |al|))
              (LETT |ci| (SPADCALL |c| (QREFELT % 184))) (LETT |al| (CDR |al|))
              (LETT |d| (|SPADfirst| |al|))
              (LETT |di| (SPADCALL |d| (QREFELT % 184)))
              (LETT |zi| (|SPADfirst| |lf|))
              (LETT |li|
                    (LIST (SPADCALL '|meijerG| (QREFELT % 183)) |ai| |bi| |ci|
                          |di| |zi|))
              (EXIT (SPADCALL |li| (QREFELT % 184)))))) 

(SDEFUN |FSPECF;iiHypergeometricF;LF;328| ((|l| (|List| F)) (% (F)))
        (SPADCALL (QREFELT % 40) |l| (QREFELT % 111))) 

(SDEFUN |FSPECF;iiMeijerG| ((|l| (|List| F)) (% (F)))
        (SPADCALL (QREFELT % 41) |l| (QREFELT % 111))) 

(SDEFUN |FSPECF;d_eis| ((|x| (F)) (% (F)))
        (SPADCALL
         (SPADCALL (SPADCALL (QREFELT % 48) |x| (QREFELT % 219))
                   (QREFELT % 122))
         (SPADCALL (|spadConstant| % 86) |x| (QREFELT % 121)) (QREFELT % 113))) 

(SDEFUN |FSPECF;d_erfs| ((|x| (F)) (% (F)))
        (SPADCALL
         (SPADCALL (SPADCALL 2 |x| (QREFELT % 104))
                   (SPADCALL (QREFELT % 49) |x| (QREFELT % 219))
                   (QREFELT % 112))
         (SPADCALL (SPADCALL 2 (QREFELT % 88))
                   (SPADCALL (SPADCALL (QREFELT % 136)) (QREFELT % 125))
                   (QREFELT % 121))
         (QREFELT % 120))) 

(SDEFUN |FSPECF;d_erfis| ((|x| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL (SPADCALL 2 |x| (QREFELT % 104))
                    (SPADCALL (QREFELT % 50) |x| (QREFELT % 219))
                    (QREFELT % 112))
          (QREFELT % 122))
         (SPADCALL (SPADCALL 2 (QREFELT % 88))
                   (SPADCALL (SPADCALL (QREFELT % 136)) (QREFELT % 125))
                   (QREFELT % 121))
         (QREFELT % 113))) 

(DECLAIM (NOTINLINE |FunctionalSpecialFunction;|)) 

(DEFUN |FunctionalSpecialFunction| (&REST #1=#:G1711)
  (SPROG NIL
         (PROG (#2=#:G1712)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FunctionalSpecialFunction|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |FunctionalSpecialFunction;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|FunctionalSpecialFunction|)))))))))) 

(DEFUN |FunctionalSpecialFunction;| (|#1| |#2|)
  (SPROG
   ((#1=#:G603 NIL) (|pv$| NIL) (% NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$| (LIST '|FunctionalSpecialFunction| DV$1 DV$2))
    (LETT % (GETREFV 342))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#2|
                                                       '(|RetractableTo|
                                                         (|Integer|)))))))
    (|haddProp| |$ConstructorCache| '|FunctionalSpecialFunction|
                (LIST DV$1 DV$2) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 8 '|special|)
    (QSETREFV % 13 (SPADCALL '|abs| (QREFELT % 12)))
    (QSETREFV % 14 (SPADCALL '|sign| (QREFELT % 12)))
    (QSETREFV % 15 (SPADCALL '|unitStep| (QREFELT % 12)))
    (QSETREFV % 16 (SPADCALL '|ceiling| (QREFELT % 12)))
    (QSETREFV % 17 (SPADCALL '|floor| (QREFELT % 12)))
    (QSETREFV % 18 (SPADCALL '|fractionPart| (QREFELT % 12)))
    (QSETREFV % 19 (SPADCALL '|diracDelta| (QREFELT % 12)))
    (QSETREFV % 20 (SPADCALL '|conjugate| (QREFELT % 12)))
    (QSETREFV % 21 (SPADCALL '|Gamma| (QREFELT % 12)))
    (QSETREFV % 22 (SPADCALL '|Gamma2| (QREFELT % 12)))
    (QSETREFV % 23 (SPADCALL '|Beta| (QREFELT % 12)))
    (QSETREFV % 24 (SPADCALL '|digamma| (QREFELT % 12)))
    (QSETREFV % 25 (SPADCALL '|polygamma| (QREFELT % 12)))
    (QSETREFV % 26 (SPADCALL '|besselJ| (QREFELT % 12)))
    (QSETREFV % 27 (SPADCALL '|besselY| (QREFELT % 12)))
    (QSETREFV % 28 (SPADCALL '|besselI| (QREFELT % 12)))
    (QSETREFV % 29 (SPADCALL '|besselK| (QREFELT % 12)))
    (QSETREFV % 30 (SPADCALL '|airyAi| (QREFELT % 12)))
    (QSETREFV % 31 (SPADCALL '|airyAiPrime| (QREFELT % 12)))
    (QSETREFV % 32 (SPADCALL '|airyBi| (QREFELT % 12)))
    (QSETREFV % 33 (SPADCALL '|airyBiPrime| (QREFELT % 12)))
    (QSETREFV % 34 (SPADCALL '|lambertW| (QREFELT % 12)))
    (QSETREFV % 35 (SPADCALL '|polylog| (QREFELT % 12)))
    (QSETREFV % 36 (SPADCALL '|weierstrassP| (QREFELT % 12)))
    (QSETREFV % 37 (SPADCALL '|weierstrassPPrime| (QREFELT % 12)))
    (QSETREFV % 38 (SPADCALL '|weierstrassSigma| (QREFELT % 12)))
    (QSETREFV % 39 (SPADCALL '|weierstrassZeta| (QREFELT % 12)))
    (QSETREFV % 40 (SPADCALL '|hypergeometricF| (QREFELT % 12)))
    (QSETREFV % 41 (SPADCALL '|meijerG| (QREFELT % 12)))
    (QSETREFV % 42 (SPADCALL '|charlierC| (QREFELT % 12)))
    (QSETREFV % 43 (SPADCALL '|hermiteH| (QREFELT % 12)))
    (QSETREFV % 44 (SPADCALL '|jacobiP| (QREFELT % 12)))
    (QSETREFV % 45 (SPADCALL '|laguerreL| (QREFELT % 12)))
    (QSETREFV % 46 (SPADCALL '|meixnerM| (QREFELT % 12)))
    (QSETREFV % 47 (SPADCALL '|%logGamma| (QREFELT % 12)))
    (QSETREFV % 48 (SPADCALL '|%eis| (QREFELT % 12)))
    (QSETREFV % 49 (SPADCALL '|%erfs| (QREFELT % 12)))
    (QSETREFV % 50 (SPADCALL '|%erfis| (QREFELT % 12)))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (QSETREFV % 93
                 (CONS (|dispatchFunction| |FSPECF;hypergeometricF;2L2F;28|)
                       %))
       (QSETREFV % 94
                 (CONS (|dispatchFunction| |FSPECF;meijerG;4L2F;29|) %)))))
    (QSETREFV % 96
              (SPADCALL (SPADCALL '|%diff| (QREFELT % 12)) (QREFELT % 95)))
    (QSETREFV % 99
              (PROG2
                  (LETT #1#
                        (SPADCALL (SPADCALL 2 (QREFELT % 88)) (QREFELT % 98)))
                  (QCDR #1#)
                (|check_union2| (QEQCAR #1# 0) |#2| (|Union| |#2| #2="failed")
                                #1#)))
    (QSETREFV % 100
              (PROG2
                  (LETT #1#
                        (SPADCALL (SPADCALL 3 (QREFELT % 88)) (QREFELT % 98)))
                  (QCDR #1#)
                (|check_union2| (QEQCAR #1# 0) |#2| (|Union| |#2| #2#) #1#)))
    (QSETREFV % 101
              (PROG2
                  (LETT #1#
                        (SPADCALL (SPADCALL 4 (QREFELT % 88)) (QREFELT % 98)))
                  (QCDR #1#)
                (|check_union2| (QEQCAR #1# 0) |#2| (|Union| |#2| #2#) #1#)))
    (QSETREFV % 102
              (PROG2
                  (LETT #1#
                        (SPADCALL (SPADCALL 6 (QREFELT % 88)) (QREFELT % 98)))
                  (QCDR #1#)
                (|check_union2| (QEQCAR #1# 0) |#2| (|Union| |#2| #2#) #1#)))
    (QSETREFV % 105 (SPADCALL 2 (QREFELT % 100) (QREFELT % 104)))
    (QSETREFV % 106 (SPADCALL 3 (QREFELT % 99) (QREFELT % 104)))
    (QSETREFV % 114 (SPADCALL '|weierstrassPInverse| (QREFELT % 12)))
    (SPADCALL (QREFELT % 114)
              (CONS (|function| |FSPECF;elWeierstrassPInverse|) %)
              (QREFELT % 118))
    (COND
     ((|HasCategory| |#2| '(|RadicalCategory|))
      (PROGN
       (SPADCALL (QREFELT % 114)
                 (LIST
                  (CONS (|function| |FSPECF;eWeierstrassPInverseGrad_g2|) %)
                  (CONS (|function| |FSPECF;eWeierstrassPInverseGrad_g3|) %)
                  (CONS (|function| |FSPECF;eWeierstrassPInverseGrad_z|) %))
                 (QREFELT % 127)))))
    (QSETREFV % 128 (SPADCALL '|whittakerM| (QREFELT % 12)))
    (SPADCALL (QREFELT % 128) (CONS (|function| |FSPECF;elWhittakerM|) %)
              (QREFELT % 118))
    (SPADCALL (QREFELT % 128) '|%specialDiff|
              (CONS (|function| |FSPECF;dWhittakerM|) %) (QREFELT % 131))
    (QSETREFV % 132 (SPADCALL '|whittakerW| (QREFELT % 12)))
    (SPADCALL (QREFELT % 132) (CONS (|function| |FSPECF;elWhittakerW|) %)
              (QREFELT % 118))
    (SPADCALL (QREFELT % 132) '|%specialDiff|
              (CONS (|function| |FSPECF;dWhittakerW|) %) (QREFELT % 131))
    (QSETREFV % 134 (SPADCALL '|angerJ| (QREFELT % 12)))
    (COND
     ((|HasCategory| |#2| '(|TranscendentalFunctionCategory|))
      (PROGN
       (SPADCALL (QREFELT % 134) (CONS (|function| |FSPECF;elAngerJ|) %)
                 (QREFELT % 118))
       (SPADCALL (QREFELT % 134) '|%specialDiff|
                 (CONS (|function| |FSPECF;dAngerJ|) %) (QREFELT % 131))))
     ('T
      (PROGN
       (SPADCALL (QREFELT % 134) (CONS (|function| |FSPECF;eeAngerJ|) %)
                 (QREFELT % 118)))))
    (QSETREFV % 138 (SPADCALL '|weberE| (QREFELT % 12)))
    (COND
     ((|HasCategory| |#2| '(|TranscendentalFunctionCategory|))
      (PROGN
       (SPADCALL (QREFELT % 138) (CONS (|function| |FSPECF;elWeberE|) %)
                 (QREFELT % 118))
       (SPADCALL (QREFELT % 138) '|%specialDiff|
                 (CONS (|function| |FSPECF;dWeberE|) %) (QREFELT % 131))))
     ('T
      (PROGN
       (SPADCALL (QREFELT % 138) (CONS (|function| |FSPECF;eeWeberE|) %)
                 (QREFELT % 118)))))
    (QSETREFV % 142 (SPADCALL '|struveH| (QREFELT % 12)))
    (SPADCALL (QREFELT % 142) (CONS (|function| |FSPECF;elStruveH|) %)
              (QREFELT % 118))
    (COND
     ((|HasCategory| |#2| '(|TranscendentalFunctionCategory|))
      (COND
       ((|HasCategory| |#2| '(|RadicalCategory|))
        (PROGN
         (SPADCALL (QREFELT % 142) '|%specialDiff|
                   (CONS (|function| |FSPECF;dStruveH|) %)
                   (QREFELT % 131)))))))
    (QSETREFV % 145 (SPADCALL '|struveL| (QREFELT % 12)))
    (SPADCALL (QREFELT % 145) (CONS (|function| |FSPECF;elStruveL|) %)
              (QREFELT % 118))
    (COND
     ((|HasCategory| |#2| '(|TranscendentalFunctionCategory|))
      (COND
       ((|HasCategory| |#2| '(|RadicalCategory|))
        (PROGN
         (SPADCALL (QREFELT % 145) '|%specialDiff|
                   (CONS (|function| |FSPECF;dStruveL|) %)
                   (QREFELT % 131)))))))
    (QSETREFV % 147 (SPADCALL '|hankelH1| (QREFELT % 12)))
    (SPADCALL (QREFELT % 147) (CONS (|function| |FSPECF;elHankelH1|) %)
              (QREFELT % 118))
    (SPADCALL (QREFELT % 147) '|%specialDiff|
              (CONS (|function| |FSPECF;dHankelH1|) %) (QREFELT % 131))
    (QSETREFV % 149 (SPADCALL '|hankelH2| (QREFELT % 12)))
    (SPADCALL (QREFELT % 149) (CONS (|function| |FSPECF;elHankelH2|) %)
              (QREFELT % 118))
    (SPADCALL (QREFELT % 149) '|%specialDiff|
              (CONS (|function| |FSPECF;dHankelH2|) %) (QREFELT % 131))
    (QSETREFV % 151 (SPADCALL '|lommelS1| (QREFELT % 12)))
    (SPADCALL (QREFELT % 151) (CONS (|function| |FSPECF;elLommelS1|) %)
              (QREFELT % 118))
    (SPADCALL (QREFELT % 151) '|%specialDiff|
              (CONS (|function| |FSPECF;dLommelS1|) %) (QREFELT % 131))
    (QSETREFV % 153 (SPADCALL '|lommelS2| (QREFELT % 12)))
    (SPADCALL (QREFELT % 153) (CONS (|function| |FSPECF;elLommelS2|) %)
              (QREFELT % 118))
    (SPADCALL (QREFELT % 153) '|%specialDiff|
              (CONS (|function| |FSPECF;dLommelS2|) %) (QREFELT % 131))
    (QSETREFV % 155 (SPADCALL '|kummerM| (QREFELT % 12)))
    (SPADCALL (QREFELT % 155) (CONS (|function| |FSPECF;elKummerM|) %)
              (QREFELT % 118))
    (SPADCALL (QREFELT % 155) '|%specialDiff|
              (CONS (|function| |FSPECF;dKummerM|) %) (QREFELT % 131))
    (QSETREFV % 157 (SPADCALL '|kummerU| (QREFELT % 12)))
    (SPADCALL (QREFELT % 157) (CONS (|function| |FSPECF;elKummerU|) %)
              (QREFELT % 118))
    (SPADCALL (QREFELT % 157) '|%specialDiff|
              (CONS (|function| |FSPECF;dKummerU|) %) (QREFELT % 131))
    (QSETREFV % 159 (SPADCALL '|legendreP| (QREFELT % 12)))
    (SPADCALL (QREFELT % 159) (CONS (|function| |FSPECF;elLegendreP|) %)
              (QREFELT % 118))
    (SPADCALL (QREFELT % 159) '|%specialDiff|
              (CONS (|function| |FSPECF;dLegendreP|) %) (QREFELT % 131))
    (QSETREFV % 161 (SPADCALL '|legendreQ| (QREFELT % 12)))
    (SPADCALL (QREFELT % 161) (CONS (|function| |FSPECF;elLegendreQ|) %)
              (QREFELT % 118))
    (SPADCALL (QREFELT % 161) '|%specialDiff|
              (CONS (|function| |FSPECF;dLegendreQ|) %) (QREFELT % 131))
    (QSETREFV % 163 (SPADCALL '|kelvinBei| (QREFELT % 12)))
    (SPADCALL (QREFELT % 163) (CONS (|function| |FSPECF;elKelvinBei|) %)
              (QREFELT % 118))
    (COND
     ((|HasCategory| |#2| '(|RadicalCategory|))
      (PROGN
       (SPADCALL (QREFELT % 163) '|%specialDiff|
                 (CONS (|function| |FSPECF;dKelvinBei|) %) (QREFELT % 131)))))
    (QSETREFV % 166 (SPADCALL '|kelvinBer| (QREFELT % 12)))
    (SPADCALL (QREFELT % 166) (CONS (|function| |FSPECF;elKelvinBer|) %)
              (QREFELT % 118))
    (COND
     ((|HasCategory| |#2| '(|RadicalCategory|))
      (PROGN
       (SPADCALL (QREFELT % 166) '|%specialDiff|
                 (CONS (|function| |FSPECF;dKelvinBer|) %) (QREFELT % 131)))))
    (QSETREFV % 167 (SPADCALL '|kelvinKei| (QREFELT % 12)))
    (SPADCALL (QREFELT % 167) (CONS (|function| |FSPECF;elKelvinKei|) %)
              (QREFELT % 118))
    (COND
     ((|HasCategory| |#2| '(|RadicalCategory|))
      (PROGN
       (SPADCALL (QREFELT % 167) '|%specialDiff|
                 (CONS (|function| |FSPECF;dKelvinKei|) %) (QREFELT % 131)))))
    (QSETREFV % 170 (SPADCALL '|kelvinKer| (QREFELT % 12)))
    (SPADCALL (QREFELT % 170) (CONS (|function| |FSPECF;elKelvinKer|) %)
              (QREFELT % 118))
    (COND
     ((|HasCategory| |#2| '(|RadicalCategory|))
      (PROGN
       (SPADCALL (QREFELT % 170) '|%specialDiff|
                 (CONS (|function| |FSPECF;dKelvinKer|) %) (QREFELT % 131)))))
    (QSETREFV % 171 (SPADCALL '|ellipticK| (QREFELT % 12)))
    (SPADCALL (QREFELT % 171) (CONS (|function| |FSPECF;elEllipticK|) %)
              (QREFELT % 118))
    (SPADCALL (QREFELT % 171) (CONS (|function| |FSPECF;dEllipticK|) %)
              (QREFELT % 177))
    (QSETREFV % 178 (SPADCALL '|ellipticE| (QREFELT % 12)))
    (SPADCALL (QREFELT % 178) (CONS (|function| |FSPECF;elEllipticE|) %)
              (QREFELT % 118))
    (SPADCALL (QREFELT % 178) (CONS (|function| |FSPECF;dEllipticE|) %)
              (QREFELT % 177))
    (QSETREFV % 179 (SPADCALL '|ellipticE2| (QREFELT % 12)))
    (SPADCALL (QREFELT % 179) (CONS (|function| |FSPECF;elEllipticE2|) %)
              (QREFELT % 118))
    (COND
     ((|HasCategory| |#2| '(|RadicalCategory|))
      (PROGN
       (SPADCALL (QREFELT % 179)
                 (LIST (CONS (|function| |FSPECF;eEllipticE2Grad_z|) %)
                       (CONS (|function| |FSPECF;eEllipticE2Grad_m|) %))
                 (QREFELT % 127)))))
    (SPADCALL (QREFELT % 179) (CONS (|function| |FSPECF;inEllipticE2|) %)
              (QREFELT % 186))
    (QSETREFV % 187 (SPADCALL '|ellipticF| (QREFELT % 12)))
    (SPADCALL (QREFELT % 187) (CONS (|function| |FSPECF;elEllipticF|) %)
              (QREFELT % 118))
    (COND
     ((|HasCategory| |#2| '(|RadicalCategory|))
      (PROGN
       (SPADCALL (QREFELT % 187)
                 (LIST (CONS (|function| |FSPECF;eEllipticFGrad_z|) %)
                       (CONS (|function| |FSPECF;eEllipticFGrad_m|) %))
                 (QREFELT % 127)))))
    (QSETREFV % 188 (SPADCALL '|ellipticPi| (QREFELT % 12)))
    (SPADCALL (QREFELT % 188) (CONS (|function| |FSPECF;elEllipticPi|) %)
              (QREFELT % 118))
    (COND
     ((|HasCategory| |#2| '(|RadicalCategory|))
      (PROGN
       (SPADCALL (QREFELT % 188)
                 (LIST (CONS (|function| |FSPECF;eEllipticPiGrad_z|) %)
                       (CONS (|function| |FSPECF;eEllipticPiGrad_n|) %)
                       (CONS (|function| |FSPECF;eEllipticPiGrad_m|) %))
                 (QREFELT % 127)))))
    (QSETREFV % 190 (SPADCALL '|jacobiSn| (QREFELT % 12)))
    (SPADCALL (QREFELT % 190) (CONS (|function| |FSPECF;elJacobiSn|) %)
              (QREFELT % 118))
    (SPADCALL (QREFELT % 190)
              (LIST (CONS (|function| |FSPECF;eJacobiSnGrad_z|) %)
                    (CONS (|function| |FSPECF;eJacobiSnGrad_m|) %))
              (QREFELT % 127))
    (QSETREFV % 199 (SPADCALL '|jacobiCn| (QREFELT % 12)))
    (SPADCALL (QREFELT % 199) (CONS (|function| |FSPECF;elJacobiCn|) %)
              (QREFELT % 118))
    (SPADCALL (QREFELT % 199)
              (LIST (CONS (|function| |FSPECF;eJacobiCnGrad_z|) %)
                    (CONS (|function| |FSPECF;eJacobiCnGrad_m|) %))
              (QREFELT % 127))
    (QSETREFV % 200 (SPADCALL '|jacobiDn| (QREFELT % 12)))
    (SPADCALL (QREFELT % 200) (CONS (|function| |FSPECF;elJacobiDn|) %)
              (QREFELT % 118))
    (SPADCALL (QREFELT % 200)
              (LIST (CONS (|function| |FSPECF;eJacobiDnGrad_z|) %)
                    (CONS (|function| |FSPECF;eJacobiDnGrad_m|) %))
              (QREFELT % 127))
    (QSETREFV % 201 (SPADCALL '|jacobiZeta| (QREFELT % 12)))
    (SPADCALL (QREFELT % 201) (CONS (|function| |FSPECF;elJacobiZeta|) %)
              (QREFELT % 118))
    (SPADCALL (QREFELT % 201)
              (LIST (CONS (|function| |FSPECF;eJacobiZetaGrad_z|) %)
                    (CONS (|function| |FSPECF;eJacobiZetaGrad_m|) %))
              (QREFELT % 127))
    (QSETREFV % 203 (SPADCALL '|jacobiTheta| (QREFELT % 12)))
    (SPADCALL (QREFELT % 203) (CONS (|function| |FSPECF;elJacobiTheta|) %)
              (QREFELT % 118))
    (SPADCALL (QREFELT % 203)
              (LIST (CONS (|function| |FSPECF;eJacobiThetaGrad_z|) %)
                    (CONS (|function| |FSPECF;eJacobiThetaGrad_m|) %))
              (QREFELT % 127))
    (QSETREFV % 205 (SPADCALL '|lerchPhi| (QREFELT % 12)))
    (SPADCALL (QREFELT % 205) (CONS (|function| |FSPECF;elLerchPhi|) %)
              (QREFELT % 118))
    (SPADCALL (QREFELT % 205) '|%specialDiff|
              (CONS (|function| |FSPECF;dLerchPhi|) %) (QREFELT % 131))
    (QSETREFV % 207 (SPADCALL '|riemannZeta| (QREFELT % 12)))
    (SPADCALL (QREFELT % 207) (CONS (|function| |FSPECF;elRiemannZeta|) %)
              (QREFELT % 118))
    (SPADCALL (QREFELT % 42) (CONS (|function| |FSPECF;elCharlierC|) %)
              (QREFELT % 118))
    (SPADCALL (QREFELT % 43) (CONS (|function| |FSPECF;elHermiteH|) %)
              (QREFELT % 118))
    (SPADCALL (QREFELT % 43) '|%specialDiff|
              (CONS (|function| |FSPECF;dHermiteH|) %) (QREFELT % 131))
    (SPADCALL (QREFELT % 44) (CONS (|function| |FSPECF;elJacobiP|) %)
              (QREFELT % 118))
    (SPADCALL (QREFELT % 44) '|%specialDiff|
              (CONS (|function| |FSPECF;dJacobiP|) %) (QREFELT % 131))
    (SPADCALL (QREFELT % 45) (CONS (|function| |FSPECF;elLaguerreL|) %)
              (QREFELT % 118))
    (SPADCALL (QREFELT % 45) '|%specialDiff|
              (CONS (|function| |FSPECF;dLaguerreL|) %) (QREFELT % 131))
    (SPADCALL (QREFELT % 46) (CONS (|function| |FSPECF;elMeixnerM|) %)
              (QREFELT % 118))
    (COND
     ((|HasCategory| |#2| '(|RetractableTo| (|Fraction| (|Integer|))))
      (PROGN
       (QSETREFV % 225 (CONS (|dispatchFunction| |FSPECF;retract_Q;FU;215|) %))
       (QSETREFV % 227
                 (CONS (|dispatchFunction| |FSPECF;coerce_Q;FF;216|) %))))
     ('T
      (QSETREFV % 225
                (CONS (|dispatchFunction| |FSPECF;retract_Q;FU;217|) %))))
    (SPADCALL (QREFELT % 14) (CONS #'|FunctionalSpecialFunction!0| %)
              (QREFELT % 177))
    (SPADCALL (QREFELT % 14) (CONS (|function| |FSPECF;isign|) %)
              (QREFELT % 229))
    (SPADCALL (QREFELT % 15) (ELT % 58) (QREFELT % 177))
    (SPADCALL (QREFELT % 15) (CONS (|function| |FSPECF;i_unitStep|) %)
              (QREFELT % 229))
    (SPADCALL (QREFELT % 16) (CONS (|function| |FSPECF;i_ceiling|) %)
              (QREFELT % 229))
    (SPADCALL (QREFELT % 17) (CONS (|function| |FSPECF;i_floor|) %)
              (QREFELT % 229))
    (SPADCALL (QREFELT % 18) (CONS (|function| |FSPECF;i_fractionPart|) %)
              (QREFELT % 229))
    (SPADCALL (QREFELT % 19) (CONS (|function| |FSPECF;i_diracDelta|) %)
              (QREFELT % 229))
    (COND
     ((|HasCategory| |#2| '(|ElementaryFunctionCategory|))
      (PROGN
       (QSETREFV % 234 (CONS (|dispatchFunction| |FSPECF;iAiryAi;2F;231|) %))
       (QSETREFV % 235
                 (CONS (|dispatchFunction| |FSPECF;iAiryAiPrime;2F;232|) %))
       (QSETREFV % 236 (CONS (|dispatchFunction| |FSPECF;iAiryBi;2F;233|) %))
       (QSETREFV % 237
                 (CONS (|dispatchFunction| |FSPECF;iAiryBiPrime;2F;234|) %))))
     ('T
      (PROGN
       (QSETREFV % 234 (CONS (|dispatchFunction| |FSPECF;iAiryAi;2F;235|) %))
       (QSETREFV % 235
                 (CONS (|dispatchFunction| |FSPECF;iAiryAiPrime;2F;236|) %))
       (QSETREFV % 236 (CONS (|dispatchFunction| |FSPECF;iAiryBi;2F;237|) %))
       (QSETREFV % 237
                 (CONS (|dispatchFunction| |FSPECF;iAiryBiPrime;2F;238|) %)))))
    (COND
     ((|HasCategory| |#2| '(|ElementaryFunctionCategory|))
      (QSETREFV % 239 (CONS (|dispatchFunction| |FSPECF;iLambertW;2F;239|) %)))
     ('T
      (QSETREFV % 239
                (CONS (|dispatchFunction| |FSPECF;iLambertW;2F;240|) %))))
    (COND
     ((|HasCategory| |#2| '(|ElementaryFunctionCategory|))
      (COND
       ((|HasCategory| |#2| '(|LiouvillianFunctionCategory|))
        (QSETREFV % 242
                  (CONS (|dispatchFunction| |FSPECF;iiPolylog;3F;242|) %)))
       ('T
        (QSETREFV % 242
                  (CONS (|dispatchFunction| |FSPECF;iiPolylog;3F;243|) %)))))
     ('T
      (QSETREFV % 242
                (CONS (|dispatchFunction| |FSPECF;iiPolylog;3F;244|) %))))
    (COND
     ((|HasSignature| |#1|
                      (LIST '|abs|
                            (LIST (|devaluate| |#1|) (|devaluate| |#1|))))
      (PROGN
       (QSETREFV % 254 (CONS (|dispatchFunction| |FSPECF;iiabs;2F;250|) %))))
     ('T (QSETREFV % 254 (CONS (|dispatchFunction| |FSPECF;iiabs;2F;251|) %))))
    (COND
     ((|HasCategory| |#1| '(|SpecialFunctionCategory|))
      (PROGN
       (QSETREFV % 282 (CONS (|dispatchFunction| |FSPECF;iiGamma;2F;253|) %))
       (QSETREFV % 284 (CONS (|dispatchFunction| |FSPECF;iiBeta;LF;254|) %))
       (QSETREFV % 286 (CONS (|dispatchFunction| |FSPECF;iidigamma;2F;255|) %))
       (QSETREFV % 288
                 (CONS (|dispatchFunction| |FSPECF;iipolygamma;LF;256|) %))
       (QSETREFV % 290 (CONS (|dispatchFunction| |FSPECF;iiBesselJ;LF;257|) %))
       (QSETREFV % 292 (CONS (|dispatchFunction| |FSPECF;iiBesselY;LF;258|) %))
       (QSETREFV % 294 (CONS (|dispatchFunction| |FSPECF;iiBesselI;LF;259|) %))
       (QSETREFV % 296 (CONS (|dispatchFunction| |FSPECF;iiBesselK;LF;260|) %))
       (QSETREFV % 298 (CONS (|dispatchFunction| |FSPECF;iiAiryAi;2F;261|) %))
       (QSETREFV % 300
                 (CONS (|dispatchFunction| |FSPECF;iiAiryAiPrime;2F;262|) %))
       (QSETREFV % 302 (CONS (|dispatchFunction| |FSPECF;iiAiryBi;2F;263|) %))
       (QSETREFV % 304
                 (CONS (|dispatchFunction| |FSPECF;iiAiryBiPrime;2F;264|) %))))
     ('T
      (PROGN
       (COND
        ((|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
         (QSETREFV % 282
                   (CONS (|dispatchFunction| |FSPECF;iiGamma;2F;265|) %)))
        ('T
         (QSETREFV % 282
                   (CONS (|dispatchFunction| |FSPECF;iiGamma;2F;266|) %))))
       (QSETREFV % 284 (CONS (|dispatchFunction| |FSPECF;iiBeta;LF;267|) %))
       (QSETREFV % 286 (CONS (|dispatchFunction| |FSPECF;iidigamma;2F;268|) %))
       (QSETREFV % 288
                 (CONS (|dispatchFunction| |FSPECF;iipolygamma;LF;269|) %))
       (QSETREFV % 290 (CONS (|dispatchFunction| |FSPECF;iiBesselJ;LF;270|) %))
       (QSETREFV % 292 (CONS (|dispatchFunction| |FSPECF;iiBesselY;LF;271|) %))
       (QSETREFV % 294 (CONS (|dispatchFunction| |FSPECF;iiBesselI;LF;272|) %))
       (QSETREFV % 296 (CONS (|dispatchFunction| |FSPECF;iiBesselK;LF;273|) %))
       (QSETREFV % 298 (CONS (|dispatchFunction| |FSPECF;iiAiryAi;2F;274|) %))
       (QSETREFV % 300
                 (CONS (|dispatchFunction| |FSPECF;iiAiryAiPrime;2F;275|) %))
       (QSETREFV % 302 (CONS (|dispatchFunction| |FSPECF;iiAiryBi;2F;276|) %))
       (QSETREFV % 304
                 (CONS (|dispatchFunction| |FSPECF;iiAiryBiPrime;2F;277|)
                       %)))))
    (SPADCALL (QREFELT % 21) (ELT % 282) (QREFELT % 229))
    (SPADCALL (QREFELT % 13) (ELT % 254) (QREFELT % 229))
    (SPADCALL (QREFELT % 20) (ELT % 265) (QREFELT % 229))
    (SPADCALL (QREFELT % 23) (ELT % 284) (QREFELT % 118))
    (SPADCALL (QREFELT % 24) (ELT % 286) (QREFELT % 229))
    (SPADCALL (QREFELT % 25) (ELT % 288) (QREFELT % 118))
    (SPADCALL (QREFELT % 26) (ELT % 290) (QREFELT % 118))
    (SPADCALL (QREFELT % 27) (ELT % 292) (QREFELT % 118))
    (SPADCALL (QREFELT % 28) (ELT % 294) (QREFELT % 118))
    (SPADCALL (QREFELT % 29) (ELT % 296) (QREFELT % 118))
    (SPADCALL (QREFELT % 30) (ELT % 298) (QREFELT % 229))
    (SPADCALL (QREFELT % 31) (ELT % 300) (QREFELT % 229))
    (SPADCALL (QREFELT % 32) (ELT % 302) (QREFELT % 229))
    (SPADCALL (QREFELT % 33) (ELT % 304) (QREFELT % 229))
    (SPADCALL (QREFELT % 34) (ELT % 239) (QREFELT % 229))
    (SPADCALL (QREFELT % 35) (CONS (|function| |FSPECF;iPolylog|) %)
              (QREFELT % 118))
    (SPADCALL (QREFELT % 36) (CONS (|function| |FSPECF;iiWeierstrassP|) %)
              (QREFELT % 118))
    (SPADCALL (QREFELT % 37) (CONS (|function| |FSPECF;iiWeierstrassPPrime|) %)
              (QREFELT % 118))
    (SPADCALL (QREFELT % 38) (CONS (|function| |FSPECF;iiWeierstrassSigma|) %)
              (QREFELT % 118))
    (SPADCALL (QREFELT % 39) (CONS (|function| |FSPECF;iiWeierstrassZeta|) %)
              (QREFELT % 118))
    (SPADCALL (QREFELT % 40) (ELT % 309) (QREFELT % 118))
    (SPADCALL (QREFELT % 41) (CONS (|function| |FSPECF;iiMeijerG|) %)
              (QREFELT % 118))
    (COND
     ((|HasCategory| |#2| '(|ElementaryFunctionCategory|))
      (PROGN
       (SPADCALL (QREFELT % 22) '|%specialDiff|
                 (CONS (|function| |FSPECF;iGamma2|) %) (QREFELT % 131)))))
    (SPADCALL (QREFELT % 22) (CONS (|function| |FSPECF;inGamma2|) %)
              (QREFELT % 186))
    (SPADCALL (QREFELT % 20) (CONS (|function| |FSPECF;dconjugate|) %)
              (QREFELT % 318))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (QSETREFV % 309
                 (CONS (|dispatchFunction| |FSPECF;iiHypergeometricF;LF;309|)
                       %))
       (SPADCALL (QREFELT % 40) '|%diffDisp|
                 (CONS (|function| |FSPECF;ddhyper|) %) (QREFELT % 131))
       (SPADCALL (QREFELT % 41) '|%diffDisp|
                 (CONS (|function| |FSPECF;ddmeijer|) %) (QREFELT % 131))
       (SPADCALL (QREFELT % 40) (CONS (|function| |FSPECF;dhyper|) %)
                 (QREFELT % 318))
       (SPADCALL (QREFELT % 41) (CONS (|function| |FSPECF;dmeijer|) %)
                 (QREFELT % 318))
       (SPADCALL (QREFELT % 40) '|%specialDiff|
                 (CONS (|function| |FSPECF;dvhypergeom|) %) (QREFELT % 131))
       (SPADCALL (QREFELT % 41) '|%specialDiff|
                 (CONS (|function| |FSPECF;dvmeijer|) %) (QREFELT % 131))
       (SPADCALL (QREFELT % 40) (CONS (|function| |FSPECF;inhyper|) %)
                 (QREFELT % 186))
       (SPADCALL (QREFELT % 41) (CONS (|function| |FSPECF;inmeijer|) %)
                 (QREFELT % 186))))
     ('T
      (QSETREFV % 309
                (CONS (|dispatchFunction| |FSPECF;iiHypergeometricF;LF;328|)
                      %))))
    (COND
     ((|HasCategory| |#2| '(|TranscendentalFunctionCategory|))
      (COND
       ((|HasCategory| |#2| '(|RadicalCategory|))
        (PROGN
         (SPADCALL (QREFELT % 49) (CONS (|function| |FSPECF;d_erfs|) %)
                   (QREFELT % 177))
         (SPADCALL (QREFELT % 50) (CONS (|function| |FSPECF;d_erfis|) %)
                   (QREFELT % 177)))))))
    (SPADCALL (QREFELT % 13) (CONS #'|FunctionalSpecialFunction!1| %)
              (QREFELT % 177))
    (SPADCALL (QREFELT % 21) (CONS #'|FunctionalSpecialFunction!2| %)
              (QREFELT % 177))
    (SPADCALL (QREFELT % 47) (ELT % 64) (QREFELT % 177))
    (SPADCALL (QREFELT % 23)
              (LIST (CONS (|function| |FSPECF;iBetaGrad1|) %)
                    (CONS (|function| |FSPECF;iBetaGrad2|) %))
              (QREFELT % 127))
    (SPADCALL (QREFELT % 24) (CONS #'|FunctionalSpecialFunction!3| %)
              (QREFELT % 177))
    (SPADCALL (QREFELT % 48) (CONS (|function| |FSPECF;d_eis|) %)
              (QREFELT % 177))
    (SPADCALL (QREFELT % 30) (ELT % 71) (QREFELT % 177))
    (SPADCALL (QREFELT % 31) (CONS #'|FunctionalSpecialFunction!4| %)
              (QREFELT % 177))
    (SPADCALL (QREFELT % 32) (ELT % 73) (QREFELT % 177))
    (SPADCALL (QREFELT % 33) (CONS #'|FunctionalSpecialFunction!5| %)
              (QREFELT % 177))
    (SPADCALL (QREFELT % 34) (CONS (|function| |FSPECF;dLambertW|) %)
              (QREFELT % 177))
    (SPADCALL (QREFELT % 36)
              (LIST (CONS (|function| |FSPECF;iWeierstrassPGrad1|) %)
                    (CONS (|function| |FSPECF;iWeierstrassPGrad2|) %)
                    (CONS (|function| |FSPECF;iWeierstrassPGrad3|) %))
              (QREFELT % 127))
    (SPADCALL (QREFELT % 37)
              (LIST (CONS (|function| |FSPECF;iWeierstrassPPrimeGrad1|) %)
                    (CONS (|function| |FSPECF;iWeierstrassPPrimeGrad2|) %)
                    (CONS (|function| |FSPECF;iWeierstrassPPrimeGrad3|) %))
              (QREFELT % 127))
    (SPADCALL (QREFELT % 38)
              (LIST (CONS (|function| |FSPECF;iWeierstrassSigmaGrad1|) %)
                    (CONS (|function| |FSPECF;iWeierstrassSigmaGrad2|) %)
                    (CONS (|function| |FSPECF;iWeierstrassSigmaGrad3|) %))
              (QREFELT % 127))
    (SPADCALL (QREFELT % 39)
              (LIST (CONS (|function| |FSPECF;iWeierstrassZetaGrad1|) %)
                    (CONS (|function| |FSPECF;iWeierstrassZetaGrad2|) %)
                    (CONS (|function| |FSPECF;iWeierstrassZetaGrad3|) %))
              (QREFELT % 127))
    (SPADCALL (QREFELT % 25) '|%specialDiff|
              (CONS (|function| |FSPECF;ipolygamma|) %) (QREFELT % 131))
    (SPADCALL (QREFELT % 26) '|%specialDiff|
              (CONS (|function| |FSPECF;iBesselJ|) %) (QREFELT % 131))
    (SPADCALL (QREFELT % 27) '|%specialDiff|
              (CONS (|function| |FSPECF;iBesselY|) %) (QREFELT % 131))
    (SPADCALL (QREFELT % 28) '|%specialDiff|
              (CONS (|function| |FSPECF;iBesselI|) %) (QREFELT % 131))
    (SPADCALL (QREFELT % 29) '|%specialDiff|
              (CONS (|function| |FSPECF;iBesselK|) %) (QREFELT % 131))
    (SPADCALL (QREFELT % 35) '|%specialDiff|
              (CONS (|function| |FSPECF;dPolylog|) %) (QREFELT % 131))
    %))) 

(DEFUN |FunctionalSpecialFunction!5| (|x| %)
  (SPADCALL |x| (SPADCALL |x| (QREFELT % 72)) (QREFELT % 112))) 

(DEFUN |FunctionalSpecialFunction!4| (|x| %)
  (SPADCALL |x| (SPADCALL |x| (QREFELT % 70)) (QREFELT % 112))) 

(DEFUN |FunctionalSpecialFunction!3| (|x| %)
  (SPADCALL (|spadConstant| % 86) |x| (QREFELT % 65))) 

(DEFUN |FunctionalSpecialFunction!2| (|x| %)
  (SPADCALL (SPADCALL |x| (QREFELT % 64)) (SPADCALL |x| (QREFELT % 60))
            (QREFELT % 112))) 

(DEFUN |FunctionalSpecialFunction!1| (|x| %)
  (SPADCALL (SPADCALL |x| (QREFELT % 52)) (SPADCALL |x| (QREFELT % 341))
            (QREFELT % 112))) 

(DEFUN |FunctionalSpecialFunction!0| (|x| %)
  (SPADCALL (SPADCALL 2 (QREFELT % 88)) (SPADCALL |x| (QREFELT % 58))
            (QREFELT % 112))) 

(MAKEPROP '|FunctionalSpecialFunction| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'SPECIAL
              (|BasicOperator|) (|Symbol|) (|CommonOperators|) (0 . |operator|)
              '|opabs| '|opsign| '|op_unitStep| '|op_ceiling| '|op_floor|
              '|op_fractionPart| '|op_diracDelta| '|opconjugate| '|opGamma|
              '|opGamma2| '|opBeta| '|opdigamma| '|oppolygamma| '|opBesselJ|
              '|opBesselY| '|opBesselI| '|opBesselK| '|opAiryAi|
              '|opAiryAiPrime| '|opAiryBi| '|opAiryBiPrime| '|opLambertW|
              '|opPolylog| '|opWeierstrassP| '|opWeierstrassPPrime|
              '|opWeierstrassSigma| '|opWeierstrassZeta| '|opHypergeometricF|
              '|opMeijerG| '|opCharlierC| '|opHermiteH| '|opJacobiP|
              '|opLaguerreL| '|opMeixnerM| '|op_log_gamma| '|op_eis| '|op_erfs|
              '|op_erfis| (5 . |elt|) |FSPECF;abs;2F;1| |FSPECF;sign;2F;2|
              |FSPECF;unitStep;2F;3| |FSPECF;ceiling;2F;4| |FSPECF;floor;2F;5|
              |FSPECF;fractionPart;2F;6| |FSPECF;diracDelta;2F;7|
              |FSPECF;conjugate;2F;8| |FSPECF;Gamma;2F;9| (11 . |elt|)
              |FSPECF;Gamma;3F;10| |FSPECF;Beta;3F;11| |FSPECF;digamma;2F;12|
              |FSPECF;polygamma;3F;13| |FSPECF;besselJ;3F;14|
              |FSPECF;besselY;3F;15| |FSPECF;besselI;3F;16|
              |FSPECF;besselK;3F;17| |FSPECF;airyAi;2F;18|
              |FSPECF;airyAiPrime;2F;19| |FSPECF;airyBi;2F;20|
              |FSPECF;airyBiPrime;2F;21| |FSPECF;lambertW;2F;22|
              |FSPECF;polylog;3F;23| (18 . |elt|) |FSPECF;weierstrassP;4F;24|
              |FSPECF;weierstrassPPrime;4F;25| |FSPECF;weierstrassSigma;4F;26|
              |FSPECF;weierstrassZeta;4F;27| (26 . |Zero|) (30 . |Zero|)
              (|Boolean|) (34 . =) (40 . |One|) (44 . |One|) (|Integer|)
              (48 . |coerce|) (|List| 7) (53 . |concat|) (|List| %)
              (59 . |elt|) (65 . |hypergeometricF|) (72 . |meijerG|)
              (81 . |operator|) '|opdiff| (|Union| % '"failed") (86 . |recip|)
              '|ahalf| '|athird| '|afourth| '|asixth| (|PositiveInteger|)
              (91 . *) '|twothirds| '|threehalfs| (97 . |elt|) (103 . |new|)
              (107 . |coerce|) (112 . |differentiate|) (118 . |kernel|)
              (124 . *) (130 . +) '|opWeierstrassPInverse|
              |FSPECF;weierstrassPInverse;4F;33| (|Mapping| 7 89)
              (|BasicOperatorFunctions1| 7) (136 . |evaluate|) (142 . ^)
              (148 . -) (154 . /) (160 . -)
              (|SparseMultivariatePolynomial| 6 195) (165 . |One|)
              (169 . |sqrt|) (|List| 116) (174 . |derivative|) '|opWhittakerM|
              |FSPECF;whittakerM;4F;39| (|None|) (180 . |setProperty|)
              '|opWhittakerW| |FSPECF;whittakerW;4F;44| '|opAngerJ|
              |FSPECF;angerJ;3F;49| (187 . |pi|) (191 . |sin|) '|opWeberE|
              |FSPECF;weberE;3F;55| (196 . ^) (202 . |cos|) '|opStruveH|
              |FSPECF;struveH;3F;61| (207 . ^) '|opStruveL|
              |FSPECF;struveL;3F;66| '|opHankelH1| |FSPECF;hankelH1;3F;71|
              '|opHankelH2| |FSPECF;hankelH2;3F;76| '|opLommelS1|
              |FSPECF;lommelS1;4F;81| '|opLommelS2| |FSPECF;lommelS2;4F;86|
              '|opKummerM| |FSPECF;kummerM;4F;91| '|opKummerU|
              |FSPECF;kummerU;4F;96| '|opLegendreP| |FSPECF;legendreP;4F;101|
              '|opLegendreQ| |FSPECF;legendreQ;4F;106| '|opKelvinBei|
              |FSPECF;kelvinBei;3F;111| |FSPECF;kelvinBer;3F;116|
              '|opKelvinBer| '|opKelvinKei| |FSPECF;kelvinKei;3F;121|
              |FSPECF;kelvinKer;3F;126| '|opKelvinKer| '|opEllipticK|
              |FSPECF;ellipticK;2F;131| |FSPECF;ellipticE;2F;135|
              (|Fraction| 87) (213 . |One|) (|Mapping| 7 7)
              (217 . |derivative|) '|opEllipticE| '|opEllipticE2|
              |FSPECF;ellipticE;3F;139| |FSPECF;ellipticF;3F;145| (|InputForm|)
              (223 . |convert|) (228 . |convert|) (|Mapping| 182 328)
              (233 . |input|) '|opEllipticF| '|opEllipticPi|
              |FSPECF;ellipticPi;4F;150| '|opJacobiSn| |FSPECF;jacobiSn;3F;156|
              (239 . |is?|) (|Kernel| %) (245 . |retract|) (|Kernel| 7)
              (250 . |argument|) |FSPECF;jacobiCn;3F;162|
              |FSPECF;jacobiDn;3F;167| '|opJacobiCn| '|opJacobiDn|
              '|opJacobiZeta| |FSPECF;jacobiZeta;3F;172| '|opJacobiTheta|
              |FSPECF;jacobiTheta;3F;177| '|opLerchPhi|
              |FSPECF;lerchPhi;4F;182| '|opRiemannZeta|
              |FSPECF;riemannZeta;2F;186| |FSPECF;charlierC;4F;189|
              |FSPECF;hermiteH;3F;192| (255 . |elt|) |FSPECF;jacobiP;5F;197|
              |FSPECF;laguerreL;4F;202| |FSPECF;meixnerM;5F;207| (264 . |has?|)
              |FSPECF;belong?;BoB;210| (270 . |is?|) |FSPECF;operator;2Bo;211|
              (276 . |kernel|) (282 . |zero?|) (287 . |one?|)
              (292 . |smaller?|) (|Union| 174 '#1="failed")
              (298 . |retractIfCan|) (303 . |retract_Q|) (308 . |coerce|)
              (313 . |coerce_Q|) (318 . |sign|) (323 . |evaluate|)
              (329 . |ceiling|) (334 . |coerce|) (339 . |floor|)
              (344 . |fractionPart|) (349 . |iAiryAi|) (354 . |iAiryAiPrime|)
              (359 . |iAiryBi|) (364 . |iAiryBiPrime|) (369 . |exp|)
              (374 . |iLambertW|) (379 . |log|) (384 . |dilog|)
              (389 . |iiPolylog|) (395 . |second|) (|Union| 247 '#1#)
              (400 . |retractIfCan|) (|Polynomial| 6) (|Fraction| 246)
              (405 . |numer|) (|Union| 6 '"failed") (410 . |retractIfCan|)
              (415 . |denom|) (420 . |abs|) (425 . |coerce|) (430 . |iiabs|)
              (|Union| 10 '#1#) (435 . |retractIfCan|) (|List| 193)
              (440 . |kernels|) (|NonNegativeInteger|) (445 . |height|)
              (450 . |Zero|) (454 . =) (460 . |coerce|) (465 . |One|)
              |FSPECF;iiconjugate;2F;252| (|Mapping| % %) (469 . |map|)
              (|Mapping| 7 195) (|List| 195) (|ListFunctions2| 195 7)
              (475 . |map|) (481 . |eval|) (488 . |conjugate|)
              (|SparseMultivariatePolynomial| 6 193) (493 . |numer|)
              (|Mapping| 6 6) (498 . |map|) (504 . |coerce|) (509 . |denom|)
              (514 . |retractIfCan|) (519 . |Gamma|) (524 . |iiGamma|)
              (529 . |Beta|) (535 . |iiBeta|) (540 . |digamma|)
              (545 . |iidigamma|) (550 . |polygamma|) (556 . |iipolygamma|)
              (561 . |besselJ|) (567 . |iiBesselJ|) (572 . |besselY|)
              (578 . |iiBesselY|) (583 . |besselI|) (589 . |iiBesselI|)
              (594 . |besselK|) (600 . |iiBesselK|) (605 . |airyAi|)
              (610 . |iiAiryAi|) (615 . |airyAiPrime|) (620 . |iiAiryAiPrime|)
              (625 . |airyBi|) (630 . |iiAiryBi|) (635 . |airyBiPrime|)
              (640 . |iiAiryBiPrime|) (|Union| 87 '#1#) (645 . |retractIfCan|)
              (650 . |factorial|) (655 . |third|) (660 . |iiHypergeometricF|)
              (|List| 10) (665 . |variables|) (670 . |member?|) (|OutputForm|)
              (|List| 313) (676 . |elt|) (682 . |overbar|) (|Mapping| 313 314)
              (687 . |display|) (693 . |retract|) (|List| 87) (|Mapping| 87 7)
              (|ListFunctions2| 7 87) (698 . |map|) (704 . |first|)
              (710 . |rest|) (716 . ~=) (722 . |elt|) (|List| 182)
              (728 . |rest|) (|SExpression|) (734 . |integer|) (739 . |rest|)
              (745 . |first|) (751 . |bracket|) (756 . |prefix|)
              (762 . |coerce|) (|List| 314) (|ListFunctions2| 314 313)
              (767 . |map|) (773 . |concat|) (779 . |inv|))
           '#(|whittakerW| 784 |whittakerM| 791 |weierstrassZeta| 798
              |weierstrassSigma| 805 |weierstrassPPrime| 812
              |weierstrassPInverse| 819 |weierstrassP| 826 |weberE| 833
              |unitStep| 839 |struveL| 844 |struveH| 850 |sign| 856
              |riemannZeta| 861 |retract_Q| 866 |polylog| 871 |polygamma| 877
              |operator| 883 |meixnerM| 888 |meijerG| 896 |lommelS2| 905
              |lommelS1| 912 |lerchPhi| 919 |legendreQ| 926 |legendreP| 933
              |lambertW| 940 |laguerreL| 945 |kummerU| 952 |kummerM| 959
              |kelvinKer| 966 |kelvinKei| 972 |kelvinBer| 978 |kelvinBei| 984
              |jacobiZeta| 990 |jacobiTheta| 996 |jacobiSn| 1002 |jacobiP| 1008
              |jacobiDn| 1016 |jacobiCn| 1022 |iipolygamma| 1028 |iidigamma|
              1033 |iiconjugate| 1038 |iiabs| 1043 |iiPolylog| 1048
              |iiHypergeometricF| 1054 |iiGamma| 1059 |iiBeta| 1064 |iiBesselY|
              1069 |iiBesselK| 1074 |iiBesselJ| 1079 |iiBesselI| 1084
              |iiAiryBiPrime| 1089 |iiAiryBi| 1094 |iiAiryAiPrime| 1099
              |iiAiryAi| 1104 |iLambertW| 1109 |iAiryBiPrime| 1114 |iAiryBi|
              1119 |iAiryAiPrime| 1124 |iAiryAi| 1129 |hypergeometricF| 1134
              |hermiteH| 1141 |hankelH2| 1147 |hankelH1| 1153 |fractionPart|
              1159 |floor| 1164 |ellipticPi| 1169 |ellipticK| 1176 |ellipticF|
              1181 |ellipticE| 1187 |diracDelta| 1198 |digamma| 1203
              |conjugate| 1208 |coerce_Q| 1213 |charlierC| 1218 |ceiling| 1225
              |besselY| 1230 |besselK| 1236 |besselJ| 1242 |besselI| 1248
              |belong?| 1254 |angerJ| 1259 |airyBiPrime| 1265 |airyBi| 1270
              |airyAiPrime| 1275 |airyAi| 1280 |abs| 1285 |Gamma| 1290 |Beta|
              1301)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|belong?| ((|Boolean|) (|BasicOperator|))) T)
                              '((|operator|
                                 ((|BasicOperator|) (|BasicOperator|)))
                                T)
                              '((|abs| (|#2| |#2|)) T)
                              '((|sign| (|#2| |#2|)) T)
                              '((|unitStep| (|#2| |#2|)) T)
                              '((|ceiling| (|#2| |#2|)) T)
                              '((|floor| (|#2| |#2|)) T)
                              '((|fractionPart| (|#2| |#2|)) T)
                              '((|diracDelta| (|#2| |#2|)) T)
                              '((|conjugate| (|#2| |#2|)) T)
                              '((|Gamma| (|#2| |#2|)) T)
                              '((|Gamma| (|#2| |#2| |#2|)) T)
                              '((|Beta| (|#2| |#2| |#2|)) T)
                              '((|digamma| (|#2| |#2|)) T)
                              '((|polygamma| (|#2| |#2| |#2|)) T)
                              '((|besselJ| (|#2| |#2| |#2|)) T)
                              '((|besselY| (|#2| |#2| |#2|)) T)
                              '((|besselI| (|#2| |#2| |#2|)) T)
                              '((|besselK| (|#2| |#2| |#2|)) T)
                              '((|airyAi| (|#2| |#2|)) T)
                              '((|airyAiPrime| (|#2| |#2|)) T)
                              '((|airyBi| (|#2| |#2|)) T)
                              '((|airyBiPrime| (|#2| |#2|)) T)
                              '((|lambertW| (|#2| |#2|)) T)
                              '((|polylog| (|#2| |#2| |#2|)) T)
                              '((|weierstrassP| (|#2| |#2| |#2| |#2|)) T)
                              '((|weierstrassPPrime| (|#2| |#2| |#2| |#2|)) T)
                              '((|weierstrassSigma| (|#2| |#2| |#2| |#2|)) T)
                              '((|weierstrassZeta| (|#2| |#2| |#2| |#2|)) T)
                              '((|weierstrassPInverse| (|#2| |#2| |#2| |#2|))
                                T)
                              '((|whittakerM| (|#2| |#2| |#2| |#2|)) T)
                              '((|whittakerW| (|#2| |#2| |#2| |#2|)) T)
                              '((|angerJ| (|#2| |#2| |#2|)) T)
                              '((|weberE| (|#2| |#2| |#2|)) T)
                              '((|struveH| (|#2| |#2| |#2|)) T)
                              '((|struveL| (|#2| |#2| |#2|)) T)
                              '((|hankelH1| (|#2| |#2| |#2|)) T)
                              '((|hankelH2| (|#2| |#2| |#2|)) T)
                              '((|lommelS1| (|#2| |#2| |#2| |#2|)) T)
                              '((|lommelS2| (|#2| |#2| |#2| |#2|)) T)
                              '((|kummerM| (|#2| |#2| |#2| |#2|)) T)
                              '((|kummerU| (|#2| |#2| |#2| |#2|)) T)
                              '((|legendreP| (|#2| |#2| |#2| |#2|)) T)
                              '((|legendreQ| (|#2| |#2| |#2| |#2|)) T)
                              '((|kelvinBei| (|#2| |#2| |#2|)) T)
                              '((|kelvinBer| (|#2| |#2| |#2|)) T)
                              '((|kelvinKei| (|#2| |#2| |#2|)) T)
                              '((|kelvinKer| (|#2| |#2| |#2|)) T)
                              '((|ellipticK| (|#2| |#2|)) T)
                              '((|ellipticE| (|#2| |#2|)) T)
                              '((|ellipticE| (|#2| |#2| |#2|)) T)
                              '((|ellipticF| (|#2| |#2| |#2|)) T)
                              '((|ellipticPi| (|#2| |#2| |#2| |#2|)) T)
                              '((|jacobiSn| (|#2| |#2| |#2|)) T)
                              '((|jacobiCn| (|#2| |#2| |#2|)) T)
                              '((|jacobiDn| (|#2| |#2| |#2|)) T)
                              '((|jacobiZeta| (|#2| |#2| |#2|)) T)
                              '((|jacobiTheta| (|#2| |#2| |#2|)) T)
                              '((|lerchPhi| (|#2| |#2| |#2| |#2|)) T)
                              '((|riemannZeta| (|#2| |#2|)) T)
                              '((|charlierC| (|#2| |#2| |#2| |#2|)) T)
                              '((|hermiteH| (|#2| |#2| |#2|)) T)
                              '((|jacobiP| (|#2| |#2| |#2| |#2| |#2|)) T)
                              '((|laguerreL| (|#2| |#2| |#2| |#2|)) T)
                              '((|meixnerM| (|#2| |#2| |#2| |#2| |#2|)) T)
                              '((|hypergeometricF|
                                 (|#2| (|List| |#2|) (|List| |#2|) |#2|))
                                (|has| 7 (|RetractableTo| 87)))
                              '((|meijerG|
                                 (|#2| (|List| |#2|) (|List| |#2|)
                                  (|List| |#2|) (|List| |#2|) |#2|))
                                (|has| 7 (|RetractableTo| 87)))
                              '((|iiGamma| (|#2| |#2|)) T)
                              '((|iiabs| (|#2| |#2|)) T)
                              '((|iiconjugate| (|#2| |#2|)) T)
                              '((|iiBeta| (|#2| (|List| |#2|))) T)
                              '((|iidigamma| (|#2| |#2|)) T)
                              '((|iipolygamma| (|#2| (|List| |#2|))) T)
                              '((|iiBesselJ| (|#2| (|List| |#2|))) T)
                              '((|iiBesselY| (|#2| (|List| |#2|))) T)
                              '((|iiBesselI| (|#2| (|List| |#2|))) T)
                              '((|iiBesselK| (|#2| (|List| |#2|))) T)
                              '((|iiAiryAi| (|#2| |#2|)) T)
                              '((|iiAiryAiPrime| (|#2| |#2|)) T)
                              '((|iiAiryBi| (|#2| |#2|)) T)
                              '((|iiAiryBiPrime| (|#2| |#2|)) T)
                              '((|iAiryAi| (|#2| |#2|)) T)
                              '((|iAiryAiPrime| (|#2| |#2|)) T)
                              '((|iAiryBi| (|#2| |#2|)) T)
                              '((|iAiryBiPrime| (|#2| |#2|)) T)
                              '((|iiHypergeometricF| (|#2| (|List| |#2|))) T)
                              '((|iiPolylog| (|#2| |#2| |#2|)) T)
                              '((|iLambertW| (|#2| |#2|)) T)
                              '((|retract_Q|
                                 ((|Union| (|Fraction| (|Integer|)) "failed")
                                  |#2|))
                                T)
                              '((|coerce_Q| (|#2| (|Fraction| (|Integer|))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 341
                                            '(1 11 9 10 12 2 7 0 9 0 51 3 7 0 9
                                              0 0 61 4 7 0 9 0 0 0 76 0 6 0 81
                                              0 7 0 82 2 7 83 0 0 84 0 6 0 85 0
                                              7 0 86 1 7 0 87 88 2 89 0 0 0 90
                                              2 7 0 9 91 92 3 0 7 89 89 7 93 5
                                              0 7 89 89 89 89 7 94 1 7 9 9 95 1
                                              7 97 0 98 2 7 0 103 0 104 2 89 7
                                              0 87 107 0 10 0 108 1 7 0 10 109
                                              2 7 0 0 10 110 2 7 0 9 91 111 2 7
                                              0 0 0 112 2 7 0 0 0 113 2 117 9 9
                                              116 118 2 7 0 0 103 119 2 7 0 0 0
                                              120 2 7 0 0 0 121 1 7 0 0 122 0
                                              123 0 124 1 7 0 0 125 2 117 9 9
                                              126 127 3 9 0 0 10 130 131 0 7 0
                                              136 1 7 0 0 137 2 7 0 0 87 140 1
                                              7 0 0 141 2 7 0 0 0 144 0 174 0
                                              175 2 117 9 9 176 177 1 10 182 0
                                              183 1 182 0 91 184 2 9 0 0 185
                                              186 2 7 83 0 9 192 1 7 193 0 194
                                              1 195 89 0 196 5 7 0 9 0 0 0 0
                                              211 2 9 83 0 10 215 2 9 83 0 10
                                              217 2 7 0 9 0 219 1 7 83 0 220 1
                                              7 83 0 221 2 7 83 0 0 222 1 7 223
                                              0 224 1 0 223 7 225 1 7 0 174 226
                                              1 0 7 174 227 1 174 87 0 228 2
                                              117 9 9 176 229 1 174 87 0 230 1
                                              174 0 87 231 1 174 87 0 232 1 174
                                              0 0 233 1 0 7 7 234 1 0 7 7 235 1
                                              0 7 7 236 1 0 7 7 237 1 7 0 0 238
                                              1 0 7 7 239 1 7 0 0 240 1 7 0 0
                                              241 2 0 7 7 7 242 1 89 7 0 243 1
                                              7 244 0 245 1 247 246 0 248 1 246
                                              249 0 250 1 247 246 0 251 1 6 0 0
                                              252 1 7 0 6 253 1 0 7 7 254 1 7
                                              255 0 256 1 7 257 0 258 1 195 259
                                              0 260 0 259 0 261 2 259 83 0 0
                                              262 1 7 0 193 263 0 103 0 264 2 7
                                              0 266 193 267 2 270 89 268 269
                                              271 3 7 0 0 257 91 272 1 6 0 0
                                              273 1 7 274 0 275 2 123 0 276 0
                                              277 1 7 0 274 278 1 7 274 0 279 1
                                              7 249 0 280 1 6 0 0 281 1 0 7 7
                                              282 2 6 0 0 0 283 1 0 7 89 284 1
                                              6 0 0 285 1 0 7 7 286 2 6 0 0 0
                                              287 1 0 7 89 288 2 6 0 0 0 289 1
                                              0 7 89 290 2 6 0 0 0 291 1 0 7 89
                                              292 2 6 0 0 0 293 1 0 7 89 294 2
                                              6 0 0 0 295 1 0 7 89 296 1 6 0 0
                                              297 1 0 7 7 298 1 6 0 0 299 1 0 7
                                              7 300 1 6 0 0 301 1 0 7 7 302 1 6
                                              0 0 303 1 0 7 7 304 1 7 305 0 306
                                              1 87 0 0 307 1 89 7 0 308 1 0 7
                                              89 309 1 7 310 0 311 2 310 83 10
                                              0 312 2 314 313 0 87 315 1 313 0
                                              0 316 2 9 0 0 317 318 1 7 87 0
                                              319 2 322 320 321 89 323 2 89 0 0
                                              259 324 2 89 0 0 259 325 2 259 83
                                              0 0 326 2 320 87 0 87 327 2 328 0
                                              0 259 329 1 330 87 0 331 2 314 0
                                              0 259 332 2 314 0 0 259 333 1 313
                                              0 91 334 2 313 0 0 91 335 1 10
                                              313 0 336 2 338 314 317 337 339 2
                                              314 0 0 0 340 1 7 0 0 341 3 0 7 7
                                              7 7 133 3 0 7 7 7 7 129 3 0 7 7 7
                                              7 80 3 0 7 7 7 7 79 3 0 7 7 7 7
                                              78 3 0 7 7 7 7 115 3 0 7 7 7 7 77
                                              2 0 7 7 7 139 1 0 7 7 54 2 0 7 7
                                              7 146 2 0 7 7 7 143 1 0 7 7 53 1
                                              0 7 7 208 1 0 223 7 225 2 0 7 7 7
                                              75 2 0 7 7 7 65 1 0 9 9 218 4 0 7
                                              7 7 7 7 214 5 1 7 89 89 89 89 7
                                              94 3 0 7 7 7 7 154 3 0 7 7 7 7
                                              152 3 0 7 7 7 7 206 3 0 7 7 7 7
                                              162 3 0 7 7 7 7 160 1 0 7 7 74 3
                                              0 7 7 7 7 213 3 0 7 7 7 7 158 3 0
                                              7 7 7 7 156 2 0 7 7 7 169 2 0 7 7
                                              7 168 2 0 7 7 7 165 2 0 7 7 7 164
                                              2 0 7 7 7 202 2 0 7 7 7 204 2 0 7
                                              7 7 191 4 0 7 7 7 7 7 212 2 0 7 7
                                              7 198 2 0 7 7 7 197 1 0 7 89 288
                                              1 0 7 7 286 1 0 7 7 265 1 0 7 7
                                              254 2 0 7 7 7 242 1 0 7 89 309 1
                                              0 7 7 282 1 0 7 89 284 1 0 7 89
                                              292 1 0 7 89 296 1 0 7 89 290 1 0
                                              7 89 294 1 0 7 7 304 1 0 7 7 302
                                              1 0 7 7 300 1 0 7 7 298 1 0 7 7
                                              239 1 0 7 7 237 1 0 7 7 236 1 0 7
                                              7 235 1 0 7 7 234 3 1 7 89 89 7
                                              93 2 0 7 7 7 210 2 0 7 7 7 150 2
                                              0 7 7 7 148 1 0 7 7 57 1 0 7 7 56
                                              3 0 7 7 7 7 189 1 0 7 7 172 2 0 7
                                              7 7 181 1 0 7 7 173 2 0 7 7 7 180
                                              1 0 7 7 58 1 0 7 7 64 1 0 7 7 59
                                              1 0 7 174 227 3 0 7 7 7 7 209 1 0
                                              7 7 55 2 0 7 7 7 67 2 0 7 7 7 69
                                              2 0 7 7 7 66 2 0 7 7 7 68 1 0 83
                                              9 216 2 0 7 7 7 135 1 0 7 7 73 1
                                              0 7 7 72 1 0 7 7 71 1 0 7 7 70 1
                                              0 7 7 52 1 0 7 7 60 2 0 7 7 7 62
                                              2 0 7 7 7 63)))))
           '|lookupComplete|)) 
