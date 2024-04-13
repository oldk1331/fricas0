
(SDEFUN |FSPECF;abs;2F;1| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 13) |x| (QREFELT % 52))) 

(SDEFUN |FSPECF;sign;2F;2| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 14) |x| (QREFELT % 52))) 

(SDEFUN |FSPECF;unitStep;2F;3| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 15) |x| (QREFELT % 52))) 

(SDEFUN |FSPECF;ceiling;2F;4| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 16) |x| (QREFELT % 52))) 

(SDEFUN |FSPECF;floor;2F;5| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 17) |x| (QREFELT % 52))) 

(SDEFUN |FSPECF;fractionPart;2F;6| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 18) |x| (QREFELT % 52))) 

(SDEFUN |FSPECF;diracDelta;2F;7| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 19) |x| (QREFELT % 52))) 

(SDEFUN |FSPECF;conjugate;2F;8| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 20) |x| (QREFELT % 52))) 

(SDEFUN |FSPECF;Gamma;2F;9| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 21) |x| (QREFELT % 52))) 

(SDEFUN |FSPECF;Gamma;3F;10| ((|a| (F)) (|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 22) |a| |x| (QREFELT % 62))) 

(SDEFUN |FSPECF;Beta;3F;11| ((|x| (F)) (|y| (F)) (% (F)))
        (SPADCALL (QREFELT % 23) |x| |y| (QREFELT % 62))) 

(SDEFUN |FSPECF;Beta;4F;12| ((|x| (F)) (|a| (F)) (|b| (F)) (% (F)))
        (SPADCALL (QREFELT % 24) |x| |a| |b| (QREFELT % 65))) 

(SDEFUN |FSPECF;digamma;2F;13| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 25) |x| (QREFELT % 52))) 

(SDEFUN |FSPECF;polygamma;3F;14| ((|k| (F)) (|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 26) |k| |x| (QREFELT % 62))) 

(SDEFUN |FSPECF;besselJ;3F;15| ((|a| (F)) (|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 27) |a| |x| (QREFELT % 62))) 

(SDEFUN |FSPECF;besselY;3F;16| ((|a| (F)) (|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 28) |a| |x| (QREFELT % 62))) 

(SDEFUN |FSPECF;besselI;3F;17| ((|a| (F)) (|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 29) |a| |x| (QREFELT % 62))) 

(SDEFUN |FSPECF;besselK;3F;18| ((|a| (F)) (|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 30) |a| |x| (QREFELT % 62))) 

(SDEFUN |FSPECF;airyAi;2F;19| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 31) |x| (QREFELT % 52))) 

(SDEFUN |FSPECF;airyAiPrime;2F;20| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 32) |x| (QREFELT % 52))) 

(SDEFUN |FSPECF;airyBi;2F;21| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 33) |x| (QREFELT % 52))) 

(SDEFUN |FSPECF;airyBiPrime;2F;22| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 34) |x| (QREFELT % 52))) 

(SDEFUN |FSPECF;lambertW;2F;23| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 35) |x| (QREFELT % 52))) 

(SDEFUN |FSPECF;polylog;3F;24| ((|s| (F)) (|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 36) |s| |x| (QREFELT % 62))) 

(SDEFUN |FSPECF;weierstrassP;4F;25| ((|g2| (F)) (|g3| (F)) (|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 37) |g2| |g3| |x| (QREFELT % 65))) 

(SDEFUN |FSPECF;weierstrassPPrime;4F;26|
        ((|g2| (F)) (|g3| (F)) (|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 38) |g2| |g3| |x| (QREFELT % 65))) 

(SDEFUN |FSPECF;weierstrassSigma;4F;27|
        ((|g2| (F)) (|g3| (F)) (|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 39) |g2| |g3| |x| (QREFELT % 65))) 

(SDEFUN |FSPECF;weierstrassZeta;4F;28|
        ((|g2| (F)) (|g3| (F)) (|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 40) |g2| |g3| |x| (QREFELT % 65))) 

(SDEFUN |FSPECF;hypergeometricF;2L2F;29|
        ((|a| (|List| F)) (|b| (|List| F)) (|z| (F)) (% (F)))
        (SPROG
         ((|q| (F)) (|p| (F)) (|nbi| #1=(|NonNegativeInteger|)) (|nai| #1#))
         (SEQ (LETT |nai| (LENGTH |a|)) (LETT |nbi| (LENGTH |b|))
              (COND
               ((SPADCALL |z| (|spadConstant| % 84) (QREFELT % 86))
                (COND ((<= |nai| (+ |nbi| 1)) (EXIT (|spadConstant| % 88))))))
              (LETT |p| (SPADCALL (LENGTH |a|) (QREFELT % 90)))
              (LETT |q| (SPADCALL (LENGTH |b|) (QREFELT % 90)))
              (EXIT
               (SPADCALL (QREFELT % 41)
                         (SPADCALL
                          (SPADCALL |a|
                                    (SPADCALL |b| (LIST |z|) (QREFELT % 92))
                                    (QREFELT % 92))
                          (LIST |p| |q|) (QREFELT % 92))
                         (QREFELT % 94)))))) 

(SDEFUN |FSPECF;meijerG;4L2F;30|
        ((|a| (|List| F)) (|b| (|List| F)) (|c| (|List| F)) (|d| (|List| F))
         (|z| (F)) (% (F)))
        (SPROG ((|m2| (F)) (|m1| (F)) (|n2| (F)) (|n1| (F)))
               (SEQ (LETT |n1| (SPADCALL (LENGTH |a|) (QREFELT % 90)))
                    (LETT |n2| (SPADCALL (LENGTH |b|) (QREFELT % 90)))
                    (LETT |m1| (SPADCALL (LENGTH |c|) (QREFELT % 90)))
                    (LETT |m2| (SPADCALL (LENGTH |d|) (QREFELT % 90)))
                    (EXIT
                     (SPADCALL (QREFELT % 42)
                               (SPADCALL
                                (SPADCALL |a|
                                          (SPADCALL |b|
                                                    (SPADCALL |c|
                                                              (SPADCALL |d|
                                                                        (LIST
                                                                         |z|)
                                                                        (QREFELT
                                                                         % 92))
                                                              (QREFELT % 92))
                                                    (QREFELT % 92))
                                          (QREFELT % 92))
                                (LIST |n1| |n2| |m1| |m2|) (QREFELT % 92))
                               (QREFELT % 94)))))) 

(SDEFUN |FSPECF;grad2|
        ((|l| (|List| F)) (|t| (|Symbol|)) (|op| (|BasicOperator|))
         (|d2| (|Mapping| F F F)) (% (F)))
        (SPROG ((|dm| (F)) (|x2| (F)) (|x1| (F)))
               (SEQ (LETT |x1| (SPADCALL |l| 1 (QREFELT % 109)))
                    (LETT |x2| (SPADCALL |l| 2 (QREFELT % 109)))
                    (LETT |dm|
                          (SPADCALL (SPADCALL (QREFELT % 110))
                                    (QREFELT % 111)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL (SPADCALL |x1| |t| (QREFELT % 112))
                                (SPADCALL (QREFELT % 98)
                                          (LIST
                                           (SPADCALL |op| (LIST |dm| |x2|)
                                                     (QREFELT % 94))
                                           |dm| |x1|)
                                          (QREFELT % 113))
                                (QREFELT % 114))
                      (SPADCALL (SPADCALL |x2| |t| (QREFELT % 112))
                                (SPADCALL |x1| |x2| |d2|) (QREFELT % 114))
                      (QREFELT % 115)))))) 

(SDEFUN |FSPECF;grad3|
        ((|l| (|List| F)) (|t| (|Symbol|)) (|op| (|BasicOperator|))
         (|d3| (|Mapping| F F F F)) (% (F)))
        (SPROG ((|dm2| (F)) (|dm1| (F)) (|x3| (F)) (|x2| (F)) (|x1| (F)))
               (SEQ (LETT |x1| (SPADCALL |l| 1 (QREFELT % 109)))
                    (LETT |x2| (SPADCALL |l| 2 (QREFELT % 109)))
                    (LETT |x3| (SPADCALL |l| 3 (QREFELT % 109)))
                    (LETT |dm1|
                          (SPADCALL (SPADCALL (QREFELT % 110))
                                    (QREFELT % 111)))
                    (LETT |dm2|
                          (SPADCALL (SPADCALL (QREFELT % 110))
                                    (QREFELT % 111)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL |x1| |t| (QREFELT % 112))
                                 (SPADCALL (QREFELT % 98)
                                           (LIST
                                            (SPADCALL |op|
                                                      (LIST |dm1| |x2| |x3|)
                                                      (QREFELT % 94))
                                            |dm1| |x1|)
                                           (QREFELT % 113))
                                 (QREFELT % 114))
                       (SPADCALL (SPADCALL |x2| |t| (QREFELT % 112))
                                 (SPADCALL (QREFELT % 98)
                                           (LIST
                                            (SPADCALL |op|
                                                      (LIST |x1| |dm2| |x3|)
                                                      (QREFELT % 94))
                                            |dm2| |x2|)
                                           (QREFELT % 113))
                                 (QREFELT % 114))
                       (QREFELT % 115))
                      (SPADCALL (SPADCALL |x3| |t| (QREFELT % 112))
                                (SPADCALL |x1| |x2| |x3| |d3|) (QREFELT % 114))
                      (QREFELT % 115)))))) 

(SDEFUN |FSPECF;grad4|
        ((|l| (|List| F)) (|t| (|Symbol|)) (|op| (|BasicOperator|))
         (|d4| (|Mapping| F F F F F)) (% (F)))
        (SPROG
         ((|kd3| (F)) (|kd2| (F)) (|kd1| (F)) (|dm3| (F)) (|dm2| (F))
          (|dm1| (F)) (|x4| (F)) (|x3| (F)) (|x2| (F)) (|x1| (F)))
         (SEQ (LETT |x1| (SPADCALL |l| 1 (QREFELT % 109)))
              (LETT |x2| (SPADCALL |l| 2 (QREFELT % 109)))
              (LETT |x3| (SPADCALL |l| 3 (QREFELT % 109)))
              (LETT |x4| (SPADCALL |l| 4 (QREFELT % 109)))
              (LETT |dm1|
                    (SPADCALL (SPADCALL (QREFELT % 110)) (QREFELT % 111)))
              (LETT |dm2|
                    (SPADCALL (SPADCALL (QREFELT % 110)) (QREFELT % 111)))
              (LETT |dm3|
                    (SPADCALL (SPADCALL (QREFELT % 110)) (QREFELT % 111)))
              (LETT |kd1|
                    (SPADCALL (QREFELT % 98)
                              (LIST
                               (SPADCALL |op| (LIST |dm1| |x2| |x3| |x4|)
                                         (QREFELT % 94))
                               |dm1| |x1|)
                              (QREFELT % 113)))
              (LETT |kd2|
                    (SPADCALL (QREFELT % 98)
                              (LIST
                               (SPADCALL |op| (LIST |x1| |dm2| |x3| |x4|)
                                         (QREFELT % 94))
                               |dm2| |x2|)
                              (QREFELT % 113)))
              (LETT |kd3|
                    (SPADCALL (QREFELT % 98)
                              (LIST
                               (SPADCALL |op| (LIST |x1| |x2| |dm3| |x4|)
                                         (QREFELT % 94))
                               |dm3| |x3|)
                              (QREFELT % 113)))
              (EXIT
               (SPADCALL
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL |x1| |t| (QREFELT % 112)) |kd1|
                            (QREFELT % 114))
                  (SPADCALL (SPADCALL |x2| |t| (QREFELT % 112)) |kd2|
                            (QREFELT % 114))
                  (QREFELT % 115))
                 (SPADCALL (SPADCALL |x3| |t| (QREFELT % 112)) |kd3|
                           (QREFELT % 114))
                 (QREFELT % 115))
                (SPADCALL (SPADCALL |x4| |t| (QREFELT % 112))
                          (SPADCALL |x1| |x2| |x3| |x4| |d4|) (QREFELT % 114))
                (QREFELT % 115)))))) 

(SDEFUN |FSPECF;weierstrassPInverse;4F;34|
        ((|g2| (F)) (|g3| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 116) |g2| |g3| |z| (QREFELT % 65))) 

(SDEFUN |FSPECF;eWeierstrassPInverse| ((|g2| (F)) (|g3| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 116) (LIST |g2| |g3| |z|) (QREFELT % 113))) 

(SDEFUN |FSPECF;elWeierstrassPInverse| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eWeierstrassPInverse| (SPADCALL |l| 1 (QREFELT % 109))
         (SPADCALL |l| 2 (QREFELT % 109)) (SPADCALL |l| 3 (QREFELT % 109)) %)) 

(SDEFUN |FSPECF;eWeierstrassPInverseGrad_g2| ((|l| (|List| F)) (% (F)))
        (SPROG
         ((|s2| (F)) (|s1| (F)) (|delta| (F)) (|wpi| (F)) (|z| (F)) (|g3| (F))
          (|g2| (F)))
         (SEQ (LETT |g2| (SPADCALL |l| 1 (QREFELT % 109)))
              (LETT |g3| (SPADCALL |l| 2 (QREFELT % 109)))
              (LETT |z| (SPADCALL |l| 3 (QREFELT % 109)))
              (LETT |wpi| (SPADCALL |g2| |g3| |z| (QREFELT % 117)))
              (LETT |delta|
                    (SPADCALL (SPADCALL |g2| 3 (QREFELT % 121))
                              (SPADCALL 27 (SPADCALL |g3| 2 (QREFELT % 121))
                                        (QREFELT % 106))
                              (QREFELT % 122)))
              (LETT |s1|
                    (SPADCALL
                     (SPADCALL (SPADCALL 18 |g3| (QREFELT % 106))
                               (SPADCALL |g2| |g3| |wpi| (QREFELT % 82))
                               (QREFELT % 114))
                     (SPADCALL (SPADCALL |g2| 2 (QREFELT % 121)) |wpi|
                               (QREFELT % 114))
                     (QREFELT % 122)))
              (LETT |s2|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (SPADCALL 36 |g3| (QREFELT % 106))
                                (SPADCALL |z| 2 (QREFELT % 121))
                                (QREFELT % 114))
                      (SPADCALL
                       (SPADCALL 2 (SPADCALL |g2| 2 (QREFELT % 121))
                                 (QREFELT % 106))
                       |z| (QREFELT % 114))
                      (QREFELT % 122))
                     (SPADCALL (SPADCALL 6 |g2| (QREFELT % 106)) |g3|
                               (QREFELT % 114))
                     (QREFELT % 122)))
              (EXIT
               (SPADCALL
                (SPADCALL |s1|
                          (SPADCALL |s2|
                                    (SPADCALL |g2| |g3| |wpi| (QREFELT % 80))
                                    (QREFELT % 123))
                          (QREFELT % 115))
                (SPADCALL 4 |delta| (QREFELT % 106)) (QREFELT % 123)))))) 

(SDEFUN |FSPECF;eWeierstrassPInverseGrad_g3| ((|l| (|List| F)) (% (F)))
        (SPROG
         ((|s2| (F)) (|s1| (F)) (|delta| (F)) (|wpi| (F)) (|z| (F)) (|g3| (F))
          (|g2| (F)))
         (SEQ (LETT |g2| (SPADCALL |l| 1 (QREFELT % 109)))
              (LETT |g3| (SPADCALL |l| 2 (QREFELT % 109)))
              (LETT |z| (SPADCALL |l| 3 (QREFELT % 109)))
              (LETT |wpi| (SPADCALL |g2| |g3| |z| (QREFELT % 117)))
              (LETT |delta|
                    (SPADCALL (SPADCALL |g2| 3 (QREFELT % 121))
                              (SPADCALL 27 (SPADCALL |g3| 2 (QREFELT % 121))
                                        (QREFELT % 106))
                              (QREFELT % 122)))
              (LETT |s1|
                    (SPADCALL
                     (SPADCALL (SPADCALL 9 |g3| (QREFELT % 106)) |wpi|
                               (QREFELT % 114))
                     (SPADCALL (SPADCALL 6 |g2| (QREFELT % 106))
                               (SPADCALL |g2| |g3| |wpi| (QREFELT % 82))
                               (QREFELT % 114))
                     (QREFELT % 122)))
              (LETT |s2|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL 12 |g2| (QREFELT % 106))
                                 (SPADCALL |z| 2 (QREFELT % 121))
                                 (QREFELT % 114))
                       (QREFELT % 124))
                      (SPADCALL (SPADCALL 18 |g3| (QREFELT % 106)) |z|
                                (QREFELT % 114))
                      (QREFELT % 115))
                     (SPADCALL 2 (SPADCALL |g2| 2 (QREFELT % 121))
                               (QREFELT % 106))
                     (QREFELT % 115)))
              (EXIT
               (SPADCALL
                (SPADCALL |s1|
                          (SPADCALL |s2|
                                    (SPADCALL |g2| |g3| |wpi| (QREFELT % 80))
                                    (QREFELT % 123))
                          (QREFELT % 115))
                (SPADCALL 2 |delta| (QREFELT % 106)) (QREFELT % 123)))))) 

(SDEFUN |FSPECF;eWeierstrassPInverseGrad_z| ((|l| (|List| F)) (% (F)))
        (SPROG ((|z| (F)) (|g3| (F)) (|g2| (F)))
               (SEQ (LETT |g2| (SPADCALL |l| 1 (QREFELT % 109)))
                    (LETT |g3| (SPADCALL |l| 2 (QREFELT % 109)))
                    (LETT |z| (SPADCALL |l| 3 (QREFELT % 109)))
                    (EXIT
                     (SPADCALL (|spadConstant| % 88)
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL 4 (SPADCALL |z| 3 (QREFELT % 121))
                                            (QREFELT % 106))
                                  (SPADCALL |g2| |z| (QREFELT % 114))
                                  (QREFELT % 122))
                                 |g3| (QREFELT % 122))
                                (QREFELT % 127))
                               (QREFELT % 123)))))) 

(SDEFUN |FSPECF;whittakerM;4F;40| ((|k| (F)) (|m| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 130) |k| |m| |z| (QREFELT % 65))) 

(SDEFUN |FSPECF;eWhittakerM| ((|k| (F)) (|m| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 130) (LIST |k| |m| |z|) (QREFELT % 113))) 

(SDEFUN |FSPECF;elWhittakerM| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eWhittakerM| (SPADCALL |l| 1 (QREFELT % 109))
         (SPADCALL |l| 2 (QREFELT % 109)) (SPADCALL |l| 3 (QREFELT % 109)) %)) 

(SDEFUN |FSPECF;eWhittakerMGrad_z| ((|k| (F)) (|m| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL (QREFELT % 101) (SPADCALL |k| |z| (QREFELT % 123))
                    (QREFELT % 122))
          (SPADCALL |k| |m| |z| (QREFELT % 131)) (QREFELT % 114))
         (SPADCALL
          (SPADCALL
           (SPADCALL (SPADCALL (QREFELT % 101) |k| (QREFELT % 115)) |m|
                     (QREFELT % 115))
           (SPADCALL (SPADCALL |k| (|spadConstant| % 88) (QREFELT % 115)) |m|
                     |z| (QREFELT % 131))
           (QREFELT % 114))
          |z| (QREFELT % 123))
         (QREFELT % 115))) 

(SDEFUN |FSPECF;dWhittakerM| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad3| |l| |t| (QREFELT % 130)
         (CONS (|function| |FSPECF;eWhittakerMGrad_z|) %) %)) 

(SDEFUN |FSPECF;whittakerW;4F;45| ((|k| (F)) (|m| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 134) |k| |m| |z| (QREFELT % 65))) 

(SDEFUN |FSPECF;eWhittakerW| ((|k| (F)) (|m| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 134) (LIST |k| |m| |z|) (QREFELT % 113))) 

(SDEFUN |FSPECF;elWhittakerW| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eWhittakerW| (SPADCALL |l| 1 (QREFELT % 109))
         (SPADCALL |l| 2 (QREFELT % 109)) (SPADCALL |l| 3 (QREFELT % 109)) %)) 

(SDEFUN |FSPECF;eWhittakerWGrad_z| ((|k| (F)) (|m| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL (QREFELT % 101) (SPADCALL |k| |z| (QREFELT % 123))
                    (QREFELT % 122))
          (SPADCALL |k| |m| |z| (QREFELT % 135)) (QREFELT % 114))
         (SPADCALL
          (SPADCALL (SPADCALL |k| (|spadConstant| % 88) (QREFELT % 115)) |m|
                    |z| (QREFELT % 135))
          |z| (QREFELT % 123))
         (QREFELT % 122))) 

(SDEFUN |FSPECF;dWhittakerW| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad3| |l| |t| (QREFELT % 134)
         (CONS (|function| |FSPECF;eWhittakerWGrad_z|) %) %)) 

(SDEFUN |FSPECF;angerJ;3F;50| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 136) |v| |z| (QREFELT % 62))) 

(SDEFUN |FSPECF;eAngerJ| ((|v| (F)) (|z| (F)) (% (F)))
        (COND
         ((SPADCALL |z| (|spadConstant| % 84) (QREFELT % 86))
          (SPADCALL
           (SPADCALL (SPADCALL |v| (SPADCALL (QREFELT % 138)) (QREFELT % 114))
                     (QREFELT % 139))
           (SPADCALL |v| (SPADCALL (QREFELT % 138)) (QREFELT % 114))
           (QREFELT % 123)))
         ('T (SPADCALL (QREFELT % 136) (LIST |v| |z|) (QREFELT % 113))))) 

(SDEFUN |FSPECF;elAngerJ| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eAngerJ| (SPADCALL |l| 1 (QREFELT % 109))
         (SPADCALL |l| 2 (QREFELT % 109)) %)) 

(SDEFUN |FSPECF;eAngerJGrad_z| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL (SPADCALL |v| (|spadConstant| % 88) (QREFELT % 115)) |z|
                     (QREFELT % 137))
           (QREFELT % 124))
          (SPADCALL
           (SPADCALL |v| (SPADCALL |v| |z| (QREFELT % 137)) (QREFELT % 114))
           |z| (QREFELT % 123))
          (QREFELT % 115))
         (SPADCALL
          (SPADCALL (SPADCALL |v| (SPADCALL (QREFELT % 138)) (QREFELT % 114))
                    (QREFELT % 139))
          (SPADCALL (SPADCALL (QREFELT % 138)) |z| (QREFELT % 114))
          (QREFELT % 123))
         (QREFELT % 122))) 

(SDEFUN |FSPECF;dAngerJ| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad2| |l| |t| (QREFELT % 136)
         (CONS (|function| |FSPECF;eAngerJGrad_z|) %) %)) 

(SDEFUN |FSPECF;eeAngerJ| ((|l| (|List| F)) (% (F)))
        (SPADCALL (QREFELT % 136) |l| (QREFELT % 113))) 

(SDEFUN |FSPECF;weberE;3F;56| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 140) |v| |z| (QREFELT % 62))) 

(SDEFUN |FSPECF;eWeberE| ((|v| (F)) (|z| (F)) (% (F)))
        (COND
         ((SPADCALL |z| (|spadConstant| % 84) (QREFELT % 86))
          (SPADCALL
           (SPADCALL 2
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL (QREFELT % 101) |v| (QREFELT % 114))
                                 (SPADCALL (QREFELT % 138)) (QREFELT % 114))
                       (QREFELT % 139))
                      2 (QREFELT % 142))
                     (QREFELT % 106))
           (SPADCALL |v| (SPADCALL (QREFELT % 138)) (QREFELT % 114))
           (QREFELT % 123)))
         ('T (SPADCALL (QREFELT % 140) (LIST |v| |z|) (QREFELT % 113))))) 

(SDEFUN |FSPECF;elWeberE| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eWeberE| (SPADCALL |l| 1 (QREFELT % 109))
         (SPADCALL |l| 2 (QREFELT % 109)) %)) 

(SDEFUN |FSPECF;eWeberEGrad_z| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL (SPADCALL |v| (|spadConstant| % 88) (QREFELT % 115)) |z|
                     (QREFELT % 141))
           (QREFELT % 124))
          (SPADCALL
           (SPADCALL |v| (SPADCALL |v| |z| (QREFELT % 141)) (QREFELT % 114))
           |z| (QREFELT % 123))
          (QREFELT % 115))
         (SPADCALL
          (SPADCALL (|spadConstant| % 88)
                    (SPADCALL
                     (SPADCALL |v| (SPADCALL (QREFELT % 138)) (QREFELT % 114))
                     (QREFELT % 143))
                    (QREFELT % 122))
          (SPADCALL (SPADCALL (QREFELT % 138)) |z| (QREFELT % 114))
          (QREFELT % 123))
         (QREFELT % 122))) 

(SDEFUN |FSPECF;dWeberE| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad2| |l| |t| (QREFELT % 140)
         (CONS (|function| |FSPECF;eWeberEGrad_z|) %) %)) 

(SDEFUN |FSPECF;eeWeberE| ((|l| (|List| F)) (% (F)))
        (SPADCALL (QREFELT % 140) |l| (QREFELT % 113))) 

(SDEFUN |FSPECF;struveH;3F;62| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 144) |v| |z| (QREFELT % 62))) 

(SDEFUN |FSPECF;eStruveH| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 144) (LIST |v| |z|) (QREFELT % 113))) 

(SDEFUN |FSPECF;elStruveH| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eStruveH| (SPADCALL |l| 1 (QREFELT % 109))
         (SPADCALL |l| 2 (QREFELT % 109)) %)) 

(SDEFUN |FSPECF;eStruveHGrad_z| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL (SPADCALL |v| (|spadConstant| % 88) (QREFELT % 115)) |z|
                     (QREFELT % 145))
           (QREFELT % 124))
          (SPADCALL
           (SPADCALL |v| (SPADCALL |v| |z| (QREFELT % 145)) (QREFELT % 114))
           |z| (QREFELT % 123))
          (QREFELT % 115))
         (SPADCALL
          (SPADCALL (SPADCALL (QREFELT % 101) |z| (QREFELT % 114)) |v|
                    (QREFELT % 146))
          (SPADCALL (SPADCALL (SPADCALL (QREFELT % 138)) (QREFELT % 127))
                    (SPADCALL (SPADCALL |v| (QREFELT % 108) (QREFELT % 115))
                              (QREFELT % 61))
                    (QREFELT % 114))
          (QREFELT % 123))
         (QREFELT % 115))) 

(SDEFUN |FSPECF;dStruveH| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad2| |l| |t| (QREFELT % 144)
         (CONS (|function| |FSPECF;eStruveHGrad_z|) %) %)) 

(SDEFUN |FSPECF;struveL;3F;67| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 147) |v| |z| (QREFELT % 62))) 

(SDEFUN |FSPECF;eStruveL| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 147) (LIST |v| |z|) (QREFELT % 113))) 

(SDEFUN |FSPECF;elStruveL| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eStruveL| (SPADCALL |l| 1 (QREFELT % 109))
         (SPADCALL |l| 2 (QREFELT % 109)) %)) 

(SDEFUN |FSPECF;eStruveLGrad_z| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL (SPADCALL |v| (|spadConstant| % 88) (QREFELT % 115)) |z|
                    (QREFELT % 148))
          (SPADCALL
           (SPADCALL |v| (SPADCALL |v| |z| (QREFELT % 148)) (QREFELT % 114))
           |z| (QREFELT % 123))
          (QREFELT % 115))
         (SPADCALL
          (SPADCALL (SPADCALL (QREFELT % 101) |z| (QREFELT % 114)) |v|
                    (QREFELT % 146))
          (SPADCALL (SPADCALL (SPADCALL (QREFELT % 138)) (QREFELT % 127))
                    (SPADCALL (SPADCALL |v| (QREFELT % 108) (QREFELT % 115))
                              (QREFELT % 61))
                    (QREFELT % 114))
          (QREFELT % 123))
         (QREFELT % 115))) 

(SDEFUN |FSPECF;dStruveL| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad2| |l| |t| (QREFELT % 147)
         (CONS (|function| |FSPECF;eStruveLGrad_z|) %) %)) 

(SDEFUN |FSPECF;hankelH1;3F;72| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 149) |v| |z| (QREFELT % 62))) 

(SDEFUN |FSPECF;eHankelH1| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 149) (LIST |v| |z|) (QREFELT % 113))) 

(SDEFUN |FSPECF;elHankelH1| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eHankelH1| (SPADCALL |l| 1 (QREFELT % 109))
         (SPADCALL |l| 2 (QREFELT % 109)) %)) 

(SDEFUN |FSPECF;eHankelH1Grad_z| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL (SPADCALL |v| (|spadConstant| % 88) (QREFELT % 115)) |z|
                    (QREFELT % 150))
          (QREFELT % 124))
         (SPADCALL
          (SPADCALL |v| (SPADCALL |v| |z| (QREFELT % 150)) (QREFELT % 114)) |z|
          (QREFELT % 123))
         (QREFELT % 115))) 

(SDEFUN |FSPECF;dHankelH1| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad2| |l| |t| (QREFELT % 149)
         (CONS (|function| |FSPECF;eHankelH1Grad_z|) %) %)) 

(SDEFUN |FSPECF;hankelH2;3F;77| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 151) |v| |z| (QREFELT % 62))) 

(SDEFUN |FSPECF;eHankelH2| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 151) (LIST |v| |z|) (QREFELT % 113))) 

(SDEFUN |FSPECF;elHankelH2| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eHankelH2| (SPADCALL |l| 1 (QREFELT % 109))
         (SPADCALL |l| 2 (QREFELT % 109)) %)) 

(SDEFUN |FSPECF;eHankelH2Grad_z| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL (SPADCALL |v| (|spadConstant| % 88) (QREFELT % 115)) |z|
                    (QREFELT % 152))
          (QREFELT % 124))
         (SPADCALL
          (SPADCALL |v| (SPADCALL |v| |z| (QREFELT % 152)) (QREFELT % 114)) |z|
          (QREFELT % 123))
         (QREFELT % 115))) 

(SDEFUN |FSPECF;dHankelH2| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad2| |l| |t| (QREFELT % 151)
         (CONS (|function| |FSPECF;eHankelH2Grad_z|) %) %)) 

(SDEFUN |FSPECF;lommelS1;4F;82| ((|m| (F)) (|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 153) |m| |v| |z| (QREFELT % 65))) 

(SDEFUN |FSPECF;eLommelS1| ((|m| (F)) (|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 153) (LIST |m| |v| |z|) (QREFELT % 113))) 

(SDEFUN |FSPECF;elLommelS1| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eLommelS1| (SPADCALL |l| 1 (QREFELT % 109))
         (SPADCALL |l| 2 (QREFELT % 109)) (SPADCALL |l| 3 (QREFELT % 109)) %)) 

(SDEFUN |FSPECF;eLommelS1Grad_z| ((|m| (F)) (|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL |v| (SPADCALL |m| |v| |z| (QREFELT % 154))
                     (QREFELT % 114))
           |z| (QREFELT % 123))
          (QREFELT % 124))
         (SPADCALL
          (SPADCALL (SPADCALL |m| |v| (QREFELT % 115)) (|spadConstant| % 88)
                    (QREFELT % 122))
          (SPADCALL (SPADCALL |m| (|spadConstant| % 88) (QREFELT % 122))
                    (SPADCALL |v| (|spadConstant| % 88) (QREFELT % 122)) |z|
                    (QREFELT % 154))
          (QREFELT % 114))
         (QREFELT % 115))) 

(SDEFUN |FSPECF;dLommelS1| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad3| |l| |t| (QREFELT % 153)
         (CONS (|function| |FSPECF;eLommelS1Grad_z|) %) %)) 

(SDEFUN |FSPECF;lommelS2;4F;87| ((|mu| (F)) (|nu| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 155) |mu| |nu| |z| (QREFELT % 65))) 

(SDEFUN |FSPECF;eLommelS2| ((|mu| (F)) (|nu| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 155) (LIST |mu| |nu| |z|) (QREFELT % 113))) 

(SDEFUN |FSPECF;elLommelS2| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eLommelS2| (SPADCALL |l| 1 (QREFELT % 109))
         (SPADCALL |l| 2 (QREFELT % 109)) (SPADCALL |l| 3 (QREFELT % 109)) %)) 

(SDEFUN |FSPECF;eLommelS2Grad_z| ((|m| (F)) (|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL |v| (SPADCALL |m| |v| |z| (QREFELT % 156))
                     (QREFELT % 114))
           |z| (QREFELT % 123))
          (QREFELT % 124))
         (SPADCALL
          (SPADCALL (SPADCALL |m| |v| (QREFELT % 115)) (|spadConstant| % 88)
                    (QREFELT % 122))
          (SPADCALL (SPADCALL |m| (|spadConstant| % 88) (QREFELT % 122))
                    (SPADCALL |v| (|spadConstant| % 88) (QREFELT % 122)) |z|
                    (QREFELT % 156))
          (QREFELT % 114))
         (QREFELT % 115))) 

(SDEFUN |FSPECF;dLommelS2| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad3| |l| |t| (QREFELT % 155)
         (CONS (|function| |FSPECF;eLommelS2Grad_z|) %) %)) 

(SDEFUN |FSPECF;kummerM;4F;92| ((|mu| (F)) (|nu| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 157) |mu| |nu| |z| (QREFELT % 65))) 

(SDEFUN |FSPECF;eKummerM| ((|a| (F)) (|b| (F)) (|z| (F)) (% (F)))
        (COND
         ((SPADCALL |z| (|spadConstant| % 84) (QREFELT % 86))
          (|spadConstant| % 88))
         ('T (SPADCALL (QREFELT % 157) (LIST |a| |b| |z|) (QREFELT % 113))))) 

(SDEFUN |FSPECF;elKummerM| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eKummerM| (SPADCALL |l| 1 (QREFELT % 109))
         (SPADCALL |l| 2 (QREFELT % 109)) (SPADCALL |l| 3 (QREFELT % 109)) %)) 

(SDEFUN |FSPECF;eKummerMGrad_z| ((|a| (F)) (|b| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL (SPADCALL |z| |a| (QREFELT % 115)) |b| (QREFELT % 122))
           (SPADCALL |a| |b| |z| (QREFELT % 158)) (QREFELT % 114))
          (SPADCALL (SPADCALL |b| |a| (QREFELT % 122))
                    (SPADCALL
                     (SPADCALL |a| (|spadConstant| % 88) (QREFELT % 122)) |b|
                     |z| (QREFELT % 158))
                    (QREFELT % 114))
          (QREFELT % 115))
         |z| (QREFELT % 123))) 

(SDEFUN |FSPECF;dKummerM| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad3| |l| |t| (QREFELT % 157)
         (CONS (|function| |FSPECF;eKummerMGrad_z|) %) %)) 

(SDEFUN |FSPECF;kummerU;4F;97| ((|a| (F)) (|b| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 159) |a| |b| |z| (QREFELT % 65))) 

(SDEFUN |FSPECF;eKummerU| ((|a| (F)) (|b| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 159) (LIST |a| |b| |z|) (QREFELT % 113))) 

(SDEFUN |FSPECF;elKummerU| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eKummerU| (SPADCALL |l| 1 (QREFELT % 109))
         (SPADCALL |l| 2 (QREFELT % 109)) (SPADCALL |l| 3 (QREFELT % 109)) %)) 

(SDEFUN |FSPECF;eKummerUGrad_z| ((|a| (F)) (|b| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL (SPADCALL |z| |a| (QREFELT % 115)) |b| (QREFELT % 122))
           (SPADCALL |a| |b| |z| (QREFELT % 160)) (QREFELT % 114))
          (SPADCALL (SPADCALL |a| (|spadConstant| % 88) (QREFELT % 122)) |b|
                    |z| (QREFELT % 160))
          (QREFELT % 122))
         |z| (QREFELT % 123))) 

(SDEFUN |FSPECF;dKummerU| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad3| |l| |t| (QREFELT % 159)
         (CONS (|function| |FSPECF;eKummerUGrad_z|) %) %)) 

(SDEFUN |FSPECF;legendreP;4F;102| ((|nu| (F)) (|mu| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 161) |nu| |mu| |z| (QREFELT % 65))) 

(SDEFUN |FSPECF;eLegendreP| ((|nu| (F)) (|mu| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 161) (LIST |nu| |mu| |z|) (QREFELT % 113))) 

(SDEFUN |FSPECF;elLegendreP| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eLegendreP| (SPADCALL |l| 1 (QREFELT % 109))
         (SPADCALL |l| 2 (QREFELT % 109)) (SPADCALL |l| 3 (QREFELT % 109)) %)) 

(SDEFUN |FSPECF;eLegendrePGrad_z| ((|nu| (F)) (|mu| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL (SPADCALL |nu| |mu| (QREFELT % 122)) (|spadConstant| % 88)
                    (QREFELT % 115))
          (SPADCALL (SPADCALL |nu| (|spadConstant| % 88) (QREFELT % 115)) |mu|
                    |z| (QREFELT % 162))
          (QREFELT % 114))
         (SPADCALL
          (SPADCALL (SPADCALL |nu| (|spadConstant| % 88) (QREFELT % 115)) |z|
                    (QREFELT % 114))
          (SPADCALL |nu| |mu| |z| (QREFELT % 162)) (QREFELT % 114))
         (QREFELT % 122))) 

(SDEFUN |FSPECF;dLegendreP| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad3| |l| |t| (QREFELT % 161)
         (CONS (|function| |FSPECF;eLegendrePGrad_z|) %) %)) 

(SDEFUN |FSPECF;legendreQ;4F;107| ((|nu| (F)) (|mu| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 163) |nu| |mu| |z| (QREFELT % 65))) 

(SDEFUN |FSPECF;eLegendreQ| ((|nu| (F)) (|mu| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 163) (LIST |nu| |mu| |z|) (QREFELT % 113))) 

(SDEFUN |FSPECF;elLegendreQ| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eLegendreQ| (SPADCALL |l| 1 (QREFELT % 109))
         (SPADCALL |l| 2 (QREFELT % 109)) (SPADCALL |l| 3 (QREFELT % 109)) %)) 

(SDEFUN |FSPECF;eLegendreQGrad_z| ((|nu| (F)) (|mu| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL (SPADCALL |nu| |mu| (QREFELT % 122)) (|spadConstant| % 88)
                    (QREFELT % 115))
          (SPADCALL (SPADCALL |nu| (|spadConstant| % 88) (QREFELT % 115)) |mu|
                    |z| (QREFELT % 164))
          (QREFELT % 114))
         (SPADCALL
          (SPADCALL (SPADCALL |nu| (|spadConstant| % 88) (QREFELT % 115)) |z|
                    (QREFELT % 114))
          (SPADCALL |nu| |mu| |z| (QREFELT % 164)) (QREFELT % 114))
         (QREFELT % 122))) 

(SDEFUN |FSPECF;dLegendreQ| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad3| |l| |t| (QREFELT % 163)
         (CONS (|function| |FSPECF;eLegendreQGrad_z|) %) %)) 

(SDEFUN |FSPECF;kelvinBei;3F;112| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 165) |v| |z| (QREFELT % 62))) 

(SDEFUN |FSPECF;eKelvinBei| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 165) (LIST |v| |z|) (QREFELT % 113))) 

(SDEFUN |FSPECF;elKelvinBei| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eKelvinBei| (SPADCALL |l| 1 (QREFELT % 109))
         (SPADCALL |l| 2 (QREFELT % 109)) %)) 

(SDEFUN |FSPECF;eKelvinBeiGrad_z| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL (QREFELT % 101)
                    (SPADCALL (SPADCALL 2 (QREFELT % 90)) (QREFELT % 127))
                    (QREFELT % 114))
          (SPADCALL
           (SPADCALL (SPADCALL |v| (|spadConstant| % 88) (QREFELT % 115)) |z|
                     (QREFELT % 166))
           (SPADCALL (SPADCALL |v| (|spadConstant| % 88) (QREFELT % 115)) |z|
                     (QREFELT % 167))
           (QREFELT % 122))
          (QREFELT % 114))
         (SPADCALL
          (SPADCALL |v| (SPADCALL |v| |z| (QREFELT % 166)) (QREFELT % 114)) |z|
          (QREFELT % 123))
         (QREFELT % 115))) 

(SDEFUN |FSPECF;dKelvinBei| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad2| |l| |t| (QREFELT % 165)
         (CONS (|function| |FSPECF;eKelvinBeiGrad_z|) %) %)) 

(SDEFUN |FSPECF;kelvinBer;3F;117| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 168) |v| |z| (QREFELT % 62))) 

(SDEFUN |FSPECF;eKelvinBer| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 168) (LIST |v| |z|) (QREFELT % 113))) 

(SDEFUN |FSPECF;elKelvinBer| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eKelvinBer| (SPADCALL |l| 1 (QREFELT % 109))
         (SPADCALL |l| 2 (QREFELT % 109)) %)) 

(SDEFUN |FSPECF;eKelvinBerGrad_z| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL (QREFELT % 101)
                    (SPADCALL (SPADCALL 2 (QREFELT % 90)) (QREFELT % 127))
                    (QREFELT % 114))
          (SPADCALL
           (SPADCALL (SPADCALL |v| (|spadConstant| % 88) (QREFELT % 115)) |z|
                     (QREFELT % 167))
           (SPADCALL (SPADCALL |v| (|spadConstant| % 88) (QREFELT % 115)) |z|
                     (QREFELT % 166))
           (QREFELT % 115))
          (QREFELT % 114))
         (SPADCALL
          (SPADCALL |v| (SPADCALL |v| |z| (QREFELT % 167)) (QREFELT % 114)) |z|
          (QREFELT % 123))
         (QREFELT % 115))) 

(SDEFUN |FSPECF;dKelvinBer| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad2| |l| |t| (QREFELT % 168)
         (CONS (|function| |FSPECF;eKelvinBerGrad_z|) %) %)) 

(SDEFUN |FSPECF;kelvinKei;3F;122| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 169) |v| |z| (QREFELT % 62))) 

(SDEFUN |FSPECF;eKelvinKei| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 169) (LIST |v| |z|) (QREFELT % 113))) 

(SDEFUN |FSPECF;elKelvinKei| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eKelvinKei| (SPADCALL |l| 1 (QREFELT % 109))
         (SPADCALL |l| 2 (QREFELT % 109)) %)) 

(SDEFUN |FSPECF;eKelvinKeiGrad_z| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL (QREFELT % 101)
                    (SPADCALL (SPADCALL 2 (QREFELT % 90)) (QREFELT % 127))
                    (QREFELT % 114))
          (SPADCALL
           (SPADCALL (SPADCALL |v| (|spadConstant| % 88) (QREFELT % 115)) |z|
                     (QREFELT % 170))
           (SPADCALL (SPADCALL |v| (|spadConstant| % 88) (QREFELT % 115)) |z|
                     (QREFELT % 171))
           (QREFELT % 122))
          (QREFELT % 114))
         (SPADCALL
          (SPADCALL |v| (SPADCALL |v| |z| (QREFELT % 170)) (QREFELT % 114)) |z|
          (QREFELT % 123))
         (QREFELT % 115))) 

(SDEFUN |FSPECF;dKelvinKei| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad2| |l| |t| (QREFELT % 169)
         (CONS (|function| |FSPECF;eKelvinKeiGrad_z|) %) %)) 

(SDEFUN |FSPECF;kelvinKer;3F;127| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 172) |v| |z| (QREFELT % 62))) 

(SDEFUN |FSPECF;eKelvinKer| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 172) (LIST |v| |z|) (QREFELT % 113))) 

(SDEFUN |FSPECF;elKelvinKer| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eKelvinKer| (SPADCALL |l| 1 (QREFELT % 109))
         (SPADCALL |l| 2 (QREFELT % 109)) %)) 

(SDEFUN |FSPECF;eKelvinKerGrad_z| ((|v| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL (QREFELT % 101)
                    (SPADCALL (SPADCALL 2 (QREFELT % 90)) (QREFELT % 127))
                    (QREFELT % 114))
          (SPADCALL
           (SPADCALL (SPADCALL |v| (|spadConstant| % 88) (QREFELT % 115)) |z|
                     (QREFELT % 171))
           (SPADCALL (SPADCALL |v| (|spadConstant| % 88) (QREFELT % 115)) |z|
                     (QREFELT % 170))
           (QREFELT % 115))
          (QREFELT % 114))
         (SPADCALL
          (SPADCALL |v| (SPADCALL |v| |z| (QREFELT % 171)) (QREFELT % 114)) |z|
          (QREFELT % 123))
         (QREFELT % 115))) 

(SDEFUN |FSPECF;dKelvinKer| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad2| |l| |t| (QREFELT % 172)
         (CONS (|function| |FSPECF;eKelvinKerGrad_z|) %) %)) 

(SDEFUN |FSPECF;ellipticK;2F;132| ((|m| (F)) (% (F)))
        (SPADCALL (QREFELT % 173) |m| (QREFELT % 52))) 

(SDEFUN |FSPECF;eEllipticK| ((|m| (F)) (% (F)))
        (SPADCALL (QREFELT % 173) (LIST |m|) (QREFELT % 113))) 

(SDEFUN |FSPECF;elEllipticK| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eEllipticK| (SPADCALL |l| 1 (QREFELT % 109)) %)) 

(SDEFUN |FSPECF;dEllipticK| ((|m| (F)) (% (F)))
        (SPADCALL
         (SPADCALL (QREFELT % 101)
                   (SPADCALL (SPADCALL |m| (QREFELT % 175))
                             (SPADCALL
                              (SPADCALL (|spadConstant| % 88) |m|
                                        (QREFELT % 122))
                              (SPADCALL |m| (QREFELT % 174)) (QREFELT % 114))
                             (QREFELT % 122))
                   (QREFELT % 114))
         (SPADCALL |m| (SPADCALL (|spadConstant| % 88) |m| (QREFELT % 122))
                   (QREFELT % 114))
         (QREFELT % 123))) 

(SDEFUN |FSPECF;ellipticE;2F;136| ((|m| (F)) (% (F)))
        (SPADCALL (QREFELT % 180) |m| (QREFELT % 52))) 

(SDEFUN |FSPECF;eEllipticE| ((|m| (F)) (% (F)))
        (SPADCALL (QREFELT % 180) (LIST |m|) (QREFELT % 113))) 

(SDEFUN |FSPECF;elEllipticE| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eEllipticE| (SPADCALL |l| 1 (QREFELT % 109)) %)) 

(SDEFUN |FSPECF;dEllipticE| ((|m| (F)) (% (F)))
        (SPADCALL
         (SPADCALL (QREFELT % 101)
                   (SPADCALL (SPADCALL |m| (QREFELT % 175))
                             (SPADCALL |m| (QREFELT % 174)) (QREFELT % 122))
                   (QREFELT % 114))
         |m| (QREFELT % 123))) 

(SDEFUN |FSPECF;ellipticE;3F;140| ((|z| (F)) (|m| (F)) (% (F)))
        (SPADCALL (QREFELT % 181) |z| |m| (QREFELT % 62))) 

(SDEFUN |FSPECF;eEllipticE2| ((|z| (F)) (|m| (F)) (% (F)))
        (COND
         ((SPADCALL |z| (|spadConstant| % 84) (QREFELT % 86))
          (|spadConstant| % 84))
         ((SPADCALL |z| (|spadConstant| % 88) (QREFELT % 86))
          (|FSPECF;eEllipticE| |m| %))
         ('T (SPADCALL (QREFELT % 181) (LIST |z| |m|) (QREFELT % 113))))) 

(SDEFUN |FSPECF;elEllipticE2| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eEllipticE2| (SPADCALL |l| 1 (QREFELT % 109))
         (SPADCALL |l| 2 (QREFELT % 109)) %)) 

(SDEFUN |FSPECF;eEllipticE2Grad_z| ((|l| (|List| F)) (% (F)))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ (LETT |z| (SPADCALL |l| 1 (QREFELT % 109)))
                    (LETT |m| (SPADCALL |l| 2 (QREFELT % 109)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (|spadConstant| % 88)
                                 (SPADCALL |m| (SPADCALL |z| 2 (QREFELT % 121))
                                           (QREFELT % 114))
                                 (QREFELT % 122))
                       (QREFELT % 127))
                      (SPADCALL
                       (SPADCALL (|spadConstant| % 88)
                                 (SPADCALL |z| 2 (QREFELT % 121))
                                 (QREFELT % 122))
                       (QREFELT % 127))
                      (QREFELT % 123)))))) 

(SDEFUN |FSPECF;eEllipticE2Grad_m| ((|l| (|List| F)) (% (F)))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ (LETT |z| (SPADCALL |l| 1 (QREFELT % 109)))
                    (LETT |m| (SPADCALL |l| 2 (QREFELT % 109)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL (QREFELT % 101)
                                (SPADCALL (SPADCALL |z| |m| (QREFELT % 182))
                                          (SPADCALL |z| |m| (QREFELT % 183))
                                          (QREFELT % 122))
                                (QREFELT % 114))
                      |m| (QREFELT % 123)))))) 

(SDEFUN |FSPECF;inEllipticE2| ((|li| (|List| (|InputForm|))) (% (|InputForm|)))
        (SPADCALL (CONS (SPADCALL '|ellipticE| (QREFELT % 185)) |li|)
                  (QREFELT % 186))) 

(SDEFUN |FSPECF;ellipticF;3F;146| ((|z| (F)) (|m| (F)) (% (F)))
        (SPADCALL (QREFELT % 189) |z| |m| (QREFELT % 62))) 

(SDEFUN |FSPECF;eEllipticF| ((|z| (F)) (|m| (F)) (% (F)))
        (COND
         ((SPADCALL |z| (|spadConstant| % 84) (QREFELT % 86))
          (|spadConstant| % 84))
         ((SPADCALL |z| (|spadConstant| % 88) (QREFELT % 86))
          (SPADCALL |m| (QREFELT % 174)))
         ('T (SPADCALL (QREFELT % 189) (LIST |z| |m|) (QREFELT % 113))))) 

(SDEFUN |FSPECF;elEllipticF| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eEllipticF| (SPADCALL |l| 1 (QREFELT % 109))
         (SPADCALL |l| 2 (QREFELT % 109)) %)) 

(SDEFUN |FSPECF;eEllipticFGrad_z| ((|l| (|List| F)) (% (F)))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ (LETT |z| (SPADCALL |l| 1 (QREFELT % 109)))
                    (LETT |m| (SPADCALL |l| 2 (QREFELT % 109)))
                    (EXIT
                     (SPADCALL (|spadConstant| % 88)
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (|spadConstant| % 88)
                                           (SPADCALL |m|
                                                     (SPADCALL |z| 2
                                                               (QREFELT % 121))
                                                     (QREFELT % 114))
                                           (QREFELT % 122))
                                 (QREFELT % 127))
                                (SPADCALL
                                 (SPADCALL (|spadConstant| % 88)
                                           (SPADCALL |z| 2 (QREFELT % 121))
                                           (QREFELT % 122))
                                 (QREFELT % 127))
                                (QREFELT % 114))
                               (QREFELT % 123)))))) 

(SDEFUN |FSPECF;eEllipticFGrad_m| ((|l| (|List| F)) (% (F)))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ (LETT |z| (SPADCALL |l| 1 (QREFELT % 109)))
                    (LETT |m| (SPADCALL |l| 2 (QREFELT % 109)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL (QREFELT % 101)
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |z| |m| (QREFELT % 182))
                                            (SPADCALL
                                             (SPADCALL (|spadConstant| % 88)
                                                       |m| (QREFELT % 122))
                                             (SPADCALL |z| |m| (QREFELT % 183))
                                             (QREFELT % 114))
                                            (QREFELT % 122))
                                  |m| (QREFELT % 123))
                                 (SPADCALL
                                  (SPADCALL |z|
                                            (SPADCALL
                                             (SPADCALL (|spadConstant| % 88)
                                                       (SPADCALL |z| 2
                                                                 (QREFELT %
                                                                          121))
                                                       (QREFELT % 122))
                                             (QREFELT % 127))
                                            (QREFELT % 114))
                                  (SPADCALL
                                   (SPADCALL (|spadConstant| % 88)
                                             (SPADCALL |m|
                                                       (SPADCALL |z| 2
                                                                 (QREFELT %
                                                                          121))
                                                       (QREFELT % 114))
                                             (QREFELT % 122))
                                   (QREFELT % 127))
                                  (QREFELT % 123))
                                 (QREFELT % 122))
                                (QREFELT % 114))
                      (SPADCALL (|spadConstant| % 88) |m| (QREFELT % 122))
                      (QREFELT % 123)))))) 

(SDEFUN |FSPECF;ellipticPi;4F;151| ((|z| (F)) (|n| (F)) (|m| (F)) (% (F)))
        (SPADCALL (QREFELT % 190) |z| |n| |m| (QREFELT % 65))) 

(SDEFUN |FSPECF;eEllipticPi| ((|z| (F)) (|n| (F)) (|m| (F)) (% (F)))
        (COND
         ((SPADCALL |z| (|spadConstant| % 84) (QREFELT % 86))
          (|spadConstant| % 84))
         ('T (SPADCALL (QREFELT % 190) (LIST |z| |n| |m|) (QREFELT % 113))))) 

(SDEFUN |FSPECF;elEllipticPi| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eEllipticPi| (SPADCALL |l| 1 (QREFELT % 109))
         (SPADCALL |l| 2 (QREFELT % 109)) (SPADCALL |l| 3 (QREFELT % 109)) %)) 

(SDEFUN |FSPECF;eEllipticPiGrad_z| ((|l| (|List| F)) (% (F)))
        (SPROG ((|m| (F)) (|n| (F)) (|z| (F)))
               (SEQ (LETT |z| (SPADCALL |l| 1 (QREFELT % 109)))
                    (LETT |n| (SPADCALL |l| 2 (QREFELT % 109)))
                    (LETT |m| (SPADCALL |l| 3 (QREFELT % 109)))
                    (EXIT
                     (SPADCALL (|spadConstant| % 88)
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (|spadConstant| % 88)
                                           (SPADCALL |n|
                                                     (SPADCALL |z| 2
                                                               (QREFELT % 121))
                                                     (QREFELT % 114))
                                           (QREFELT % 122))
                                 (SPADCALL
                                  (SPADCALL (|spadConstant| % 88)
                                            (SPADCALL |m|
                                                      (SPADCALL |z| 2
                                                                (QREFELT %
                                                                         121))
                                                      (QREFELT % 114))
                                            (QREFELT % 122))
                                  (QREFELT % 127))
                                 (QREFELT % 114))
                                (SPADCALL
                                 (SPADCALL (|spadConstant| % 88)
                                           (SPADCALL |z| 2 (QREFELT % 121))
                                           (QREFELT % 122))
                                 (QREFELT % 127))
                                (QREFELT % 114))
                               (QREFELT % 123)))))) 

(SDEFUN |FSPECF;eEllipticPiGrad_n| ((|l| (|List| F)) (% (F)))
        (SPROG
         ((|t4| (F)) (|t3| (F)) (|t2| (F)) (|t1| (F)) (|m| (F)) (|n| (F))
          (|z| (F)))
         (SEQ (LETT |z| (SPADCALL |l| 1 (QREFELT % 109)))
              (LETT |n| (SPADCALL |l| 2 (QREFELT % 109)))
              (LETT |m| (SPADCALL |l| 3 (QREFELT % 109)))
              (LETT |t1|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL |n| 2 (QREFELT % 121)) |m|
                                 (QREFELT % 122))
                       (SPADCALL |z| |n| |m| (QREFELT % 191)) (QREFELT % 114))
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL |n| (|spadConstant| % 88) (QREFELT % 122))
                        (SPADCALL |n| |m| (QREFELT % 122)) (QREFELT % 114))
                       |n| (QREFELT % 114))
                      (QREFELT % 123))
                     (QREFELT % 124)))
              (LETT |t2|
                    (SPADCALL (SPADCALL |z| |m| (QREFELT % 183))
                              (SPADCALL
                               (SPADCALL |n| (|spadConstant| % 88)
                                         (QREFELT % 122))
                               |n| (QREFELT % 114))
                              (QREFELT % 123)))
              (LETT |t3|
                    (SPADCALL
                     (SPADCALL (SPADCALL |z| |m| (QREFELT % 182))
                               (SPADCALL
                                (SPADCALL |n| (|spadConstant| % 88)
                                          (QREFELT % 122))
                                (SPADCALL |n| |m| (QREFELT % 122))
                                (QREFELT % 114))
                               (QREFELT % 123))
                     (QREFELT % 124)))
              (LETT |t4|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (SPADCALL |n| |z| (QREFELT % 114))
                                (SPADCALL
                                 (SPADCALL (|spadConstant| % 88)
                                           (SPADCALL |m|
                                                     (SPADCALL |z| 2
                                                               (QREFELT % 121))
                                                     (QREFELT % 114))
                                           (QREFELT % 122))
                                 (QREFELT % 127))
                                (QREFELT % 114))
                      (SPADCALL
                       (SPADCALL (|spadConstant| % 88)
                                 (SPADCALL |z| 2 (QREFELT % 121))
                                 (QREFELT % 122))
                       (QREFELT % 127))
                      (QREFELT % 114))
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (|spadConstant| % 88)
                                 (SPADCALL |n| (SPADCALL |z| 2 (QREFELT % 121))
                                           (QREFELT % 114))
                                 (QREFELT % 122))
                       (SPADCALL |n| (|spadConstant| % 88) (QREFELT % 122))
                       (QREFELT % 114))
                      (SPADCALL |n| |m| (QREFELT % 122)) (QREFELT % 114))
                     (QREFELT % 123)))
              (EXIT
               (SPADCALL (QREFELT % 101)
                         (SPADCALL
                          (SPADCALL (SPADCALL |t1| |t2| (QREFELT % 115)) |t3|
                                    (QREFELT % 115))
                          |t4| (QREFELT % 115))
                         (QREFELT % 114)))))) 

(SDEFUN |FSPECF;eEllipticPiGrad_m| ((|l| (|List| F)) (% (F)))
        (SPROG ((|t2| (F)) (|t1| (F)) (|m| (F)) (|n| (F)) (|z| (F)))
               (SEQ (LETT |z| (SPADCALL |l| 1 (QREFELT % 109)))
                    (LETT |n| (SPADCALL |l| 2 (QREFELT % 109)))
                    (LETT |m| (SPADCALL |l| 3 (QREFELT % 109)))
                    (LETT |t1|
                          (SPADCALL
                           (SPADCALL (SPADCALL |m| |z| (QREFELT % 114))
                                     (SPADCALL
                                      (SPADCALL (|spadConstant| % 88)
                                                (SPADCALL |z| 2
                                                          (QREFELT % 121))
                                                (QREFELT % 122))
                                      (QREFELT % 127))
                                     (QREFELT % 114))
                           (SPADCALL
                            (SPADCALL (|spadConstant| % 88)
                                      (SPADCALL |m|
                                                (SPADCALL |z| 2
                                                          (QREFELT % 121))
                                                (QREFELT % 114))
                                      (QREFELT % 122))
                            (QREFELT % 127))
                           (QREFELT % 123)))
                    (LETT |t2|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL |z| |m| (QREFELT % 182))
                                      (QREFELT % 124))
                            |t1| (QREFELT % 115))
                           (SPADCALL (|spadConstant| % 88) |m| (QREFELT % 122))
                           (QREFELT % 123)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL (QREFELT % 101)
                                (SPADCALL
                                 (SPADCALL |z| |n| |m| (QREFELT % 191)) |t2|
                                 (QREFELT % 115))
                                (QREFELT % 114))
                      (SPADCALL |n| |m| (QREFELT % 122)) (QREFELT % 123)))))) 

(SDEFUN |FSPECF;jacobiSn;3F;157| ((|z| (F)) (|m| (F)) (% (F)))
        (SPADCALL (QREFELT % 192) |z| |m| (QREFELT % 62))) 

(SDEFUN |FSPECF;eJacobiSn| ((|z| (F)) (|m| (F)) (% (F)))
        (SPROG ((#1=#:G494 NIL) (|args| (|List| F)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |z| (|spadConstant| % 84) (QREFELT % 86))
                   (|spadConstant| % 84))
                  ('T
                   (SEQ
                    (COND
                     ((SPADCALL |z| (QREFELT % 189) (QREFELT % 194))
                      (SEQ
                       (LETT |args|
                             (SPADCALL (SPADCALL |z| (QREFELT % 196))
                                       (QREFELT % 198)))
                       (EXIT
                        (COND
                         ((SPADCALL |m| (SPADCALL |args| 2 (QREFELT % 109))
                                    (QREFELT % 86))
                          (PROGN
                           (LETT #1# (SPADCALL |args| 1 (QREFELT % 109)))
                           (GO #2=#:G493))))))))
                    (EXIT
                     (SPADCALL (QREFELT % 192) (LIST |z| |m|)
                               (QREFELT % 113)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |FSPECF;elJacobiSn| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eJacobiSn| (SPADCALL |l| 1 (QREFELT % 109))
         (SPADCALL |l| 2 (QREFELT % 109)) %)) 

(SDEFUN |FSPECF;jacobiGradHelper| ((|z| (F)) (|m| (F)) (% (F)))
        (SPADCALL
         (SPADCALL |z|
                   (SPADCALL
                    (SPADCALL (SPADCALL |z| |m| (QREFELT % 193)) |m|
                              (QREFELT % 182))
                    (SPADCALL (|spadConstant| % 88) |m| (QREFELT % 122))
                    (QREFELT % 123))
                   (QREFELT % 122))
         |m| (QREFELT % 123))) 

(SDEFUN |FSPECF;eJacobiSnGrad_z| ((|l| (|List| F)) (% (F)))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ (LETT |z| (SPADCALL |l| 1 (QREFELT % 109)))
                    (LETT |m| (SPADCALL |l| 2 (QREFELT % 109)))
                    (EXIT
                     (SPADCALL (SPADCALL |z| |m| (QREFELT % 199))
                               (SPADCALL |z| |m| (QREFELT % 200))
                               (QREFELT % 114)))))) 

(SDEFUN |FSPECF;eJacobiSnGrad_m| ((|l| (|List| F)) (% (F)))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ (LETT |z| (SPADCALL |l| 1 (QREFELT % 109)))
                    (LETT |m| (SPADCALL |l| 2 (QREFELT % 109)))
                    (EXIT
                     (SPADCALL (QREFELT % 101)
                               (SPADCALL
                                (SPADCALL (|FSPECF;eJacobiSnGrad_z| |l| %)
                                          (|FSPECF;jacobiGradHelper| |z| |m| %)
                                          (QREFELT % 114))
                                (SPADCALL
                                 (SPADCALL (SPADCALL |z| |m| (QREFELT % 193))
                                           (SPADCALL
                                            (SPADCALL |z| |m| (QREFELT % 199))
                                            2 (QREFELT % 142))
                                           (QREFELT % 114))
                                 (SPADCALL (|spadConstant| % 88) |m|
                                           (QREFELT % 122))
                                 (QREFELT % 123))
                                (QREFELT % 115))
                               (QREFELT % 114)))))) 

(SDEFUN |FSPECF;jacobiCn;3F;163| ((|z| (F)) (|m| (F)) (% (F)))
        (SPADCALL (QREFELT % 201) |z| |m| (QREFELT % 62))) 

(SDEFUN |FSPECF;eJacobiCn| ((|z| (F)) (|m| (F)) (% (F)))
        (COND
         ((SPADCALL |z| (|spadConstant| % 84) (QREFELT % 86))
          (|spadConstant| % 88))
         ('T (SPADCALL (QREFELT % 201) (LIST |z| |m|) (QREFELT % 113))))) 

(SDEFUN |FSPECF;elJacobiCn| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eJacobiCn| (SPADCALL |l| 1 (QREFELT % 109))
         (SPADCALL |l| 2 (QREFELT % 109)) %)) 

(SDEFUN |FSPECF;eJacobiCnGrad_z| ((|l| (|List| F)) (% (F)))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ (LETT |z| (SPADCALL |l| 1 (QREFELT % 109)))
                    (LETT |m| (SPADCALL |l| 2 (QREFELT % 109)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL (SPADCALL |z| |m| (QREFELT % 193))
                                (SPADCALL |z| |m| (QREFELT % 200))
                                (QREFELT % 114))
                      (QREFELT % 124)))))) 

(SDEFUN |FSPECF;eJacobiCnGrad_m| ((|l| (|List| F)) (% (F)))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ (LETT |z| (SPADCALL |l| 1 (QREFELT % 109)))
                    (LETT |m| (SPADCALL |l| 2 (QREFELT % 109)))
                    (EXIT
                     (SPADCALL (QREFELT % 101)
                               (SPADCALL
                                (SPADCALL (|FSPECF;eJacobiCnGrad_z| |l| %)
                                          (|FSPECF;jacobiGradHelper| |z| |m| %)
                                          (QREFELT % 114))
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |z| |m| (QREFELT % 193))
                                            2 (QREFELT % 142))
                                  (SPADCALL |z| |m| (QREFELT % 199))
                                  (QREFELT % 114))
                                 (SPADCALL (|spadConstant| % 88) |m|
                                           (QREFELT % 122))
                                 (QREFELT % 123))
                                (QREFELT % 122))
                               (QREFELT % 114)))))) 

(SDEFUN |FSPECF;jacobiDn;3F;168| ((|z| (F)) (|m| (F)) (% (F)))
        (SPADCALL (QREFELT % 202) |z| |m| (QREFELT % 62))) 

(SDEFUN |FSPECF;eJacobiDn| ((|z| (F)) (|m| (F)) (% (F)))
        (COND
         ((SPADCALL |z| (|spadConstant| % 84) (QREFELT % 86))
          (|spadConstant| % 88))
         ('T (SPADCALL (QREFELT % 202) (LIST |z| |m|) (QREFELT % 113))))) 

(SDEFUN |FSPECF;elJacobiDn| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eJacobiDn| (SPADCALL |l| 1 (QREFELT % 109))
         (SPADCALL |l| 2 (QREFELT % 109)) %)) 

(SDEFUN |FSPECF;eJacobiDnGrad_z| ((|l| (|List| F)) (% (F)))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ (LETT |z| (SPADCALL |l| 1 (QREFELT % 109)))
                    (LETT |m| (SPADCALL |l| 2 (QREFELT % 109)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL |m| (SPADCALL |z| |m| (QREFELT % 193))
                                 (QREFELT % 114))
                       (SPADCALL |z| |m| (QREFELT % 199)) (QREFELT % 114))
                      (QREFELT % 124)))))) 

(SDEFUN |FSPECF;eJacobiDnGrad_m| ((|l| (|List| F)) (% (F)))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ (LETT |z| (SPADCALL |l| 1 (QREFELT % 109)))
                    (LETT |m| (SPADCALL |l| 2 (QREFELT % 109)))
                    (EXIT
                     (SPADCALL (QREFELT % 101)
                               (SPADCALL
                                (SPADCALL (|FSPECF;eJacobiDnGrad_z| |l| %)
                                          (|FSPECF;jacobiGradHelper| |z| |m| %)
                                          (QREFELT % 114))
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |z| |m| (QREFELT % 193))
                                            2 (QREFELT % 142))
                                  (SPADCALL |z| |m| (QREFELT % 200))
                                  (QREFELT % 114))
                                 (SPADCALL (|spadConstant| % 88) |m|
                                           (QREFELT % 122))
                                 (QREFELT % 123))
                                (QREFELT % 122))
                               (QREFELT % 114)))))) 

(SDEFUN |FSPECF;jacobiZeta;3F;173| ((|z| (F)) (|m| (F)) (% (F)))
        (SPADCALL (QREFELT % 203) |z| |m| (QREFELT % 62))) 

(SDEFUN |FSPECF;eJacobiZeta| ((|z| (F)) (|m| (F)) (% (F)))
        (COND
         ((SPADCALL |z| (|spadConstant| % 84) (QREFELT % 86))
          (|spadConstant| % 84))
         ('T (SPADCALL (QREFELT % 203) (LIST |z| |m|) (QREFELT % 113))))) 

(SDEFUN |FSPECF;elJacobiZeta| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eJacobiZeta| (SPADCALL |l| 1 (QREFELT % 109))
         (SPADCALL |l| 2 (QREFELT % 109)) %)) 

(SDEFUN |FSPECF;eJacobiZetaGrad_z| ((|l| (|List| F)) (% (F)))
        (SPROG ((|dn| (F)) (|m| (F)) (|z| (F)))
               (SEQ (LETT |z| (SPADCALL |l| 1 (QREFELT % 109)))
                    (LETT |m| (SPADCALL |l| 2 (QREFELT % 109)))
                    (LETT |dn| (SPADCALL |z| |m| (QREFELT % 200)))
                    (EXIT
                     (SPADCALL (SPADCALL |dn| |dn| (QREFELT % 114))
                               (SPADCALL (SPADCALL |m| (QREFELT % 175))
                                         (SPADCALL |m| (QREFELT % 174))
                                         (QREFELT % 123))
                               (QREFELT % 122)))))) 

(SDEFUN |FSPECF;eJacobiZetaGrad_m| ((|l| (|List| F)) (% (F)))
        (SPROG
         ((|res4| (F)) (|res3| (F)) (|res2| (F)) (|res1| (F)) (|dn| (F))
          (|er| (F)) (|ee| (F)) (|ek| (F)) (|m| (F)) (|z| (F)))
         (SEQ (LETT |z| (SPADCALL |l| 1 (QREFELT % 109)))
              (LETT |m| (SPADCALL |l| 2 (QREFELT % 109)))
              (LETT |ek| (SPADCALL |m| (QREFELT % 174)))
              (LETT |ee| (SPADCALL |m| (QREFELT % 175)))
              (LETT |er| (SPADCALL |ee| |ek| (QREFELT % 123)))
              (LETT |dn| (SPADCALL |z| |m| (QREFELT % 200)))
              (LETT |res1|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (SPADCALL |dn| |dn| (QREFELT % 114)) |m|
                                (QREFELT % 115))
                      (|spadConstant| % 88) (QREFELT % 122))
                     (SPADCALL |z| |m| (QREFELT % 204)) (QREFELT % 114)))
              (LETT |res2|
                    (SPADCALL |res1|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL |m| (|spadConstant| % 88)
                                           (QREFELT % 122))
                                 |z| (QREFELT % 114))
                                |dn| (QREFELT % 114))
                               |dn| (QREFELT % 114))
                              (QREFELT % 115)))
              (LETT |res3|
                    (SPADCALL |res2|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL |m|
                                          (SPADCALL |z| |m| (QREFELT % 199))
                                          (QREFELT % 114))
                                (SPADCALL |z| |m| (QREFELT % 200))
                                (QREFELT % 114))
                               (SPADCALL |z| |m| (QREFELT % 193))
                               (QREFELT % 114))
                              (QREFELT % 122)))
              (LETT |res4|
                    (SPADCALL |res3|
                              (SPADCALL
                               (SPADCALL |z|
                                         (SPADCALL
                                          (SPADCALL (|spadConstant| % 88) |m|
                                                    (QREFELT % 122))
                                          (SPADCALL |dn| |dn| (QREFELT % 114))
                                          (QREFELT % 115))
                                         (QREFELT % 114))
                               |er| (QREFELT % 114))
                              (QREFELT % 115)))
              (EXIT
               (SPADCALL
                (SPADCALL (QREFELT % 101)
                          (SPADCALL |res4|
                                    (SPADCALL
                                     (SPADCALL |z| |er| (QREFELT % 114)) |er|
                                     (QREFELT % 114))
                                    (QREFELT % 122))
                          (QREFELT % 114))
                (SPADCALL (SPADCALL |m| |m| (QREFELT % 114)) |m|
                          (QREFELT % 122))
                (QREFELT % 123)))))) 

(SDEFUN |FSPECF;jacobiTheta;3F;178| ((|z| (F)) (|m| (F)) (% (F)))
        (SPADCALL (QREFELT % 205) |z| |m| (QREFELT % 62))) 

(SDEFUN |FSPECF;eJacobiTheta| ((|z| (F)) (|m| (F)) (% (F)))
        (SPADCALL (QREFELT % 205) (LIST |z| |m|) (QREFELT % 113))) 

(SDEFUN |FSPECF;elJacobiTheta| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eJacobiTheta| (SPADCALL |l| 1 (QREFELT % 109))
         (SPADCALL |l| 2 (QREFELT % 109)) %)) 

(SDEFUN |FSPECF;eJacobiThetaGrad_z| ((|l| (|List| F)) (% (F)))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ (LETT |z| (SPADCALL |l| 1 (QREFELT % 109)))
                    (LETT |m| (SPADCALL |l| 2 (QREFELT % 109)))
                    (EXIT
                     (SPADCALL (SPADCALL |z| |m| (QREFELT % 204))
                               (SPADCALL |z| |m| (QREFELT % 206))
                               (QREFELT % 114)))))) 

(SDEFUN |FSPECF;eJacobiThetaGrad_m| ((|l| (|List| F)) (% (F)))
        (SPROG ((|dm| (F)) (|m| (F)) (|z| (F)))
               (SEQ (LETT |z| (SPADCALL |l| 1 (QREFELT % 109)))
                    (LETT |m| (SPADCALL |l| 2 (QREFELT % 109)))
                    (LETT |dm|
                          (SPADCALL (SPADCALL (QREFELT % 110))
                                    (QREFELT % 111)))
                    (EXIT
                     (SPADCALL (QREFELT % 98)
                               (LIST
                                (SPADCALL (QREFELT % 205) (LIST |z| |dm|)
                                          (QREFELT % 94))
                                |dm| |m|)
                               (QREFELT % 113)))))) 

(SDEFUN |FSPECF;lerchPhi;4F;183| ((|z| (F)) (|s| (F)) (|a| (F)) (% (F)))
        (SPADCALL (QREFELT % 207) |z| |s| |a| (QREFELT % 65))) 

(SDEFUN |FSPECF;eLerchPhi| ((|z| (F)) (|s| (F)) (|a| (F)) (% (F)))
        (COND
         ((SPADCALL |a| (|spadConstant| % 88) (QREFELT % 86))
          (SPADCALL (SPADCALL |s| |z| (QREFELT % 78)) |z| (QREFELT % 123)))
         ('T (SPADCALL (QREFELT % 207) (LIST |z| |s| |a|) (QREFELT % 113))))) 

(SDEFUN |FSPECF;elLerchPhi| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eLerchPhi| (SPADCALL |l| 1 (QREFELT % 109))
         (SPADCALL |l| 2 (QREFELT % 109)) (SPADCALL |l| 3 (QREFELT % 109)) %)) 

(SDEFUN |FSPECF;dLerchPhi| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (SPROG ((|dm| (F)) (|da| (F)) (|dz| (F)) (|a| (F)) (|s| (F)) (|z| (F)))
               (SEQ (LETT |z| (SPADCALL |l| 1 (QREFELT % 109)))
                    (LETT |s| (SPADCALL |l| 2 (QREFELT % 109)))
                    (LETT |a| (SPADCALL |l| 3 (QREFELT % 109)))
                    (LETT |dz|
                          (SPADCALL
                           (SPADCALL (SPADCALL |z| |t| (QREFELT % 112))
                                     (SPADCALL
                                      (SPADCALL |z|
                                                (SPADCALL |s|
                                                          (|spadConstant| % 88)
                                                          (QREFELT % 122))
                                                |a| (QREFELT % 208))
                                      (SPADCALL |a|
                                                (SPADCALL |z| |s| |a|
                                                          (QREFELT % 208))
                                                (QREFELT % 114))
                                      (QREFELT % 122))
                                     (QREFELT % 114))
                           |z| (QREFELT % 123)))
                    (LETT |da|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL |a| |t| (QREFELT % 112)) |s|
                                      (QREFELT % 114))
                            (SPADCALL |z|
                                      (SPADCALL |s| (|spadConstant| % 88)
                                                (QREFELT % 115))
                                      |a| (QREFELT % 208))
                            (QREFELT % 114))
                           (QREFELT % 124)))
                    (LETT |dm|
                          (SPADCALL (SPADCALL (QREFELT % 110))
                                    (QREFELT % 111)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL |s| |t| (QREFELT % 112))
                                 (SPADCALL (QREFELT % 98)
                                           (LIST
                                            (SPADCALL (QREFELT % 207)
                                                      (LIST |z| |dm| |a|)
                                                      (QREFELT % 94))
                                            |dm| |s|)
                                           (QREFELT % 113))
                                 (QREFELT % 114))
                       |dz| (QREFELT % 115))
                      |da| (QREFELT % 115)))))) 

(SDEFUN |FSPECF;riemannZeta;2F;187| ((|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 209) |z| (QREFELT % 52))) 

(SDEFUN |FSPECF;eRiemannZeta| ((|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 209) (LIST |z|) (QREFELT % 113))) 

(SDEFUN |FSPECF;elRiemannZeta| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eRiemannZeta| (SPADCALL |l| 1 (QREFELT % 109)) %)) 

(SDEFUN |FSPECF;charlierC;4F;190| ((|n| (F)) (|a| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 43) |n| |a| |z| (QREFELT % 65))) 

(SDEFUN |FSPECF;eCharlierC| ((|n| (F)) (|a| (F)) (|z| (F)) (% (F)))
        (COND
         ((SPADCALL |n| (|spadConstant| % 84) (QREFELT % 86))
          (|spadConstant| % 88))
         ((SPADCALL |n| (|spadConstant| % 88) (QREFELT % 86))
          (SPADCALL (SPADCALL |z| |a| (QREFELT % 122)) |a| (QREFELT % 123)))
         ('T (SPADCALL (QREFELT % 43) (LIST |n| |a| |z|) (QREFELT % 113))))) 

(SDEFUN |FSPECF;elCharlierC| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eCharlierC| (SPADCALL |l| 1 (QREFELT % 109))
         (SPADCALL |l| 2 (QREFELT % 109)) (SPADCALL |l| 3 (QREFELT % 109)) %)) 

(SDEFUN |FSPECF;hermiteH;3F;193| ((|n| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 44) |n| |z| (QREFELT % 62))) 

(SDEFUN |FSPECF;eHermiteH| ((|n| (F)) (|z| (F)) (% (F)))
        (COND
         ((SPADCALL |n| (SPADCALL (|spadConstant| % 88) (QREFELT % 124))
                    (QREFELT % 86))
          (|spadConstant| % 84))
         ((SPADCALL |n| (|spadConstant| % 84) (QREFELT % 86))
          (|spadConstant| % 88))
         ((SPADCALL |n| (|spadConstant| % 88) (QREFELT % 86))
          (SPADCALL (SPADCALL 2 (QREFELT % 90)) |z| (QREFELT % 114)))
         ('T (SPADCALL (QREFELT % 44) (LIST |n| |z|) (QREFELT % 113))))) 

(SDEFUN |FSPECF;elHermiteH| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eHermiteH| (SPADCALL |l| 1 (QREFELT % 109))
         (SPADCALL |l| 2 (QREFELT % 109)) %)) 

(SDEFUN |FSPECF;eHermiteHGrad_z| ((|n| (F)) (|z| (F)) (% (F)))
        (SPADCALL (SPADCALL (SPADCALL 2 (QREFELT % 90)) |n| (QREFELT % 114))
                  (SPADCALL
                   (SPADCALL |n| (|spadConstant| % 88) (QREFELT % 122)) |z|
                   (QREFELT % 212))
                  (QREFELT % 114))) 

(SDEFUN |FSPECF;dHermiteH| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad2| |l| |t| (QREFELT % 44)
         (CONS (|function| |FSPECF;eHermiteHGrad_z|) %) %)) 

(SDEFUN |FSPECF;jacobiP;5F;198|
        ((|n| (F)) (|a| (F)) (|b| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 45) |n| |a| |b| |z| (QREFELT % 213))) 

(SDEFUN |FSPECF;eJacobiP| ((|n| (F)) (|a| (F)) (|b| (F)) (|z| (F)) (% (F)))
        (COND
         ((SPADCALL |n| (SPADCALL (|spadConstant| % 88) (QREFELT % 124))
                    (QREFELT % 86))
          (|spadConstant| % 84))
         ((SPADCALL |n| (|spadConstant| % 84) (QREFELT % 86))
          (|spadConstant| % 88))
         ((SPADCALL |n| (|spadConstant| % 88) (QREFELT % 86))
          (SPADCALL
           (SPADCALL (QREFELT % 101) (SPADCALL |a| |b| (QREFELT % 122))
                     (QREFELT % 114))
           (SPADCALL
            (SPADCALL (|spadConstant| % 88)
                      (SPADCALL (QREFELT % 101)
                                (SPADCALL |a| |b| (QREFELT % 115))
                                (QREFELT % 114))
                      (QREFELT % 115))
            |z| (QREFELT % 114))
           (QREFELT % 115)))
         ('T (SPADCALL (QREFELT % 45) (LIST |n| |a| |b| |z|) (QREFELT % 113))))) 

(SDEFUN |FSPECF;elJacobiP| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eJacobiP| (SPADCALL |l| 1 (QREFELT % 109))
         (SPADCALL |l| 2 (QREFELT % 109)) (SPADCALL |l| 3 (QREFELT % 109))
         (SPADCALL |l| 4 (QREFELT % 109)) %)) 

(SDEFUN |FSPECF;eJacobiPGrad_z|
        ((|n| (F)) (|a| (F)) (|b| (F)) (|z| (F)) (% (F)))
        (SPADCALL
         (SPADCALL (QREFELT % 101)
                   (SPADCALL
                    (SPADCALL (SPADCALL |a| |b| (QREFELT % 115)) |n|
                              (QREFELT % 115))
                    (|spadConstant| % 88) (QREFELT % 115))
                   (QREFELT % 114))
         (SPADCALL (SPADCALL |n| (|spadConstant| % 88) (QREFELT % 122))
                   (SPADCALL |a| (|spadConstant| % 88) (QREFELT % 115))
                   (SPADCALL |b| (|spadConstant| % 88) (QREFELT % 115)) |z|
                   (QREFELT % 214))
         (QREFELT % 114))) 

(SDEFUN |FSPECF;dJacobiP| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad4| |l| |t| (QREFELT % 45)
         (CONS (|function| |FSPECF;eJacobiPGrad_z|) %) %)) 

(SDEFUN |FSPECF;laguerreL;4F;203| ((|n| (F)) (|a| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 46) |n| |a| |z| (QREFELT % 65))) 

(SDEFUN |FSPECF;eLaguerreL| ((|n| (F)) (|a| (F)) (|z| (F)) (% (F)))
        (COND
         ((SPADCALL |n| (SPADCALL (|spadConstant| % 88) (QREFELT % 124))
                    (QREFELT % 86))
          (|spadConstant| % 84))
         ((SPADCALL |n| (|spadConstant| % 84) (QREFELT % 86))
          (|spadConstant| % 88))
         ((SPADCALL |n| (|spadConstant| % 88) (QREFELT % 86))
          (SPADCALL (SPADCALL (|spadConstant| % 88) |a| (QREFELT % 115)) |z|
                    (QREFELT % 122)))
         ('T (SPADCALL (QREFELT % 46) (LIST |n| |a| |z|) (QREFELT % 113))))) 

(SDEFUN |FSPECF;elLaguerreL| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eLaguerreL| (SPADCALL |l| 1 (QREFELT % 109))
         (SPADCALL |l| 2 (QREFELT % 109)) (SPADCALL |l| 3 (QREFELT % 109)) %)) 

(SDEFUN |FSPECF;eLaguerreLGrad_z| ((|n| (F)) (|a| (F)) (|z| (F)) (% (F)))
        (SPADCALL (SPADCALL |n| (|spadConstant| % 88) (QREFELT % 122))
                  (SPADCALL |a| (|spadConstant| % 88) (QREFELT % 115)) |z|
                  (QREFELT % 215))) 

(SDEFUN |FSPECF;dLaguerreL| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (|FSPECF;grad3| |l| |t| (QREFELT % 46)
         (CONS (|function| |FSPECF;eLaguerreLGrad_z|) %) %)) 

(SDEFUN |FSPECF;meixnerM;5F;208|
        ((|n| (F)) (|b| (F)) (|c| (F)) (|z| (F)) (% (F)))
        (SPADCALL (QREFELT % 47) |n| |b| |c| |z| (QREFELT % 213))) 

(SDEFUN |FSPECF;eMeixnerM| ((|n| (F)) (|b| (F)) (|c| (F)) (|z| (F)) (% (F)))
        (COND
         ((SPADCALL |n| (|spadConstant| % 84) (QREFELT % 86))
          (|spadConstant| % 88))
         ((SPADCALL |n| (|spadConstant| % 88) (QREFELT % 86))
          (SPADCALL
           (SPADCALL
            (SPADCALL (SPADCALL |c| (|spadConstant| % 88) (QREFELT % 122)) |z|
                      (QREFELT % 114))
            (SPADCALL |c| |b| (QREFELT % 114)) (QREFELT % 123))
           (|spadConstant| % 88) (QREFELT % 115)))
         ('T (SPADCALL (QREFELT % 47) (LIST |n| |b| |c| |z|) (QREFELT % 113))))) 

(SDEFUN |FSPECF;elMeixnerM| ((|l| (|List| F)) (% (F)))
        (|FSPECF;eMeixnerM| (SPADCALL |l| 1 (QREFELT % 109))
         (SPADCALL |l| 2 (QREFELT % 109)) (SPADCALL |l| 3 (QREFELT % 109))
         (SPADCALL |l| 4 (QREFELT % 109)) %)) 

(SDEFUN |FSPECF;belong?;BoB;211| ((|op| (|BasicOperator|)) (% (|Boolean|)))
        (SPADCALL |op| (QREFELT % 8) (QREFELT % 217))) 

(SDEFUN |FSPECF;operator;2Bo;212|
        ((|op| (|BasicOperator|)) (% (|BasicOperator|)))
        (COND ((SPADCALL |op| '|abs| (QREFELT % 219)) (QREFELT % 13))
              ((SPADCALL |op| '|sign| (QREFELT % 219)) (QREFELT % 14))
              ((SPADCALL |op| '|unitStep| (QREFELT % 219)) (QREFELT % 15))
              ((SPADCALL |op| '|ceiling| (QREFELT % 219)) (QREFELT % 16))
              ((SPADCALL |op| '|floor| (QREFELT % 219)) (QREFELT % 17))
              ((SPADCALL |op| '|fractionPart| (QREFELT % 219)) (QREFELT % 18))
              ((SPADCALL |op| '|diracDelta| (QREFELT % 219)) (QREFELT % 19))
              ((SPADCALL |op| '|conjugate| (QREFELT % 219)) (QREFELT % 20))
              ((SPADCALL |op| '|Gamma| (QREFELT % 219)) (QREFELT % 21))
              ((SPADCALL |op| '|Gamma2| (QREFELT % 219)) (QREFELT % 22))
              ((SPADCALL |op| '|Beta| (QREFELT % 219)) (QREFELT % 23))
              ((SPADCALL |op| '|Beta3| (QREFELT % 219)) (QREFELT % 24))
              ((SPADCALL |op| '|digamma| (QREFELT % 219)) (QREFELT % 25))
              ((SPADCALL |op| '|polygamma| (QREFELT % 219)) (QREFELT % 26))
              ((SPADCALL |op| '|besselJ| (QREFELT % 219)) (QREFELT % 27))
              ((SPADCALL |op| '|besselY| (QREFELT % 219)) (QREFELT % 28))
              ((SPADCALL |op| '|besselI| (QREFELT % 219)) (QREFELT % 29))
              ((SPADCALL |op| '|besselK| (QREFELT % 219)) (QREFELT % 30))
              ((SPADCALL |op| '|airyAi| (QREFELT % 219)) (QREFELT % 31))
              ((SPADCALL |op| '|airyAiPrime| (QREFELT % 219)) (QREFELT % 32))
              ((SPADCALL |op| '|airyBi| (QREFELT % 219)) (QREFELT % 33))
              ((SPADCALL |op| '|airyBiPrime| (QREFELT % 219)) (QREFELT % 34))
              ((SPADCALL |op| '|lambertW| (QREFELT % 219)) (QREFELT % 35))
              ((SPADCALL |op| '|polylog| (QREFELT % 219)) (QREFELT % 36))
              ((SPADCALL |op| '|weierstrassP| (QREFELT % 219)) (QREFELT % 37))
              ((SPADCALL |op| '|weierstrassPPrime| (QREFELT % 219))
               (QREFELT % 38))
              ((SPADCALL |op| '|weierstrassSigma| (QREFELT % 219))
               (QREFELT % 39))
              ((SPADCALL |op| '|weierstrassZeta| (QREFELT % 219))
               (QREFELT % 40))
              ((SPADCALL |op| '|hypergeometricF| (QREFELT % 219))
               (QREFELT % 41))
              ((SPADCALL |op| '|meijerG| (QREFELT % 219)) (QREFELT % 42))
              ((SPADCALL |op| '|weierstrassPInverse| (QREFELT % 219))
               (QREFELT % 116))
              ((SPADCALL |op| '|whittakerM| (QREFELT % 219)) (QREFELT % 130))
              ((SPADCALL |op| '|whittakerW| (QREFELT % 219)) (QREFELT % 134))
              ((SPADCALL |op| '|angerJ| (QREFELT % 219)) (QREFELT % 136))
              ((SPADCALL |op| '|weberE| (QREFELT % 219)) (QREFELT % 140))
              ((SPADCALL |op| '|struveH| (QREFELT % 219)) (QREFELT % 144))
              ((SPADCALL |op| '|struveL| (QREFELT % 219)) (QREFELT % 147))
              ((SPADCALL |op| '|hankelH1| (QREFELT % 219)) (QREFELT % 149))
              ((SPADCALL |op| '|hankelH2| (QREFELT % 219)) (QREFELT % 151))
              ((SPADCALL |op| '|lommelS1| (QREFELT % 219)) (QREFELT % 153))
              ((SPADCALL |op| '|lommelS2| (QREFELT % 219)) (QREFELT % 155))
              ((SPADCALL |op| '|kummerM| (QREFELT % 219)) (QREFELT % 157))
              ((SPADCALL |op| '|kummerU| (QREFELT % 219)) (QREFELT % 159))
              ((SPADCALL |op| '|legendreP| (QREFELT % 219)) (QREFELT % 161))
              ((SPADCALL |op| '|legendreQ| (QREFELT % 219)) (QREFELT % 163))
              ((SPADCALL |op| '|kelvinBei| (QREFELT % 219)) (QREFELT % 165))
              ((SPADCALL |op| '|kelvinBer| (QREFELT % 219)) (QREFELT % 168))
              ((SPADCALL |op| '|kelvinKei| (QREFELT % 219)) (QREFELT % 169))
              ((SPADCALL |op| '|kelvinKer| (QREFELT % 219)) (QREFELT % 172))
              ((SPADCALL |op| '|ellipticK| (QREFELT % 219)) (QREFELT % 173))
              ((SPADCALL |op| '|ellipticE| (QREFELT % 219)) (QREFELT % 180))
              ((SPADCALL |op| '|ellipticE2| (QREFELT % 219)) (QREFELT % 181))
              ((SPADCALL |op| '|ellipticF| (QREFELT % 219)) (QREFELT % 189))
              ((SPADCALL |op| '|ellipticPi| (QREFELT % 219)) (QREFELT % 190))
              ((SPADCALL |op| '|jacobiSn| (QREFELT % 219)) (QREFELT % 192))
              ((SPADCALL |op| '|jacobiCn| (QREFELT % 219)) (QREFELT % 201))
              ((SPADCALL |op| '|jacobiDn| (QREFELT % 219)) (QREFELT % 202))
              ((SPADCALL |op| '|jacobiZeta| (QREFELT % 219)) (QREFELT % 203))
              ((SPADCALL |op| '|jacobiTheta| (QREFELT % 219)) (QREFELT % 205))
              ((SPADCALL |op| '|lerchPhi| (QREFELT % 219)) (QREFELT % 207))
              ((SPADCALL |op| '|riemannZeta| (QREFELT % 219)) (QREFELT % 209))
              ((SPADCALL |op| '|charlierC| (QREFELT % 219)) (QREFELT % 43))
              ((SPADCALL |op| '|hermiteH| (QREFELT % 219)) (QREFELT % 44))
              ((SPADCALL |op| '|jacobiP| (QREFELT % 219)) (QREFELT % 45))
              ((SPADCALL |op| '|laguerreL| (QREFELT % 219)) (QREFELT % 46))
              ((SPADCALL |op| '|meixnerM| (QREFELT % 219)) (QREFELT % 47))
              ((SPADCALL |op| '|%logGamma| (QREFELT % 219)) (QREFELT % 48))
              ((SPADCALL |op| '|%eis| (QREFELT % 219)) (QREFELT % 49))
              ((SPADCALL |op| '|%erfs| (QREFELT % 219)) (QREFELT % 50))
              ((SPADCALL |op| '|%erfis| (QREFELT % 219)) (QREFELT % 51))
              ('T (|error| "Not a special operator")))) 

(SDEFUN |FSPECF;iGamma| ((|x| (F)) (% (F)))
        (COND ((SPADCALL |x| (|spadConstant| % 88) (QREFELT % 86)) |x|)
              ('T (SPADCALL (QREFELT % 21) |x| (QREFELT % 221))))) 

(SDEFUN |FSPECF;iabs| ((|x| (F)) (% (F)))
        (COND ((SPADCALL |x| (QREFELT % 222)) (|spadConstant| % 84))
              ((SPADCALL |x| (QREFELT % 223)) (|spadConstant| % 88))
              ((SPADCALL |x| (QREFELT % 13) (QREFELT % 194)) |x|)
              ((SPADCALL |x| (QREFELT % 20) (QREFELT % 194))
               (SPADCALL (QREFELT % 13)
                         (SPADCALL
                          (SPADCALL (SPADCALL |x| (QREFELT % 196))
                                    (QREFELT % 198))
                          1 (QREFELT % 109))
                         (QREFELT % 221)))
              ((SPADCALL |x| (|spadConstant| % 84) (QREFELT % 224))
               (SPADCALL (QREFELT % 13) (SPADCALL |x| (QREFELT % 124))
                         (QREFELT % 221)))
              ('T (SPADCALL (QREFELT % 13) |x| (QREFELT % 221))))) 

(SDEFUN |FSPECF;iconjugate| ((|x| (F)) (% (F)))
        (COND ((SPADCALL |x| (QREFELT % 222)) (|spadConstant| % 84))
              ((SPADCALL |x| (QREFELT % 20) (QREFELT % 194))
               (SPADCALL
                (SPADCALL (SPADCALL |x| (QREFELT % 196)) (QREFELT % 198)) 1
                (QREFELT % 109)))
              ((SPADCALL |x| (QREFELT % 13) (QREFELT % 194)) |x|)
              ('T (SPADCALL (QREFELT % 20) |x| (QREFELT % 221))))) 

(SDEFUN |FSPECF;retract_Q;FU;216|
        ((|x| (F)) (% (|Union| (|Fraction| (|Integer|)) "failed")))
        (SPADCALL |x| (QREFELT % 226))) 

(SDEFUN |FSPECF;coerce_Q;FF;217| ((|x| (|Fraction| (|Integer|))) (% (F)))
        (SPADCALL |x| (QREFELT % 228))) 

(PUT '|FSPECF;retract_Q;FU;218| '|SPADreplace| '(XLAM (|x|) (CONS 1 "failed"))) 

(SDEFUN |FSPECF;retract_Q;FU;218|
        ((|x| (F)) (% (|Union| (|Fraction| (|Integer|)) "failed")))
        (CONS 1 "failed")) 

(SDEFUN |FSPECF;isign| ((|x| (F)) (% (F)))
        (SPROG
         ((|r1| (|Integer|))
          (|ru| (|Union| (|Fraction| (|Integer|)) "failed")))
         (SEQ
          (COND ((SPADCALL |x| (QREFELT % 222)) (|spadConstant| % 84))
                (#1='T
                 (SEQ (LETT |ru| (SPADCALL |x| (QREFELT % 227)))
                      (EXIT
                       (COND
                        ((QEQCAR |ru| 0)
                         (SEQ
                          (LETT |r1| (SPADCALL (QCDR |ru|) (QREFELT % 230)))
                          (EXIT
                           (COND ((EQL |r1| 1) (|spadConstant| % 88))
                                 ((EQL |r1| 0) (|spadConstant| % 84))
                                 (#1#
                                  (SPADCALL (|spadConstant| % 88)
                                            (QREFELT % 124)))))))
                        ((SPADCALL |x| (QREFELT % 14) (QREFELT % 194)) |x|)
                        (#1#
                         (SPADCALL (QREFELT % 14) |x| (QREFELT % 221))))))))))) 

(SDEFUN |FSPECF;i_unitStep| ((|x| (F)) (% (F)))
        (SPROG
         ((|r1| (|Integer|))
          (|ru| (|Union| (|Fraction| (|Integer|)) "failed")))
         (SEQ
          (COND ((SPADCALL |x| (QREFELT % 222)) (|spadConstant| % 88))
                ('T
                 (SEQ (LETT |ru| (SPADCALL |x| (QREFELT % 227)))
                      (EXIT
                       (COND
                        ((QEQCAR |ru| 0)
                         (SEQ
                          (LETT |r1| (SPADCALL (QCDR |ru|) (QREFELT % 230)))
                          (EXIT
                           (COND
                            ((OR (EQL |r1| 1) (EQL |r1| 0))
                             (|spadConstant| % 88))
                            ('T (|spadConstant| % 84))))))
                        ((OR (SPADCALL |x| (QREFELT % 13) (QREFELT % 194))
                             (OR (SPADCALL |x| (QREFELT % 15) (QREFELT % 194))
                                 (SPADCALL |x| (QREFELT % 18)
                                           (QREFELT % 194))))
                         (|spadConstant| % 88))
                        ('T
                         (SPADCALL (QREFELT % 15) |x| (QREFELT % 221))))))))))) 

(SDEFUN |FSPECF;i_ceiling| ((|x| (F)) (% (F)))
        (SPROG ((|ru| (|Union| (|Fraction| (|Integer|)) "failed")))
               (SEQ
                (COND ((SPADCALL |x| (QREFELT % 222)) (|spadConstant| % 84))
                      ('T
                       (SEQ (LETT |ru| (SPADCALL |x| (QREFELT % 227)))
                            (EXIT
                             (COND
                              ((QEQCAR |ru| 0)
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (QCDR |ru|) (QREFELT % 232))
                                 (QREFELT % 233))
                                (QREFELT % 229)))
                              ((OR
                                (SPADCALL |x| (QREFELT % 16) (QREFELT % 194))
                                (SPADCALL |x| (QREFELT % 17) (QREFELT % 194)))
                               |x|)
                              ('T
                               (SPADCALL (QREFELT % 16) |x|
                                         (QREFELT % 221))))))))))) 

(SDEFUN |FSPECF;i_floor| ((|x| (F)) (% (F)))
        (SPROG ((|ru| (|Union| (|Fraction| (|Integer|)) "failed")))
               (SEQ
                (COND ((SPADCALL |x| (QREFELT % 222)) (|spadConstant| % 84))
                      (#1='T
                       (SEQ (LETT |ru| (SPADCALL |x| (QREFELT % 227)))
                            (EXIT
                             (COND
                              ((QEQCAR |ru| 0)
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (QCDR |ru|) (QREFELT % 234))
                                 (QREFELT % 233))
                                (QREFELT % 229)))
                              ((OR
                                (SPADCALL |x| (QREFELT % 16) (QREFELT % 194))
                                (SPADCALL |x| (QREFELT % 17) (QREFELT % 194)))
                               |x|)
                              ((SPADCALL |x| (QREFELT % 18) (QREFELT % 194))
                               (|spadConstant| % 84))
                              (#1#
                               (SPADCALL (QREFELT % 17) |x|
                                         (QREFELT % 221))))))))))) 

(SDEFUN |FSPECF;i_fractionPart| ((|x| (F)) (% (F)))
        (SPROG ((|ru| (|Union| (|Fraction| (|Integer|)) "failed")))
               (SEQ
                (COND ((SPADCALL |x| (QREFELT % 222)) (|spadConstant| % 84))
                      (#1='T
                       (SEQ (LETT |ru| (SPADCALL |x| (QREFELT % 227)))
                            (EXIT
                             (COND
                              ((QEQCAR |ru| 0)
                               (SPADCALL (SPADCALL (QCDR |ru|) (QREFELT % 235))
                                         (QREFELT % 229)))
                              ((OR
                                (SPADCALL |x| (QREFELT % 16) (QREFELT % 194))
                                (SPADCALL |x| (QREFELT % 17) (QREFELT % 194)))
                               (|spadConstant| % 84))
                              ((SPADCALL |x| (QREFELT % 18) (QREFELT % 194))
                               |x|)
                              (#1#
                               (SPADCALL (QREFELT % 18) |x|
                                         (QREFELT % 221))))))))))) 

(SDEFUN |FSPECF;i_diracDelta| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 19) |x| (QREFELT % 221))) 

(SDEFUN |FSPECF;iBeta| ((|x| (F)) (|y| (F)) (% (F)))
        (SPADCALL (QREFELT % 23) (LIST |x| |y|) (QREFELT % 113))) 

(SDEFUN |FSPECF;idigamma| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 25) |x| (QREFELT % 221))) 

(SDEFUN |FSPECF;iiipolygamma| ((|n| (F)) (|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 26) (LIST |n| |x|) (QREFELT % 113))) 

(SDEFUN |FSPECF;iiiBesselJ| ((|x| (F)) (|y| (F)) (% (F)))
        (SPADCALL (QREFELT % 27) (LIST |x| |y|) (QREFELT % 113))) 

(SDEFUN |FSPECF;iiiBesselY| ((|x| (F)) (|y| (F)) (% (F)))
        (SPADCALL (QREFELT % 28) (LIST |x| |y|) (QREFELT % 113))) 

(SDEFUN |FSPECF;iiiBesselI| ((|x| (F)) (|y| (F)) (% (F)))
        (SPADCALL (QREFELT % 29) (LIST |x| |y|) (QREFELT % 113))) 

(SDEFUN |FSPECF;iiiBesselK| ((|x| (F)) (|y| (F)) (% (F)))
        (SPADCALL (QREFELT % 30) (LIST |x| |y|) (QREFELT % 113))) 

(SDEFUN |FSPECF;iAiryAi;2F;232| ((|x| (F)) (% (F)))
        (COND
         ((SPADCALL |x| (QREFELT % 222))
          (SPADCALL (|spadConstant| % 88)
                    (SPADCALL
                     (SPADCALL (SPADCALL 3 (QREFELT % 90)) (QREFELT % 107)
                               (QREFELT % 146))
                     (SPADCALL (QREFELT % 107) (QREFELT % 61)) (QREFELT % 114))
                    (QREFELT % 123)))
         ('T (SPADCALL (QREFELT % 31) |x| (QREFELT % 221))))) 

(SDEFUN |FSPECF;iAiryAiPrime;2F;233| ((|x| (F)) (% (F)))
        (COND
         ((SPADCALL |x| (QREFELT % 222))
          (SPADCALL
           (SPADCALL (|spadConstant| % 88)
                     (SPADCALL
                      (SPADCALL (SPADCALL 3 (QREFELT % 90)) (QREFELT % 102)
                                (QREFELT % 146))
                      (SPADCALL (QREFELT % 102) (QREFELT % 61))
                      (QREFELT % 114))
                     (QREFELT % 123))
           (QREFELT % 124)))
         ('T (SPADCALL (QREFELT % 32) |x| (QREFELT % 221))))) 

(SDEFUN |FSPECF;iAiryBi;2F;234| ((|x| (F)) (% (F)))
        (COND
         ((SPADCALL |x| (QREFELT % 222))
          (SPADCALL (|spadConstant| % 88)
                    (SPADCALL
                     (SPADCALL (SPADCALL 3 (QREFELT % 90)) (QREFELT % 104)
                               (QREFELT % 146))
                     (SPADCALL (QREFELT % 107) (QREFELT % 61)) (QREFELT % 114))
                    (QREFELT % 123)))
         ('T (SPADCALL (QREFELT % 33) |x| (QREFELT % 221))))) 

(SDEFUN |FSPECF;iAiryBiPrime;2F;235| ((|x| (F)) (% (F)))
        (COND
         ((SPADCALL |x| (QREFELT % 222))
          (SPADCALL
           (SPADCALL (SPADCALL 3 (QREFELT % 90)) (QREFELT % 104)
                     (QREFELT % 146))
           (SPADCALL (QREFELT % 102) (QREFELT % 61)) (QREFELT % 123)))
         ('T (SPADCALL (QREFELT % 34) |x| (QREFELT % 221))))) 

(SDEFUN |FSPECF;iAiryAi;2F;236| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 31) |x| (QREFELT % 221))) 

(SDEFUN |FSPECF;iAiryAiPrime;2F;237| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 32) |x| (QREFELT % 221))) 

(SDEFUN |FSPECF;iAiryBi;2F;238| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 33) |x| (QREFELT % 221))) 

(SDEFUN |FSPECF;iAiryBiPrime;2F;239| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 34) |x| (QREFELT % 221))) 

(SDEFUN |FSPECF;iLambertW;2F;240| ((|x| (F)) (% (F)))
        (COND ((SPADCALL |x| (QREFELT % 222)) (|spadConstant| % 84))
              ((SPADCALL |x| (SPADCALL (|spadConstant| % 88) (QREFELT % 240))
                         (QREFELT % 86))
               (|spadConstant| % 88))
              ((SPADCALL |x|
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (|spadConstant| % 88) (QREFELT % 124))
                           (QREFELT % 240))
                          (QREFELT % 124))
                         (QREFELT % 86))
               (SPADCALL (|spadConstant| % 88) (QREFELT % 124)))
              ('T (SPADCALL (QREFELT % 35) |x| (QREFELT % 221))))) 

(SDEFUN |FSPECF;iLambertW;2F;241| ((|x| (F)) (% (F)))
        (COND ((SPADCALL |x| (QREFELT % 222)) (|spadConstant| % 84))
              ('T (SPADCALL (QREFELT % 35) |x| (QREFELT % 221))))) 

(SDEFUN |FSPECF;iiiPolylog| ((|s| (F)) (|x| (F)) (% (F)))
        (COND
         ((SPADCALL |x| (|spadConstant| % 84) (QREFELT % 86))
          (|spadConstant| % 84))
         ('T (SPADCALL (QREFELT % 36) (LIST |s| |x|) (QREFELT % 113))))) 

(SDEFUN |FSPECF;iiPolylog;3F;243| ((|s| (F)) (|x| (F)) (% (F)))
        (COND
         ((SPADCALL |s| (|spadConstant| % 88) (QREFELT % 86))
          (SPADCALL
           (SPADCALL (SPADCALL (|spadConstant| % 88) |x| (QREFELT % 122))
                     (QREFELT % 242))
           (QREFELT % 124)))
         ((SPADCALL |s| (SPADCALL 2 (QREFELT % 90)) (QREFELT % 86))
          (SPADCALL (SPADCALL (|spadConstant| % 88) |x| (QREFELT % 122))
                    (QREFELT % 243)))
         ('T (|FSPECF;iiiPolylog| |s| |x| %)))) 

(SDEFUN |FSPECF;iiPolylog;3F;244| ((|s| (F)) (|x| (F)) (% (F)))
        (COND
         ((SPADCALL |s| (|spadConstant| % 88) (QREFELT % 86))
          (SPADCALL
           (SPADCALL (SPADCALL (|spadConstant| % 88) |x| (QREFELT % 122))
                     (QREFELT % 242))
           (QREFELT % 124)))
         ('T (|FSPECF;iiiPolylog| |s| |x| %)))) 

(SDEFUN |FSPECF;iiPolylog;3F;245| ((|s| (F)) (|x| (F)) (% (F)))
        (|FSPECF;iiiPolylog| |s| |x| %)) 

(SDEFUN |FSPECF;iPolylog| ((|l| (|List| F)) (% (F)))
        (SPADCALL (|SPADfirst| |l|) (SPADCALL |l| (QREFELT % 245))
                  (QREFELT % 244))) 

(SDEFUN |FSPECF;iWeierstrassP| ((|g2| (F)) (|g3| (F)) (|x| (F)) (% (F)))
        (SPROG ((#1=#:G860 NIL) (|args| (|List| F)))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL |x| (QREFELT % 116) (QREFELT % 194))
                    (SEQ
                     (LETT |args|
                           (SPADCALL (SPADCALL |x| (QREFELT % 196))
                                     (QREFELT % 198)))
                     (EXIT
                      (COND
                       ((SPADCALL |g2| (SPADCALL |args| 1 (QREFELT % 109))
                                  (QREFELT % 86))
                        (COND
                         ((SPADCALL |g3| (SPADCALL |args| 2 (QREFELT % 109))
                                    (QREFELT % 86))
                          (PROGN
                           (LETT #1# (SPADCALL |args| 3 (QREFELT % 109)))
                           (GO #2=#:G859))))))))))
                  (EXIT
                   (SPADCALL (QREFELT % 37) (LIST |g2| |g3| |x|)
                             (QREFELT % 113)))))
                #2# (EXIT #1#)))) 

(SDEFUN |FSPECF;iWeierstrassPPrime| ((|g2| (F)) (|g3| (F)) (|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 38) (LIST |g2| |g3| |x|) (QREFELT % 113))) 

(SDEFUN |FSPECF;iWeierstrassSigma| ((|g2| (F)) (|g3| (F)) (|x| (F)) (% (F)))
        (COND
         ((SPADCALL |x| (|spadConstant| % 84) (QREFELT % 86))
          (|spadConstant| % 84))
         ('T (SPADCALL (QREFELT % 39) (LIST |g2| |g3| |x|) (QREFELT % 113))))) 

(SDEFUN |FSPECF;iWeierstrassZeta| ((|g2| (F)) (|g3| (F)) (|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 40) (LIST |g2| |g3| |x|) (QREFELT % 113))) 

(SDEFUN |FSPECF;iiabs;2F;251| ((|x| (F)) (% (F)))
        (SPROG
         ((#1=#:G884 NIL) (|b| #2=(|Union| R "failed")) (|a| #2#)
          (|f| (|Fraction| (|Polynomial| R)))
          (|r| (|Union| (|Fraction| (|Polynomial| R)) "failed")))
         (SEQ (LETT |r| (SPADCALL |x| (QREFELT % 247)))
              (EXIT
               (COND ((QEQCAR |r| 1) (|FSPECF;iabs| |x| %))
                     (#3='T
                      (SEQ
                       (EXIT
                        (SEQ (LETT |f| (QCDR |r|))
                             (SEQ
                              (LETT |a|
                                    (SPADCALL (SPADCALL |f| (QREFELT % 250))
                                              (QREFELT % 252)))
                              (EXIT
                               (COND
                                ((QEQCAR |a| 1)
                                 (PROGN
                                  (LETT #1# (|FSPECF;iabs| |x| %))
                                  (GO #4=#:G881)))
                                (#3#
                                 (SEQ
                                  (LETT |b|
                                        (SPADCALL
                                         (SPADCALL |f| (QREFELT % 253))
                                         (QREFELT % 252)))
                                  (EXIT
                                   (COND
                                    ((QEQCAR |b| 1)
                                     (PROGN
                                      (LETT #1# (|FSPECF;iabs| |x| %))
                                      (GO #4#))))))))))
                             (EXIT
                              (SPADCALL
                               (SPADCALL (SPADCALL (QCDR |a|) (QREFELT % 254))
                                         (QREFELT % 255))
                               (SPADCALL (SPADCALL (QCDR |b|) (QREFELT % 254))
                                         (QREFELT % 255))
                               (QREFELT % 123)))))
                       #4# (EXIT #1#)))))))) 

(SDEFUN |FSPECF;iiabs;2F;252| ((|x| (F)) (% (F))) (|FSPECF;iabs| |x| %)) 

(SDEFUN |FSPECF;iiconjugate;2F;253| ((|x| (F)) (% (F)))
        (SPROG ((#1=#:G930 NIL))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |x| (QREFELT % 20) (QREFELT % 194))
                   (SPADCALL
                    (SPADCALL (SPADCALL |x| (QREFELT % 196)) (QREFELT % 198)) 1
                    (QREFELT % 109)))
                  ((SPADCALL |x| (QREFELT % 13) (QREFELT % 194)) |x|)
                  ((QEQCAR (SPADCALL |x| (QREFELT % 258)) 0)
                   (|FSPECF;iconjugate| |x| %))
                  ('T
                   (SEQ
                    (LETT |x|
                          (SPADCALL |x| (SPADCALL |x| (QREFELT % 260))
                                    (SPADCALL
                                     (CONS #'|FSPECF;iiconjugate;2F;253!0| %)
                                     (SPADCALL |x| (QREFELT % 260))
                                     (QREFELT % 273))
                                    (QREFELT % 274)))
                    (COND
                     ((|HasSignature| (QREFELT % 6)
                                      (LIST '|conjugate|
                                            (LIST (|devaluate| (QREFELT % 6))
                                                  (|devaluate|
                                                   (QREFELT % 6)))))
                      (LETT |x|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (ELT % 275)
                                        (SPADCALL |x| (QREFELT % 277))
                                        (QREFELT % 279))
                              (QREFELT % 280))
                             (SPADCALL
                              (SPADCALL (ELT % 275)
                                        (SPADCALL |x| (QREFELT % 281))
                                        (QREFELT % 279))
                              (QREFELT % 280))
                             (QREFELT % 123)))))
                    (EXIT (PROGN (LETT #1# |x|) (GO #2=#:G929)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |FSPECF;iiconjugate;2F;253!0| ((|k| NIL) (% NIL))
        (SEQ
         (COND
          ((SPADCALL (SPADCALL |k| (QREFELT % 262)) (|spadConstant| % 263)
                     (QREFELT % 264))
           (EXIT (|FSPECF;iconjugate| (SPADCALL |k| (QREFELT % 265)) %)))
          ((SPADCALL (SPADCALL |k| (QREFELT % 262)) (|spadConstant| % 266)
                     (QREFELT % 264))
           (COND
            ((QEQCAR (SPADCALL (SPADCALL |k| (QREFELT % 265)) (QREFELT % 258))
                     0)
             (EXIT (|FSPECF;iconjugate| (SPADCALL |k| (QREFELT % 265)) %))))))
         (EXIT (SPADCALL (ELT % 267) |k| (QREFELT % 269))))) 

(SDEFUN |FSPECF;iiGamma;2F;254| ((|x| (F)) (% (F)))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT % 282)))
                    (EXIT
                     (COND ((QEQCAR |r| 1) (|FSPECF;iGamma| |x| %))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT % 283))
                                      (QREFELT % 255)))))))) 

(SDEFUN |FSPECF;iiBeta;LF;255| ((|l| (|List| F)) (% (F)))
        (SPROG ((#1=#:G943 NIL) (|s| #2=(|Union| R "failed")) (|r| #2#))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |r| (SPADCALL (|SPADfirst| |l|) (QREFELT % 282)))
                       (EXIT
                        (COND
                         ((QEQCAR |r| 1)
                          (PROGN
                           (LETT #1#
                                 (|FSPECF;iBeta| (|SPADfirst| |l|)
                                  (SPADCALL |l| (QREFELT % 245)) %))
                           (GO #3=#:G941)))
                         ('T
                          (SEQ
                           (LETT |s|
                                 (SPADCALL (SPADCALL |l| (QREFELT % 245))
                                           (QREFELT % 282)))
                           (EXIT
                            (COND
                             ((QEQCAR |s| 1)
                              (PROGN
                               (LETT #1#
                                     (|FSPECF;iBeta| (|SPADfirst| |l|)
                                      (SPADCALL |l| (QREFELT % 245)) %))
                               (GO #3#))))))))))
                  (EXIT
                   (SPADCALL (SPADCALL (QCDR |r|) (QCDR |s|) (QREFELT % 285))
                             (QREFELT % 255)))))
                #3# (EXIT #1#)))) 

(SDEFUN |FSPECF;iidigamma;2F;256| ((|x| (F)) (% (F)))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT % 282)))
                    (EXIT
                     (COND ((QEQCAR |r| 1) (|FSPECF;idigamma| |x| %))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT % 287))
                                      (QREFELT % 255)))))))) 

(SDEFUN |FSPECF;iipolygamma;LF;257| ((|l| (|List| F)) (% (F)))
        (SPROG ((#1=#:G956 NIL) (|r| #2=(|Union| R "failed")) (|s| #2#))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |s| (SPADCALL (|SPADfirst| |l|) (QREFELT % 282)))
                       (EXIT
                        (COND
                         ((QEQCAR |s| 1)
                          (PROGN
                           (LETT #1#
                                 (|FSPECF;iiipolygamma| (|SPADfirst| |l|)
                                  (SPADCALL |l| (QREFELT % 245)) %))
                           (GO #3=#:G954)))
                         ('T
                          (SEQ
                           (LETT |r|
                                 (SPADCALL (SPADCALL |l| (QREFELT % 245))
                                           (QREFELT % 282)))
                           (EXIT
                            (COND
                             ((QEQCAR |r| 1)
                              (PROGN
                               (LETT #1#
                                     (|FSPECF;iiipolygamma| (|SPADfirst| |l|)
                                      (SPADCALL |l| (QREFELT % 245)) %))
                               (GO #3#))))))))))
                  (EXIT
                   (SPADCALL (SPADCALL (QCDR |s|) (QCDR |r|) (QREFELT % 289))
                             (QREFELT % 255)))))
                #3# (EXIT #1#)))) 

(SDEFUN |FSPECF;iiBesselJ;LF;258| ((|l| (|List| F)) (% (F)))
        (SPROG ((#1=#:G964 NIL) (|s| #2=(|Union| R "failed")) (|r| #2#))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |r| (SPADCALL (|SPADfirst| |l|) (QREFELT % 282)))
                       (EXIT
                        (COND
                         ((QEQCAR |r| 1)
                          (PROGN
                           (LETT #1#
                                 (|FSPECF;iiiBesselJ| (|SPADfirst| |l|)
                                  (SPADCALL |l| (QREFELT % 245)) %))
                           (GO #3=#:G962)))
                         ('T
                          (SEQ
                           (LETT |s|
                                 (SPADCALL (SPADCALL |l| (QREFELT % 245))
                                           (QREFELT % 282)))
                           (EXIT
                            (COND
                             ((QEQCAR |s| 1)
                              (PROGN
                               (LETT #1#
                                     (|FSPECF;iiiBesselJ| (|SPADfirst| |l|)
                                      (SPADCALL |l| (QREFELT % 245)) %))
                               (GO #3#))))))))))
                  (EXIT
                   (SPADCALL (SPADCALL (QCDR |r|) (QCDR |s|) (QREFELT % 291))
                             (QREFELT % 255)))))
                #3# (EXIT #1#)))) 

(SDEFUN |FSPECF;iiBesselY;LF;259| ((|l| (|List| F)) (% (F)))
        (SPROG ((#1=#:G972 NIL) (|s| #2=(|Union| R "failed")) (|r| #2#))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |r| (SPADCALL (|SPADfirst| |l|) (QREFELT % 282)))
                       (EXIT
                        (COND
                         ((QEQCAR |r| 1)
                          (PROGN
                           (LETT #1#
                                 (|FSPECF;iiiBesselY| (|SPADfirst| |l|)
                                  (SPADCALL |l| (QREFELT % 245)) %))
                           (GO #3=#:G970)))
                         ('T
                          (SEQ
                           (LETT |s|
                                 (SPADCALL (SPADCALL |l| (QREFELT % 245))
                                           (QREFELT % 282)))
                           (EXIT
                            (COND
                             ((QEQCAR |s| 1)
                              (PROGN
                               (LETT #1#
                                     (|FSPECF;iiiBesselY| (|SPADfirst| |l|)
                                      (SPADCALL |l| (QREFELT % 245)) %))
                               (GO #3#))))))))))
                  (EXIT
                   (SPADCALL (SPADCALL (QCDR |r|) (QCDR |s|) (QREFELT % 293))
                             (QREFELT % 255)))))
                #3# (EXIT #1#)))) 

(SDEFUN |FSPECF;iiBesselI;LF;260| ((|l| (|List| F)) (% (F)))
        (SPROG ((#1=#:G980 NIL) (|s| #2=(|Union| R "failed")) (|r| #2#))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |r| (SPADCALL (|SPADfirst| |l|) (QREFELT % 282)))
                       (EXIT
                        (COND
                         ((QEQCAR |r| 1)
                          (PROGN
                           (LETT #1#
                                 (|FSPECF;iiiBesselI| (|SPADfirst| |l|)
                                  (SPADCALL |l| (QREFELT % 245)) %))
                           (GO #3=#:G978)))
                         ('T
                          (SEQ
                           (LETT |s|
                                 (SPADCALL (SPADCALL |l| (QREFELT % 245))
                                           (QREFELT % 282)))
                           (EXIT
                            (COND
                             ((QEQCAR |s| 1)
                              (PROGN
                               (LETT #1#
                                     (|FSPECF;iiiBesselI| (|SPADfirst| |l|)
                                      (SPADCALL |l| (QREFELT % 245)) %))
                               (GO #3#))))))))))
                  (EXIT
                   (SPADCALL (SPADCALL (QCDR |r|) (QCDR |s|) (QREFELT % 295))
                             (QREFELT % 255)))))
                #3# (EXIT #1#)))) 

(SDEFUN |FSPECF;iiBesselK;LF;261| ((|l| (|List| F)) (% (F)))
        (SPROG ((#1=#:G988 NIL) (|s| #2=(|Union| R "failed")) (|r| #2#))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |r| (SPADCALL (|SPADfirst| |l|) (QREFELT % 282)))
                       (EXIT
                        (COND
                         ((QEQCAR |r| 1)
                          (PROGN
                           (LETT #1#
                                 (|FSPECF;iiiBesselK| (|SPADfirst| |l|)
                                  (SPADCALL |l| (QREFELT % 245)) %))
                           (GO #3=#:G986)))
                         ('T
                          (SEQ
                           (LETT |s|
                                 (SPADCALL (SPADCALL |l| (QREFELT % 245))
                                           (QREFELT % 282)))
                           (EXIT
                            (COND
                             ((QEQCAR |s| 1)
                              (PROGN
                               (LETT #1#
                                     (|FSPECF;iiiBesselK| (|SPADfirst| |l|)
                                      (SPADCALL |l| (QREFELT % 245)) %))
                               (GO #3#))))))))))
                  (EXIT
                   (SPADCALL (SPADCALL (QCDR |r|) (QCDR |s|) (QREFELT % 297))
                             (QREFELT % 255)))))
                #3# (EXIT #1#)))) 

(SDEFUN |FSPECF;iiAiryAi;2F;262| ((|x| (F)) (% (F)))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT % 282)))
                    (EXIT
                     (COND ((QEQCAR |r| 1) (SPADCALL |x| (QREFELT % 236)))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT % 299))
                                      (QREFELT % 255)))))))) 

(SDEFUN |FSPECF;iiAiryAiPrime;2F;263| ((|x| (F)) (% (F)))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT % 282)))
                    (EXIT
                     (COND ((QEQCAR |r| 1) (SPADCALL |x| (QREFELT % 237)))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT % 301))
                                      (QREFELT % 255)))))))) 

(SDEFUN |FSPECF;iiAiryBi;2F;264| ((|x| (F)) (% (F)))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT % 282)))
                    (EXIT
                     (COND ((QEQCAR |r| 1) (SPADCALL |x| (QREFELT % 238)))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT % 303))
                                      (QREFELT % 255)))))))) 

(SDEFUN |FSPECF;iiAiryBiPrime;2F;265| ((|x| (F)) (% (F)))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT % 282)))
                    (EXIT
                     (COND ((QEQCAR |r| 1) (SPADCALL |x| (QREFELT % 239)))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT % 305))
                                      (QREFELT % 255)))))))) 

(SDEFUN |FSPECF;iiGamma;2F;266| ((|x| (F)) (% (F)))
        (SPROG ((#1=#:G1016 NIL) (|r| (|Union| (|Integer|) "failed")))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |r| (SPADCALL |x| (QREFELT % 308)))
                       (EXIT
                        (COND
                         ((QEQCAR |r| 0)
                          (COND
                           ((>= (QCDR |r|) 1)
                            (PROGN
                             (LETT #1#
                                   (SPADCALL
                                    (SPADCALL (- (QCDR |r|) 1) (QREFELT % 309))
                                    (QREFELT % 90)))
                             (GO #2=#:G1014))))))))
                  (EXIT (|FSPECF;iGamma| |x| %))))
                #2# (EXIT #1#)))) 

(SDEFUN |FSPECF;iiGamma;2F;267| ((|x| (F)) (% (F))) (|FSPECF;iGamma| |x| %)) 

(SDEFUN |FSPECF;iiBeta;LF;268| ((|l| (|List| F)) (% (F)))
        (|FSPECF;iBeta| (|SPADfirst| |l|) (SPADCALL |l| (QREFELT % 245)) %)) 

(SDEFUN |FSPECF;iidigamma;2F;269| ((|x| (F)) (% (F))) (|FSPECF;idigamma| |x| %)) 

(SDEFUN |FSPECF;iipolygamma;LF;270| ((|l| (|List| F)) (% (F)))
        (|FSPECF;iiipolygamma| (|SPADfirst| |l|) (SPADCALL |l| (QREFELT % 245))
         %)) 

(SDEFUN |FSPECF;iiBesselJ;LF;271| ((|l| (|List| F)) (% (F)))
        (|FSPECF;iiiBesselJ| (|SPADfirst| |l|) (SPADCALL |l| (QREFELT % 245))
         %)) 

(SDEFUN |FSPECF;iiBesselY;LF;272| ((|l| (|List| F)) (% (F)))
        (|FSPECF;iiiBesselY| (|SPADfirst| |l|) (SPADCALL |l| (QREFELT % 245))
         %)) 

(SDEFUN |FSPECF;iiBesselI;LF;273| ((|l| (|List| F)) (% (F)))
        (|FSPECF;iiiBesselI| (|SPADfirst| |l|) (SPADCALL |l| (QREFELT % 245))
         %)) 

(SDEFUN |FSPECF;iiBesselK;LF;274| ((|l| (|List| F)) (% (F)))
        (|FSPECF;iiiBesselK| (|SPADfirst| |l|) (SPADCALL |l| (QREFELT % 245))
         %)) 

(SDEFUN |FSPECF;iiAiryAi;2F;275| ((|x| (F)) (% (F)))
        (SPADCALL |x| (QREFELT % 236))) 

(SDEFUN |FSPECF;iiAiryAiPrime;2F;276| ((|x| (F)) (% (F)))
        (SPADCALL |x| (QREFELT % 237))) 

(SDEFUN |FSPECF;iiAiryBi;2F;277| ((|x| (F)) (% (F)))
        (SPADCALL |x| (QREFELT % 238))) 

(SDEFUN |FSPECF;iiAiryBiPrime;2F;278| ((|x| (F)) (% (F)))
        (SPADCALL |x| (QREFELT % 239))) 

(SDEFUN |FSPECF;iiWeierstrassP| ((|l| (|List| F)) (% (F)))
        (|FSPECF;iWeierstrassP| (|SPADfirst| |l|)
         (SPADCALL |l| (QREFELT % 245)) (SPADCALL |l| (QREFELT % 310)) %)) 

(SDEFUN |FSPECF;iiWeierstrassPPrime| ((|l| (|List| F)) (% (F)))
        (|FSPECF;iWeierstrassPPrime| (|SPADfirst| |l|)
         (SPADCALL |l| (QREFELT % 245)) (SPADCALL |l| (QREFELT % 310)) %)) 

(SDEFUN |FSPECF;iiWeierstrassSigma| ((|l| (|List| F)) (% (F)))
        (|FSPECF;iWeierstrassSigma| (|SPADfirst| |l|)
         (SPADCALL |l| (QREFELT % 245)) (SPADCALL |l| (QREFELT % 310)) %)) 

(SDEFUN |FSPECF;iiWeierstrassZeta| ((|l| (|List| F)) (% (F)))
        (|FSPECF;iWeierstrassZeta| (|SPADfirst| |l|)
         (SPADCALL |l| (QREFELT % 245)) (SPADCALL |l| (QREFELT % 310)) %)) 

(SDEFUN |FSPECF;diff1| ((|op| (|BasicOperator|)) (|n| (F)) (|x| (F)) (% (F)))
        (SPROG ((|dm| (F)))
               (SEQ
                (LETT |dm|
                      (SPADCALL (SPADCALL (QREFELT % 110)) (QREFELT % 111)))
                (EXIT
                 (SPADCALL (QREFELT % 98)
                           (LIST (SPADCALL |op| (LIST |dm| |x|) (QREFELT % 94))
                                 |dm| |n|)
                           (QREFELT % 113)))))) 

(SDEFUN |FSPECF;iBesselJ| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (SPROG ((|x| (F)) (|n| (F)))
               (SEQ (LETT |n| (|SPADfirst| |l|))
                    (LETT |x| (SPADCALL |l| (QREFELT % 245)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL (SPADCALL |n| |t| (QREFELT % 112))
                                (|FSPECF;diff1| (QREFELT % 27) |n| |x| %)
                                (QREFELT % 114))
                      (SPADCALL
                       (SPADCALL (SPADCALL |x| |t| (QREFELT % 112))
                                 (QREFELT % 101) (QREFELT % 114))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL |n| (|spadConstant| % 88) (QREFELT % 122))
                         |x| (QREFELT % 69))
                        (SPADCALL
                         (SPADCALL |n| (|spadConstant| % 88) (QREFELT % 115))
                         |x| (QREFELT % 69))
                        (QREFELT % 122))
                       (QREFELT % 114))
                      (QREFELT % 115)))))) 

(SDEFUN |FSPECF;iBesselY| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (SPROG ((|x| (F)) (|n| (F)))
               (SEQ (LETT |n| (|SPADfirst| |l|))
                    (LETT |x| (SPADCALL |l| (QREFELT % 245)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL (SPADCALL |n| |t| (QREFELT % 112))
                                (|FSPECF;diff1| (QREFELT % 28) |n| |x| %)
                                (QREFELT % 114))
                      (SPADCALL
                       (SPADCALL (SPADCALL |x| |t| (QREFELT % 112))
                                 (QREFELT % 101) (QREFELT % 114))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL |n| (|spadConstant| % 88) (QREFELT % 122))
                         |x| (QREFELT % 70))
                        (SPADCALL
                         (SPADCALL |n| (|spadConstant| % 88) (QREFELT % 115))
                         |x| (QREFELT % 70))
                        (QREFELT % 122))
                       (QREFELT % 114))
                      (QREFELT % 115)))))) 

(SDEFUN |FSPECF;iBesselI| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (SPROG ((|x| (F)) (|n| (F)))
               (SEQ (LETT |n| (|SPADfirst| |l|))
                    (LETT |x| (SPADCALL |l| (QREFELT % 245)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL (SPADCALL |n| |t| (QREFELT % 112))
                                (|FSPECF;diff1| (QREFELT % 29) |n| |x| %)
                                (QREFELT % 114))
                      (SPADCALL
                       (SPADCALL (SPADCALL |x| |t| (QREFELT % 112))
                                 (QREFELT % 101) (QREFELT % 114))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL |n| (|spadConstant| % 88) (QREFELT % 122))
                         |x| (QREFELT % 71))
                        (SPADCALL
                         (SPADCALL |n| (|spadConstant| % 88) (QREFELT % 115))
                         |x| (QREFELT % 71))
                        (QREFELT % 115))
                       (QREFELT % 114))
                      (QREFELT % 115)))))) 

(SDEFUN |FSPECF;iBesselK| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (SPROG ((|x| (F)) (|n| (F)))
               (SEQ (LETT |n| (|SPADfirst| |l|))
                    (LETT |x| (SPADCALL |l| (QREFELT % 245)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL (SPADCALL |n| |t| (QREFELT % 112))
                                (|FSPECF;diff1| (QREFELT % 30) |n| |x| %)
                                (QREFELT % 114))
                      (SPADCALL
                       (SPADCALL (SPADCALL |x| |t| (QREFELT % 112))
                                 (QREFELT % 101) (QREFELT % 114))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL |n| (|spadConstant| % 88) (QREFELT % 122))
                         |x| (QREFELT % 72))
                        (SPADCALL
                         (SPADCALL |n| (|spadConstant| % 88) (QREFELT % 115))
                         |x| (QREFELT % 72))
                        (QREFELT % 115))
                       (QREFELT % 114))
                      (QREFELT % 122)))))) 

(SDEFUN |FSPECF;dPolylog| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (SPROG ((|x| (F)) (|s| (F)))
               (SEQ (LETT |s| (|SPADfirst| |l|))
                    (LETT |x| (SPADCALL |l| (QREFELT % 245)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL (SPADCALL |s| |t| (QREFELT % 112))
                                (|FSPECF;diff1| (QREFELT % 36) |s| |x| %)
                                (QREFELT % 114))
                      (SPADCALL
                       (SPADCALL (SPADCALL |x| |t| (QREFELT % 112))
                                 (SPADCALL
                                  (SPADCALL |s| (|spadConstant| % 88)
                                            (QREFELT % 122))
                                  |x| (QREFELT % 78))
                                 (QREFELT % 114))
                       |x| (QREFELT % 123))
                      (QREFELT % 115)))))) 

(SDEFUN |FSPECF;ipolygamma| ((|l| (|List| F)) (|x| (|Symbol|)) (% (F)))
        (SPROG ((|y| (F)) (|n| (F)))
               (SEQ
                (COND
                 ((SPADCALL |x| (SPADCALL (|SPADfirst| |l|) (QREFELT % 313))
                            (QREFELT % 314))
                  (|error|
                   "cannot differentiate polygamma with respect to the first argument"))
                 ('T
                  (SEQ (LETT |n| (|SPADfirst| |l|))
                       (LETT |y| (SPADCALL |l| (QREFELT % 245)))
                       (EXIT
                        (SPADCALL (SPADCALL |y| |x| (QREFELT % 112))
                                  (SPADCALL
                                   (SPADCALL |n| (|spadConstant| % 88)
                                             (QREFELT % 115))
                                   |y| (QREFELT % 68))
                                  (QREFELT % 114))))))))) 

(SDEFUN |FSPECF;iBetaGrad1| ((|l| (|List| F)) (% (F)))
        (SPROG ((|y| (F)) (|x| (F)))
               (SEQ (LETT |x| (|SPADfirst| |l|))
                    (LETT |y| (SPADCALL |l| (QREFELT % 245)))
                    (EXIT
                     (SPADCALL (SPADCALL |x| |y| (QREFELT % 64))
                               (SPADCALL (SPADCALL |x| (QREFELT % 67))
                                         (SPADCALL
                                          (SPADCALL |x| |y| (QREFELT % 115))
                                          (QREFELT % 67))
                                         (QREFELT % 122))
                               (QREFELT % 114)))))) 

(SDEFUN |FSPECF;iBetaGrad2| ((|l| (|List| F)) (% (F)))
        (SPROG ((|y| (F)) (|x| (F)))
               (SEQ (LETT |x| (|SPADfirst| |l|))
                    (LETT |y| (SPADCALL |l| (QREFELT % 245)))
                    (EXIT
                     (SPADCALL (SPADCALL |x| |y| (QREFELT % 64))
                               (SPADCALL (SPADCALL |y| (QREFELT % 67))
                                         (SPADCALL
                                          (SPADCALL |x| |y| (QREFELT % 115))
                                          (QREFELT % 67))
                                         (QREFELT % 122))
                               (QREFELT % 114)))))) 

(SDEFUN |FSPECF;elBeta3| ((|l| (|List| F)) (% (F)))
        (SPROG ((|x| (F)))
               (SEQ (LETT |x| (SPADCALL |l| 1 (QREFELT % 109)))
                    (EXIT
                     (COND
                      ((SPADCALL |x| (|spadConstant| % 84) (QREFELT % 86))
                       (|spadConstant| % 84))
                      ('T (SPADCALL (QREFELT % 24) |l| (QREFELT % 113)))))))) 

(SDEFUN |FSPECF;eBeta3Grad1| ((|l| (|List| F)) (% (F)))
        (SPROG ((|b| (F)) (|a| (F)) (|x| (F)))
               (SEQ (LETT |x| (SPADCALL |l| 1 (QREFELT % 109)))
                    (LETT |a| (SPADCALL |l| 2 (QREFELT % 109)))
                    (LETT |b| (SPADCALL |l| 3 (QREFELT % 109)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL |x|
                                (SPADCALL |a| (|spadConstant| % 88)
                                          (QREFELT % 122))
                                (QREFELT % 146))
                      (SPADCALL
                       (SPADCALL (|spadConstant| % 88) |x| (QREFELT % 122))
                       (SPADCALL |b| (|spadConstant| % 88) (QREFELT % 122))
                       (QREFELT % 146))
                      (QREFELT % 114)))))) 

(SDEFUN |FSPECF;eBeta3Grad2| ((|l| (|List| F)) (% (F)))
        (SPROG
         ((|sb| (|SegmentBinding| F)) (|ss| (|Segment| F)) (|xd| (F))
          (|dummy_s| (|Symbol|)) (|b| (F)) (|a| (F)) (|x| (F)))
         (SEQ (LETT |x| (SPADCALL |l| 1 (QREFELT % 109)))
              (LETT |a| (SPADCALL |l| 2 (QREFELT % 109)))
              (LETT |b| (SPADCALL |l| 3 (QREFELT % 109)))
              (LETT |dummy_s| (SPADCALL (QREFELT % 110)))
              (LETT |xd| (SPADCALL |dummy_s| (QREFELT % 111)))
              (LETT |ss| (SPADCALL (|spadConstant| % 84) |x| (QREFELT % 316)))
              (LETT |sb| (SPADCALL |dummy_s| |ss| (QREFELT % 318)))
              (EXIT
               (SPADCALL
                (SPADCALL
                 (SPADCALL (SPADCALL |xd| (QREFELT % 242))
                           (SPADCALL |xd|
                                     (SPADCALL |a| (|spadConstant| % 88)
                                               (QREFELT % 122))
                                     (QREFELT % 146))
                           (QREFELT % 114))
                 (SPADCALL
                  (SPADCALL (|spadConstant| % 88) |xd| (QREFELT % 122))
                  (SPADCALL |b| (|spadConstant| % 88) (QREFELT % 122))
                  (QREFELT % 146))
                 (QREFELT % 114))
                |sb| (QREFELT % 320)))))) 

(SDEFUN |FSPECF;eBeta3Grad3| ((|l| (|List| F)) (% (F)))
        (SPROG
         ((|sb| (|SegmentBinding| F)) (|ss| (|Segment| F)) (|xd| (F))
          (|dummy_s| (|Symbol|)) (|b| (F)) (|a| (F)) (|x| (F)))
         (SEQ (LETT |x| (SPADCALL |l| 1 (QREFELT % 109)))
              (LETT |a| (SPADCALL |l| 2 (QREFELT % 109)))
              (LETT |b| (SPADCALL |l| 3 (QREFELT % 109)))
              (LETT |dummy_s| (SPADCALL (QREFELT % 110)))
              (LETT |xd| (SPADCALL |dummy_s| (QREFELT % 111)))
              (LETT |ss| (SPADCALL (|spadConstant| % 84) |x| (QREFELT % 316)))
              (LETT |sb| (SPADCALL |dummy_s| |ss| (QREFELT % 318)))
              (EXIT
               (SPADCALL
                (SPADCALL
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (|spadConstant| % 88) |xd| (QREFELT % 122))
                   (QREFELT % 242))
                  (SPADCALL |xd|
                            (SPADCALL |a| (|spadConstant| % 88)
                                      (QREFELT % 122))
                            (QREFELT % 146))
                  (QREFELT % 114))
                 (SPADCALL
                  (SPADCALL (|spadConstant| % 88) |xd| (QREFELT % 122))
                  (SPADCALL |b| (|spadConstant| % 88) (QREFELT % 122))
                  (QREFELT % 146))
                 (QREFELT % 114))
                |sb| (QREFELT % 320)))))) 

(SDEFUN |FSPECF;inBeta3| ((|li| (|List| (|InputForm|))) (% (|InputForm|)))
        (SPADCALL (CONS (SPADCALL '|Beta| (QREFELT % 185)) |li|)
                  (QREFELT % 186))) 

(SDEFUN |FSPECF;iGamma2| ((|l| (|List| F)) (|t| (|Symbol|)) (% (F)))
        (SPROG ((|x| (F)) (|a| (F)))
               (SEQ (LETT |a| (|SPADfirst| |l|))
                    (LETT |x| (SPADCALL |l| (QREFELT % 245)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL (SPADCALL |a| |t| (QREFELT % 112))
                                (|FSPECF;diff1| (QREFELT % 22) |a| |x| %)
                                (QREFELT % 114))
                      (SPADCALL
                       (SPADCALL (SPADCALL |x| |t| (QREFELT % 112))
                                 (SPADCALL |x|
                                           (SPADCALL |a| (|spadConstant| % 88)
                                                     (QREFELT % 122))
                                           (QREFELT % 146))
                                 (QREFELT % 114))
                       (SPADCALL (SPADCALL |x| (QREFELT % 124))
                                 (QREFELT % 240))
                       (QREFELT % 114))
                      (QREFELT % 122)))))) 

(SDEFUN |FSPECF;inGamma2| ((|li| (|List| (|InputForm|))) (% (|InputForm|)))
        (SPADCALL (CONS (SPADCALL '|Gamma| (QREFELT % 185)) |li|)
                  (QREFELT % 186))) 

(SDEFUN |FSPECF;dLambertW| ((|x| (F)) (% (F)))
        (SPROG ((|lw| (F)))
               (SEQ (LETT |lw| (SPADCALL |x| (QREFELT % 77)))
                    (EXIT
                     (SPADCALL |lw|
                               (SPADCALL |x|
                                         (SPADCALL (|spadConstant| % 88) |lw|
                                                   (QREFELT % 115))
                                         (QREFELT % 114))
                               (QREFELT % 123)))))) 

(SDEFUN |FSPECF;iWeierstrassPGrad1| ((|l| (|List| F)) (% (F)))
        (SPROG ((|wp| (F)) (|delta| (F)) (|x| (F)) (|g3| (F)) (|g2| (F)))
               (SEQ (LETT |g2| (|SPADfirst| |l|))
                    (LETT |g3| (SPADCALL |l| (QREFELT % 245)))
                    (LETT |x| (SPADCALL |l| (QREFELT % 310)))
                    (LETT |delta|
                          (SPADCALL (SPADCALL |g2| 3 (QREFELT % 121))
                                    (SPADCALL 27
                                              (SPADCALL |g3| 2 (QREFELT % 121))
                                              (QREFELT % 106))
                                    (QREFELT % 122)))
                    (LETT |wp| (SPADCALL |g2| |g3| |x| (QREFELT % 79)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (SPADCALL |g2| |g3| |x| (QREFELT % 80))
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL 9 (QREFELT % 101)
                                                 (QREFELT % 106))
                                       |g3| (QREFELT % 114))
                                      (SPADCALL |g2| |g3| |x| (QREFELT % 82))
                                      (QREFELT % 114))
                                     (QREFELT % 124))
                                    (SPADCALL
                                     (SPADCALL (QREFELT % 103)
                                               (SPADCALL |g2| 2
                                                         (QREFELT % 121))
                                               (QREFELT % 114))
                                     |x| (QREFELT % 114))
                                    (QREFELT % 115))
                                   (QREFELT % 114))
                         (SPADCALL (SPADCALL 9 |g3| (QREFELT % 106))
                                   (SPADCALL |wp| 2 (QREFELT % 121))
                                   (QREFELT % 114))
                         (QREFELT % 122))
                        (SPADCALL
                         (SPADCALL (QREFELT % 101)
                                   (SPADCALL |g2| 2 (QREFELT % 121))
                                   (QREFELT % 114))
                         |wp| (QREFELT % 114))
                        (QREFELT % 115))
                       (SPADCALL
                        (SPADCALL (SPADCALL 3 (QREFELT % 101) (QREFELT % 106))
                                  |g2| (QREFELT % 114))
                        |g3| (QREFELT % 114))
                       (QREFELT % 115))
                      |delta| (QREFELT % 123)))))) 

(SDEFUN |FSPECF;iWeierstrassPGrad2| ((|l| (|List| F)) (% (F)))
        (SPROG ((|wp| (F)) (|delta| (F)) (|x| (F)) (|g3| (F)) (|g2| (F)))
               (SEQ (LETT |g2| (|SPADfirst| |l|))
                    (LETT |g3| (SPADCALL |l| (QREFELT % 245)))
                    (LETT |x| (SPADCALL |l| (QREFELT % 310)))
                    (LETT |delta|
                          (SPADCALL (SPADCALL |g2| 3 (QREFELT % 121))
                                    (SPADCALL 27
                                              (SPADCALL |g3| 2 (QREFELT % 121))
                                              (QREFELT % 106))
                                    (QREFELT % 122)))
                    (LETT |wp| (SPADCALL |g2| |g3| |x| (QREFELT % 79)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (SPADCALL |g2| |g3| |x| (QREFELT % 80))
                                   (SPADCALL
                                    (SPADCALL (SPADCALL 3 |g2| (QREFELT % 106))
                                              (SPADCALL |g2| |g3| |x|
                                                        (QREFELT % 82))
                                              (QREFELT % 114))
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL 9 (QREFELT % 101)
                                                (QREFELT % 106))
                                      |g3| (QREFELT % 114))
                                     |x| (QREFELT % 114))
                                    (QREFELT % 122))
                                   (QREFELT % 114))
                         (SPADCALL (SPADCALL 6 |g2| (QREFELT % 106))
                                   (SPADCALL |wp| 2 (QREFELT % 121))
                                   (QREFELT % 114))
                         (QREFELT % 115))
                        (SPADCALL (SPADCALL 9 |g3| (QREFELT % 106)) |wp|
                                  (QREFELT % 114))
                        (QREFELT % 122))
                       (SPADCALL |g2| 2 (QREFELT % 121)) (QREFELT % 122))
                      |delta| (QREFELT % 123)))))) 

(SDEFUN |FSPECF;iWeierstrassPGrad3| ((|l| (|List| F)) (% (F)))
        (SPADCALL (|SPADfirst| |l|) (SPADCALL |l| (QREFELT % 245))
                  (SPADCALL |l| (QREFELT % 310)) (QREFELT % 80))) 

(SDEFUN |FSPECF;iWeierstrassPPrimeGrad1| ((|l| (|List| F)) (% (F)))
        (SPROG
         ((|wpp2| (F)) (|wpp| (F)) (|wp| (F)) (|delta| (F)) (|x| (F))
          (|g3| (F)) (|g2| (F)))
         (SEQ (LETT |g2| (|SPADfirst| |l|))
              (LETT |g3| (SPADCALL |l| (QREFELT % 245)))
              (LETT |x| (SPADCALL |l| (QREFELT % 310)))
              (LETT |delta|
                    (SPADCALL (SPADCALL |g2| 3 (QREFELT % 121))
                              (SPADCALL 27 (SPADCALL |g3| 2 (QREFELT % 121))
                                        (QREFELT % 106))
                              (QREFELT % 122)))
              (LETT |wp| (SPADCALL |g2| |g3| |x| (QREFELT % 79)))
              (LETT |wpp| (SPADCALL |g2| |g3| |x| (QREFELT % 80)))
              (LETT |wpp2|
                    (SPADCALL
                     (SPADCALL 6 (SPADCALL |wp| 2 (QREFELT % 121))
                               (QREFELT % 106))
                     (SPADCALL (QREFELT % 101) |g2| (QREFELT % 114))
                     (QREFELT % 122)))
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
                                 (SPADCALL 9 (QREFELT % 101) (QREFELT % 106))
                                 |g3| (QREFELT % 114))
                                (SPADCALL |g2| |g3| |x| (QREFELT % 82))
                                (QREFELT % 114))
                               (QREFELT % 124))
                              (SPADCALL
                               (SPADCALL (QREFELT % 103)
                                         (SPADCALL |g2| 2 (QREFELT % 121))
                                         (QREFELT % 114))
                               |x| (QREFELT % 114))
                              (QREFELT % 115))
                             (QREFELT % 114))
                   (SPADCALL |wpp|
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL 9 (QREFELT % 101) (QREFELT % 106))
                                |g3| (QREFELT % 114))
                               |wp| (QREFELT % 114))
                              (SPADCALL (QREFELT % 103)
                                        (SPADCALL |g2| 2 (QREFELT % 121))
                                        (QREFELT % 114))
                              (QREFELT % 115))
                             (QREFELT % 114))
                   (QREFELT % 115))
                  (SPADCALL
                   (SPADCALL (SPADCALL 18 |g3| (QREFELT % 106)) |wp|
                             (QREFELT % 114))
                   |wpp| (QREFELT % 114))
                  (QREFELT % 122))
                 (SPADCALL
                  (SPADCALL (QREFELT % 101) (SPADCALL |g2| 2 (QREFELT % 121))
                            (QREFELT % 114))
                  |wpp| (QREFELT % 114))
                 (QREFELT % 115))
                |delta| (QREFELT % 123)))))) 

(SDEFUN |FSPECF;iWeierstrassPPrimeGrad2| ((|l| (|List| F)) (% (F)))
        (SPROG
         ((|wpp2| (F)) (|wpp| (F)) (|wp| (F)) (|delta| (F)) (|x| (F))
          (|g3| (F)) (|g2| (F)))
         (SEQ (LETT |g2| (|SPADfirst| |l|))
              (LETT |g3| (SPADCALL |l| (QREFELT % 245)))
              (LETT |x| (SPADCALL |l| (QREFELT % 310)))
              (LETT |delta|
                    (SPADCALL (SPADCALL |g2| 3 (QREFELT % 121))
                              (SPADCALL 27 (SPADCALL |g3| 2 (QREFELT % 121))
                                        (QREFELT % 106))
                              (QREFELT % 122)))
              (LETT |wp| (SPADCALL |g2| |g3| |x| (QREFELT % 79)))
              (LETT |wpp| (SPADCALL |g2| |g3| |x| (QREFELT % 80)))
              (LETT |wpp2|
                    (SPADCALL
                     (SPADCALL 6 (SPADCALL |wp| 2 (QREFELT % 121))
                               (QREFELT % 106))
                     (SPADCALL (QREFELT % 101) |g2| (QREFELT % 114))
                     (QREFELT % 122)))
              (EXIT
               (SPADCALL
                (SPADCALL
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL |wpp2|
                             (SPADCALL
                              (SPADCALL (SPADCALL 3 |g2| (QREFELT % 106))
                                        (SPADCALL |g2| |g3| |x| (QREFELT % 82))
                                        (QREFELT % 114))
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL 9 (QREFELT % 101) (QREFELT % 106))
                                |g3| (QREFELT % 114))
                               |x| (QREFELT % 114))
                              (QREFELT % 122))
                             (QREFELT % 114))
                   (SPADCALL |wpp|
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL (SPADCALL 3 |g2| (QREFELT % 106)) |wp|
                                         (QREFELT % 114))
                               (QREFELT % 124))
                              (SPADCALL
                               (SPADCALL 9 (QREFELT % 101) (QREFELT % 106))
                               |g3| (QREFELT % 114))
                              (QREFELT % 122))
                             (QREFELT % 114))
                   (QREFELT % 115))
                  (SPADCALL
                   (SPADCALL (SPADCALL 12 |g2| (QREFELT % 106)) |wp|
                             (QREFELT % 114))
                   |wpp| (QREFELT % 114))
                  (QREFELT % 115))
                 (SPADCALL (SPADCALL 9 |g3| (QREFELT % 106)) |wpp|
                           (QREFELT % 114))
                 (QREFELT % 122))
                |delta| (QREFELT % 123)))))) 

(SDEFUN |FSPECF;iWeierstrassPPrimeGrad3| ((|l| (|List| F)) (% (F)))
        (SPROG ((|g2| (F)))
               (SEQ (LETT |g2| (|SPADfirst| |l|))
                    (EXIT
                     (SPADCALL
                      (SPADCALL 6
                                (SPADCALL
                                 (SPADCALL |g2| (SPADCALL |l| (QREFELT % 245))
                                           (SPADCALL |l| (QREFELT % 310))
                                           (QREFELT % 79))
                                 2 (QREFELT % 142))
                                (QREFELT % 106))
                      (SPADCALL (QREFELT % 101) |g2| (QREFELT % 114))
                      (QREFELT % 122)))))) 

(SDEFUN |FSPECF;iWeierstrassSigmaGrad1| ((|l| (|List| F)) (% (F)))
        (SPROG
         ((|wsp2| (F)) (|wsp| (F)) (|wz| (F)) (|ws| (F)) (|delta| (F))
          (|x| (F)) (|g3| (F)) (|g2| (F)))
         (SEQ (LETT |g2| (|SPADfirst| |l|))
              (LETT |g3| (SPADCALL |l| (QREFELT % 245)))
              (LETT |x| (SPADCALL |l| (QREFELT % 310)))
              (LETT |delta|
                    (SPADCALL (SPADCALL |g2| 3 (QREFELT % 121))
                              (SPADCALL 27 (SPADCALL |g3| 2 (QREFELT % 121))
                                        (QREFELT % 106))
                              (QREFELT % 122)))
              (LETT |ws| (SPADCALL |g2| |g3| |x| (QREFELT % 81)))
              (LETT |wz| (SPADCALL |g2| |g3| |x| (QREFELT % 82)))
              (LETT |wsp| (SPADCALL |wz| |ws| (QREFELT % 114)))
              (LETT |wsp2|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (SPADCALL |g2| |g3| |x| (QREFELT % 79)) |ws|
                                (QREFELT % 114))
                      (QREFELT % 124))
                     (SPADCALL (SPADCALL |wz| 2 (QREFELT % 121)) |ws|
                               (QREFELT % 114))
                     (QREFELT % 115)))
              (EXIT
               (SPADCALL
                (SPADCALL (QREFELT % 103)
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (SPADCALL 9 |g3| (QREFELT % 106))
                                        |wsp2| (QREFELT % 114))
                              (QREFELT % 124))
                             (SPADCALL (SPADCALL |g2| 2 (QREFELT % 121)) |ws|
                                       (QREFELT % 114))
                             (QREFELT % 122))
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL 3 (QREFELT % 103) (QREFELT % 106))
                                |g2| (QREFELT % 114))
                               |g3| (QREFELT % 114))
                              (SPADCALL |x| 2 (QREFELT % 121)) (QREFELT % 114))
                             |ws| (QREFELT % 114))
                            (QREFELT % 122))
                           (SPADCALL
                            (SPADCALL (SPADCALL |g2| 2 (QREFELT % 121)) |x|
                                      (QREFELT % 114))
                            |wsp| (QREFELT % 114))
                           (QREFELT % 115))
                          (QREFELT % 114))
                |delta| (QREFELT % 123)))))) 

(SDEFUN |FSPECF;iWeierstrassSigmaGrad2| ((|l| (|List| F)) (% (F)))
        (SPROG
         ((|wsp2| (F)) (|wsp| (F)) (|wz| (F)) (|ws| (F)) (|delta| (F))
          (|x| (F)) (|g3| (F)) (|g2| (F)))
         (SEQ (LETT |g2| (|SPADfirst| |l|))
              (LETT |g3| (SPADCALL |l| (QREFELT % 245)))
              (LETT |x| (SPADCALL |l| (QREFELT % 310)))
              (LETT |delta|
                    (SPADCALL (SPADCALL |g2| 3 (QREFELT % 121))
                              (SPADCALL 27 (SPADCALL |g3| 2 (QREFELT % 121))
                                        (QREFELT % 106))
                              (QREFELT % 122)))
              (LETT |ws| (SPADCALL |g2| |g3| |x| (QREFELT % 81)))
              (LETT |wz| (SPADCALL |g2| |g3| |x| (QREFELT % 82)))
              (LETT |wsp| (SPADCALL |wz| |ws| (QREFELT % 114)))
              (LETT |wsp2|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (SPADCALL |g2| |g3| |x| (QREFELT % 79)) |ws|
                                (QREFELT % 114))
                      (QREFELT % 124))
                     (SPADCALL (SPADCALL |wz| 2 (QREFELT % 121)) |ws|
                               (QREFELT % 114))
                     (QREFELT % 115)))
              (EXIT
               (SPADCALL
                (SPADCALL (QREFELT % 101)
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (SPADCALL 3 |g2| (QREFELT % 106)) |wsp2|
                                       (QREFELT % 114))
                             (SPADCALL (SPADCALL 9 |g3| (QREFELT % 106)) |ws|
                                       (QREFELT % 114))
                             (QREFELT % 115))
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (QREFELT % 103)
                                        (SPADCALL |g2| 2 (QREFELT % 121))
                                        (QREFELT % 114))
                              (SPADCALL |x| 2 (QREFELT % 121)) (QREFELT % 114))
                             |ws| (QREFELT % 114))
                            (QREFELT % 115))
                           (SPADCALL
                            (SPADCALL (SPADCALL 9 |g3| (QREFELT % 106)) |x|
                                      (QREFELT % 114))
                            |wsp| (QREFELT % 114))
                           (QREFELT % 122))
                          (QREFELT % 114))
                |delta| (QREFELT % 123)))))) 

(SDEFUN |FSPECF;iWeierstrassSigmaGrad3| ((|l| (|List| F)) (% (F)))
        (SPROG ((|x| (F)) (|g3| (F)) (|g2| (F)))
               (SEQ (LETT |g2| (|SPADfirst| |l|))
                    (LETT |g3| (SPADCALL |l| (QREFELT % 245)))
                    (LETT |x| (SPADCALL |l| (QREFELT % 310)))
                    (EXIT
                     (SPADCALL (SPADCALL |g2| |g3| |x| (QREFELT % 82))
                               (SPADCALL |g2| |g3| |x| (QREFELT % 81))
                               (QREFELT % 114)))))) 

(SDEFUN |FSPECF;iWeierstrassZetaGrad1| ((|l| (|List| F)) (% (F)))
        (SPROG ((|wp| (F)) (|delta| (F)) (|x| (F)) (|g3| (F)) (|g2| (F)))
               (SEQ (LETT |g2| (|SPADfirst| |l|))
                    (LETT |g3| (SPADCALL |l| (QREFELT % 245)))
                    (LETT |x| (SPADCALL |l| (QREFELT % 310)))
                    (LETT |delta|
                          (SPADCALL (SPADCALL |g2| 3 (QREFELT % 121))
                                    (SPADCALL 27
                                              (SPADCALL |g3| 2 (QREFELT % 121))
                                              (QREFELT % 106))
                                    (QREFELT % 122)))
                    (LETT |wp| (SPADCALL |g2| |g3| |x| (QREFELT % 79)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (QREFELT % 101)
                                   (SPADCALL |g2| |g3| |x| (QREFELT % 82))
                                   (QREFELT % 114))
                         (SPADCALL
                          (SPADCALL (SPADCALL 9 |g3| (QREFELT % 106)) |wp|
                                    (QREFELT % 114))
                          (SPADCALL (QREFELT % 101)
                                    (SPADCALL |g2| 2 (QREFELT % 121))
                                    (QREFELT % 114))
                          (QREFELT % 115))
                         (QREFELT % 114))
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (QREFELT % 101) |g2| (QREFELT % 114)) |x|
                          (QREFELT % 114))
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (QREFELT % 101) |g2| (QREFELT % 114)) |wp|
                           (QREFELT % 114))
                          (SPADCALL
                           (SPADCALL 3 (QREFELT % 103) (QREFELT % 106)) |g3|
                           (QREFELT % 114))
                          (QREFELT % 115))
                         (QREFELT % 114))
                        (QREFELT % 122))
                       (SPADCALL
                        (SPADCALL (SPADCALL 9 (QREFELT % 103) (QREFELT % 106))
                                  |g3| (QREFELT % 114))
                        (SPADCALL |g2| |g3| |x| (QREFELT % 80))
                        (QREFELT % 114))
                       (QREFELT % 115))
                      |delta| (QREFELT % 123)))))) 

(SDEFUN |FSPECF;iWeierstrassZetaGrad2| ((|l| (|List| F)) (% (F)))
        (SPROG ((|wp| (F)) (|delta| (F)) (|x| (F)) (|g3| (F)) (|g2| (F)))
               (SEQ (LETT |g2| (|SPADfirst| |l|))
                    (LETT |g3| (SPADCALL |l| (QREFELT % 245)))
                    (LETT |x| (SPADCALL |l| (QREFELT % 310)))
                    (LETT |delta|
                          (SPADCALL (SPADCALL |g2| 3 (QREFELT % 121))
                                    (SPADCALL 27
                                              (SPADCALL |g3| 2 (QREFELT % 121))
                                              (QREFELT % 106))
                                    (QREFELT % 122)))
                    (LETT |wp| (SPADCALL |g2| |g3| |x| (QREFELT % 79)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL 3 (SPADCALL |g2| |g3| |x| (QREFELT % 82))
                                    (QREFELT % 106))
                          (SPADCALL (SPADCALL |g2| |wp| (QREFELT % 114))
                                    (SPADCALL
                                     (SPADCALL 3 (QREFELT % 101)
                                               (QREFELT % 106))
                                     |g3| (QREFELT % 114))
                                    (QREFELT % 115))
                          (QREFELT % 114))
                         (QREFELT % 124))
                        (SPADCALL
                         (SPADCALL (QREFELT % 101) |x| (QREFELT % 114))
                         (SPADCALL
                          (SPADCALL (SPADCALL 9 |g3| (QREFELT % 106)) |wp|
                                    (QREFELT % 114))
                          (SPADCALL (QREFELT % 101)
                                    (SPADCALL |g2| 2 (QREFELT % 121))
                                    (QREFELT % 114))
                          (QREFELT % 115))
                         (QREFELT % 114))
                        (QREFELT % 115))
                       (SPADCALL
                        (SPADCALL (SPADCALL 3 (QREFELT % 101) (QREFELT % 106))
                                  |g2| (QREFELT % 114))
                        (SPADCALL |g2| |g3| |x| (QREFELT % 80))
                        (QREFELT % 114))
                       (QREFELT % 122))
                      |delta| (QREFELT % 123)))))) 

(SDEFUN |FSPECF;iWeierstrassZetaGrad3| ((|l| (|List| F)) (% (F)))
        (SPADCALL
         (SPADCALL (|SPADfirst| |l|) (SPADCALL |l| (QREFELT % 245))
                   (SPADCALL |l| (QREFELT % 310)) (QREFELT % 79))
         (QREFELT % 124))) 

(SDEFUN |FSPECF;dconjugate| ((|lo| (|List| (|OutputForm|))) (% (|OutputForm|)))
        (SPADCALL (SPADCALL |lo| 1 (QREFELT % 323)) (QREFELT % 324))) 

(SDEFUN |FSPECF;get_int_listf| ((|lf| (|List| F)) (% (|List| (|Integer|))))
        (SPADCALL (ELT % 327) |lf| (QREFELT % 331))) 

(SDEFUN |FSPECF;replace_i|
        ((|lp| (|List| F)) (|v| (F)) (|i| (|NonNegativeInteger|))
         (% (|List| F)))
        (SPROG ((#1=#:G1149 NIL))
               (SPADCALL
                (SPADCALL |lp|
                          (PROG1 (LETT #1# (- |i| 1))
                            (|check_subtype2| (>= #1# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #1#))
                          (QREFELT % 332))
                (CONS |v| (SPADCALL |lp| |i| (QREFELT % 333))) (QREFELT % 92)))) 

(SDEFUN |FSPECF;iiHypergeometricF;LF;315| ((|l| (|List| F)) (% (F)))
        (SPROG
         ((#1=#:G1155 NIL) (#2=#:G1156 NIL) (|q| #3=(|Integer|)) (|p| #3#)
          (|pqi| (|List| (|Integer|))) (|pq| (|List| F))
          (|nn| (|NonNegativeInteger|)) (#4=#:G1151 NIL) (|z| (F))
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (LENGTH |l|))
                (LETT |z| (SPADCALL |l| (- |n| 2) (QREFELT % 109)))
                (COND
                 ((SPADCALL |z| (|spadConstant| % 84) (QREFELT % 86))
                  (SEQ
                   (EXIT
                    (SEQ
                     (LETT |nn|
                           (PROG1 (LETT #4# (- |n| 2))
                             (|check_subtype2| (>= #4# 0)
                                               '(|NonNegativeInteger|)
                                               '(|Integer|) #4#)))
                     (LETT |pq| (SPADCALL |l| |nn| (QREFELT % 333)))
                     (LETT |pqi| (|FSPECF;get_int_listf| |pq| %))
                     (LETT |p| (|SPADfirst| |pqi|))
                     (LETT |q| (|SPADfirst| (CDR |pqi|)))
                     (EXIT
                      (COND
                       ((<= |p| (+ |q| 1))
                        (PROGN
                         (LETT #1#
                               (PROGN
                                (LETT #2# (|spadConstant| % 88))
                                (GO #5=#:G1154)))
                         (GO #6=#:G1152)))))))
                   #6# (EXIT #1#))))
                (EXIT (SPADCALL (QREFELT % 41) |l| (QREFELT % 113)))))
          #5# (EXIT #2#)))) 

(SDEFUN |FSPECF;idvsum|
        ((|op| (|BasicOperator|)) (|n| (|Integer|)) (|l| (|List| F))
         (|x| (|Symbol|)) (% (F)))
        (SPROG
         ((|res| (F)) (|nl| (|List| F)) (|dm| (F)) (#1=#:G1164 NIL) (|i| NIL)
          (#2=#:G1165 NIL) (|a| NIL))
         (SEQ (LETT |res| (|spadConstant| % 84))
              (SEQ (LETT |a| NIL) (LETT #2# |l|) (LETT |i| 1) (LETT #1# |n|)
                   G190
                   (COND
                    ((OR (|greater_SI| |i| #1#) (ATOM #2#)
                         (PROGN (LETT |a| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |dm|
                          (SPADCALL (SPADCALL (QREFELT % 110))
                                    (QREFELT % 111)))
                    (LETT |nl| (|FSPECF;replace_i| |l| |dm| |i| %))
                    (EXIT
                     (LETT |res|
                           (SPADCALL |res|
                                     (SPADCALL
                                      (SPADCALL |a| |x| (QREFELT % 112))
                                      (SPADCALL (QREFELT % 98)
                                                (LIST
                                                 (SPADCALL |op| |nl|
                                                           (QREFELT % 94))
                                                 |dm| |a|)
                                                (QREFELT % 113))
                                      (QREFELT % 114))
                                     (QREFELT % 115)))))
                   (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #2# (CDR #2#))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |FSPECF;dvhypergeom| ((|l| #1=(|List| F)) (|x| (|Symbol|)) (% (F)))
        (SPROG
         ((|aprod| (F)) (|nl| (|List| F)) (|nl1| (|List| F)) (|nl0| (|List| F))
          (|bprod| (F)) (|b| (F)) (#2=#:G1176 NIL) (|i| NIL) (|a| (F))
          (#3=#:G1175 NIL) (|q| #4=(|Integer|)) (|p| #4#) (|z| (F))
          (|l1| (|List| F)) (|ol| #1#) (|pqi| (|List| (|Integer|)))
          (|pq| (|List| F)) (|nn| (|NonNegativeInteger|)) (#5=#:G1166 NIL)
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (LENGTH |l|))
              (LETT |nn|
                    (PROG1 (LETT #5# (- |n| 2))
                      (|check_subtype2| (>= #5# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #5#)))
              (LETT |pq| (SPADCALL |l| |nn| (QREFELT % 333)))
              (LETT |pqi| (|FSPECF;get_int_listf| |pq| %)) (LETT |ol| |l|)
              (LETT |l| (SPADCALL |l| |nn| (QREFELT % 332)))
              (LETT |l1| (REVERSE |l|)) (LETT |z| (|SPADfirst| |l1|))
              (LETT |p| (|SPADfirst| |pqi|))
              (LETT |q| (|SPADfirst| (CDR |pqi|)))
              (LETT |aprod| (|spadConstant| % 88)) (LETT |nl| NIL)
              (SEQ (LETT |i| 1) (LETT #3# |p|) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ (LETT |a| (|SPADfirst| |l|))
                        (LETT |nl|
                              (CONS
                               (SPADCALL |a| (|spadConstant| % 88)
                                         (QREFELT % 115))
                               |nl|))
                        (LETT |aprod| (SPADCALL |aprod| |a| (QREFELT % 114)))
                        (EXIT (LETT |l| (CDR |l|))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |bprod| (|spadConstant| % 88))
              (SEQ (LETT |i| 1) (LETT #2# |q|) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ (LETT |b| (|SPADfirst| |l|))
                        (LETT |nl|
                              (CONS
                               (SPADCALL |b| (|spadConstant| % 88)
                                         (QREFELT % 115))
                               |nl|))
                        (LETT |bprod| (SPADCALL |bprod| |b| (QREFELT % 114)))
                        (EXIT (LETT |l| (CDR |l|))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |nl0| (NREVERSE |nl|)) (LETT |nl1| (CONS |z| |pq|))
              (LETT |nl| (SPADCALL |nl0| |nl1| (QREFELT % 92)))
              (LETT |aprod| (SPADCALL |aprod| |bprod| (QREFELT % 123)))
              (EXIT
               (SPADCALL (|FSPECF;idvsum| (QREFELT % 41) (- |nn| 1) |ol| |x| %)
                         (SPADCALL
                          (SPADCALL (SPADCALL |z| |x| (QREFELT % 112)) |aprod|
                                    (QREFELT % 114))
                          (SPADCALL (QREFELT % 41) |nl| (QREFELT % 94))
                          (QREFELT % 114))
                         (QREFELT % 115)))))) 

(SDEFUN |FSPECF;add_pairs_to_list|
        ((|lp| (|List| (|List| F))) (|l| (|List| F)) (% (|List| F)))
        (SPROG ((#1=#:G1182 NIL) (|p| NIL))
               (SEQ
                (SEQ (LETT |p| NIL) (LETT #1# |lp|) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL (LENGTH |p|) 2 (QREFELT % 334))
                         (|error| "not a list of pairs"))
                        ('T
                         (LETT |l|
                               (CONS (SPADCALL |p| 2 (QREFELT % 109))
                                     (CONS (SPADCALL |p| 1 (QREFELT % 109))
                                           |l|)))))))
                     (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                (EXIT |l|)))) 

(SDEFUN |FSPECF;dvmeijer| ((|l| #1=(|List| F)) (|x| (|Symbol|)) (% (F)))
        (SPROG
         ((|om| (F)) (|nm| (F)) (|l2| (|List| F)) (|sign| (F)) (|na| (F))
          (|a| (F)) (|n2| (|Integer|)) (|n1| (|Integer|)) (|z| (F))
          (|l1| (|List| F)) (|nli| (|List| (|Integer|))) (|nl| (|List| F))
          (|l0| #1#) (|nn| (|NonNegativeInteger|)) (#2=#:G1183 NIL)
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (LENGTH |l|))
              (LETT |nn|
                    (PROG1 (LETT #2# (- |n| 4))
                      (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #2#)))
              (LETT |l0| |l|) (LETT |nl| (SPADCALL |l| |nn| (QREFELT % 333)))
              (LETT |nli| (|FSPECF;get_int_listf| |nl| %))
              (LETT |l| (SPADCALL |l| |nn| (QREFELT % 332)))
              (LETT |l1| (REVERSE |l|)) (LETT |z| (|SPADfirst| |l1|))
              (LETT |n1| (|SPADfirst| |nli|))
              (LETT |n2| (SPADCALL |nli| 2 (QREFELT % 335)))
              (LETT |a| (|SPADfirst| |l|)) (LETT |sign| (|spadConstant| % 88))
              (COND
               ((OR (> |n1| 0) (> |n2| 0))
                (SEQ
                 (LETT |na|
                       (SPADCALL |a| (|spadConstant| % 88) (QREFELT % 122)))
                 (COND
                  ((EQL |n1| 0)
                   (LETT |sign|
                         (SPADCALL (|spadConstant| % 88) (QREFELT % 124)))))
                 (EXIT (LETT |l2| (CONS |na| (CDR |l|))))))
               ('T
                (SEQ (LETT |na| |a|)
                     (COND
                      ((> (SPADCALL |nli| 3 (QREFELT % 335)) 0)
                       (LETT |sign|
                             (SPADCALL (|spadConstant| % 88)
                                       (QREFELT % 124)))))
                     (EXIT
                      (LETT |l2|
                            (CONS
                             (SPADCALL |a| (|spadConstant| % 88)
                                       (QREFELT % 115))
                             (CDR |l|)))))))
              (LETT |nm|
                    (SPADCALL (QREFELT % 42)
                              (SPADCALL |l2| |nl| (QREFELT % 92))
                              (QREFELT % 94)))
              (LETT |om| (SPADCALL (QREFELT % 42) |l0| (QREFELT % 94)))
              (EXIT
               (SPADCALL (|FSPECF;idvsum| (QREFELT % 42) (- |nn| 1) |l0| |x| %)
                         (SPADCALL
                          (SPADCALL (SPADCALL |z| |x| (QREFELT % 112))
                                    (SPADCALL
                                     (SPADCALL |sign| |nm| (QREFELT % 114))
                                     (SPADCALL |na| |om| (QREFELT % 114))
                                     (QREFELT % 115))
                                    (QREFELT % 114))
                          |z| (QREFELT % 123))
                         (QREFELT % 115)))))) 

(SDEFUN |FSPECF;get_if_list|
        ((|n| (|Integer|)) (|lf| (|List| (|InputForm|)))
         (% (|List| (|List| (|InputForm|)))))
        (SPROG ((|a| (|List| (|InputForm|))) (#1=#:G1196 NIL) (|i| NIL))
               (SEQ (LETT |a| NIL)
                    (SEQ (LETT |i| 1) (LETT #1# |n|) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ (LETT |a| (CONS (|SPADfirst| |lf|) |a|))
                              (EXIT (LETT |lf| (CDR |lf|))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (LETT |a|
                          (CONS (SPADCALL '|construct| (QREFELT % 185))
                                (NREVERSE |a|)))
                    (EXIT (LIST |a| |lf|))))) 

(SDEFUN |FSPECF;get_if_lists|
        ((|ln| (|List| (|Integer|))) (|lf| (|List| (|InputForm|)))
         (% (|List| (|List| (|InputForm|)))))
        (SPROG
         ((|rl| (|List| (|List| (|InputForm|))))
          (|al| (|List| (|List| (|InputForm|)))) (#1=#:G1202 NIL) (|n| NIL))
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
         ((|rl| (|List| (|Integer|))) (|p| (|Integer|)) (#1=#:G1209 NIL)
          (|i| NIL) (|n0| (|NonNegativeInteger|)) (#2=#:G1203 NIL))
         (SEQ
          (LETT |n0|
                (PROG1 (LETT #2# (- (LENGTH |lo|) |n|))
                  (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #2#)))
          (LETT |lo| (SPADCALL |lo| |n0| (QREFELT % 337))) (LETT |rl| NIL)
          (SEQ (LETT |i| 1) (LETT #1# |n|) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ (LETT |p| (SPADCALL (|SPADfirst| |lo|) (QREFELT % 339)))
                    (LETT |rl| (CONS |p| |rl|)) (EXIT (LETT |lo| (CDR |lo|))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (LETT |rl| (NREVERSE |rl|)) (EXIT |rl|)))) 

(SDEFUN |FSPECF;get_of_list|
        ((|n| (|Integer|)) (|lo| (|List| (|OutputForm|)))
         (% (|List| (|List| (|OutputForm|)))))
        (SPROG ((|a| (|List| (|OutputForm|))) (#1=#:G1215 NIL) (|i| NIL))
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
          (|al| (|List| (|List| (|OutputForm|)))) (#1=#:G1221 NIL) (|n| NIL))
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
         ((|rl| (|List| (|Integer|))) (|p| (|Integer|)) (#1=#:G1228 NIL)
          (|i| NIL) (|n0| (|NonNegativeInteger|)) (#2=#:G1222 NIL))
         (SEQ
          (LETT |n0|
                (PROG1 (LETT #2# (- (LENGTH |lo|) |n|))
                  (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #2#)))
          (LETT |lo| (SPADCALL |lo| |n0| (QREFELT % 340))) (LETT |rl| NIL)
          (SEQ (LETT |i| 1) (LETT #1# |n|) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ (LETT |p| (SPADCALL (|SPADfirst| |lo|) (QREFELT % 339)))
                    (LETT |rl| (CONS |p| |rl|)) (EXIT (LETT |lo| (CDR |lo|))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (LETT |rl| (NREVERSE |rl|)) (EXIT |rl|)))) 

(SDEFUN |FSPECF;dhyper0|
        ((|op| (|OutputForm|)) (|lo| (|List| (|OutputForm|)))
         (% (|OutputForm|)))
        (SPROG
         ((|z| (|OutputForm|)) (|b| #1=(|List| (|OutputForm|))) (|a| #1#)
          (|al| (|List| (|List| (|OutputForm|)))) (|pql| (|List| (|Integer|)))
          (|n0| (|NonNegativeInteger|)) (#2=#:G1229 NIL))
         (SEQ
          (LETT |n0|
                (PROG1 (LETT #2# (- (LENGTH |lo|) 2))
                  (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #2#)))
          (LETT |pql| (|FSPECF;get_int_listo| 2 |lo| %))
          (LETT |lo| (SPADCALL |lo| |n0| (QREFELT % 341)))
          (LETT |al| (|FSPECF;get_of_lists| |pql| |lo| %))
          (LETT |lo| (|SPADfirst| |al|)) (LETT |al| (CDR |al|))
          (LETT |a| (|SPADfirst| |al|)) (LETT |b| (|SPADfirst| (CDR |al|)))
          (LETT |z| (|SPADfirst| |lo|))
          (EXIT
           (SPADCALL |op|
                     (LIST (SPADCALL |a| (QREFELT % 342))
                           (SPADCALL |b| (QREFELT % 342)) |z|)
                     (QREFELT % 343)))))) 

(SDEFUN |FSPECF;dhyper| ((|lo| (|List| (|OutputForm|))) (% (|OutputForm|)))
        (|FSPECF;dhyper0| (SPADCALL '|hypergeometricF| (QREFELT % 344)) |lo| %)) 

(SDEFUN |FSPECF;ddhyper| ((|lo| (|List| (|OutputForm|))) (% (|OutputForm|)))
        (|FSPECF;dhyper0| (|SPADfirst| |lo|) (CDR |lo|) %)) 

(SDEFUN |FSPECF;dmeijer0|
        ((|op| (|OutputForm|)) (|lo| (|List| (|OutputForm|)))
         (% (|OutputForm|)))
        (SPROG
         ((|z| (|OutputForm|)) (|al| (|List| (|List| (|OutputForm|))))
          (|nl| (|List| (|Integer|))) (|n0| (|NonNegativeInteger|))
          (#1=#:G1234 NIL))
         (SEQ
          (LETT |n0|
                (PROG1 (LETT #1# (- (LENGTH |lo|) 4))
                  (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #1#)))
          (LETT |nl| (|FSPECF;get_int_listo| 4 |lo| %))
          (LETT |lo| (SPADCALL |lo| |n0| (QREFELT % 341)))
          (LETT |al| (|FSPECF;get_of_lists| |nl| |lo| %))
          (LETT |lo| (|SPADfirst| |al|)) (LETT |al| (CDR |al|))
          (LETT |z| (|SPADfirst| |lo|))
          (EXIT
           (SPADCALL |op|
                     (SPADCALL (SPADCALL (ELT % 342) |al| (QREFELT % 347))
                               (LIST |z|) (QREFELT % 348))
                     (QREFELT % 343)))))) 

(SDEFUN |FSPECF;dmeijer| ((|lo| (|List| (|OutputForm|))) (% (|OutputForm|)))
        (|FSPECF;dmeijer0| (SPADCALL '|meijerG| (QREFELT % 344)) |lo| %)) 

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
              (LETT |ai| (SPADCALL |a| (QREFELT % 186)))
              (LETT |b| (|SPADfirst| (CDR |al|)))
              (LETT |bi| (SPADCALL |b| (QREFELT % 186)))
              (LETT |zi| (|SPADfirst| |lf|))
              (LETT |li|
                    (LIST (SPADCALL '|hypergeometricF| (QREFELT % 185)) |ai|
                          |bi| |zi|))
              (EXIT (SPADCALL |li| (QREFELT % 186)))))) 

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
              (LETT |ai| (SPADCALL |a| (QREFELT % 186))) (LETT |al| (CDR |al|))
              (LETT |b| (|SPADfirst| |al|))
              (LETT |bi| (SPADCALL |b| (QREFELT % 186))) (LETT |al| (CDR |al|))
              (LETT |c| (|SPADfirst| |al|))
              (LETT |ci| (SPADCALL |c| (QREFELT % 186))) (LETT |al| (CDR |al|))
              (LETT |d| (|SPADfirst| |al|))
              (LETT |di| (SPADCALL |d| (QREFELT % 186)))
              (LETT |zi| (|SPADfirst| |lf|))
              (LETT |li|
                    (LIST (SPADCALL '|meijerG| (QREFELT % 185)) |ai| |bi| |ci|
                          |di| |zi|))
              (EXIT (SPADCALL |li| (QREFELT % 186)))))) 

(SDEFUN |FSPECF;iiHypergeometricF;LF;334| ((|l| (|List| F)) (% (F)))
        (SPADCALL (QREFELT % 41) |l| (QREFELT % 113))) 

(SDEFUN |FSPECF;iiMeijerG| ((|l| (|List| F)) (% (F)))
        (SPADCALL (QREFELT % 42) |l| (QREFELT % 113))) 

(SDEFUN |FSPECF;d_eis| ((|x| (F)) (% (F)))
        (SPADCALL
         (SPADCALL (SPADCALL (QREFELT % 49) |x| (QREFELT % 221))
                   (QREFELT % 124))
         (SPADCALL (|spadConstant| % 88) |x| (QREFELT % 123)) (QREFELT % 115))) 

(SDEFUN |FSPECF;d_erfs| ((|x| (F)) (% (F)))
        (SPADCALL
         (SPADCALL (SPADCALL 2 |x| (QREFELT % 106))
                   (SPADCALL (QREFELT % 50) |x| (QREFELT % 221))
                   (QREFELT % 114))
         (SPADCALL (SPADCALL 2 (QREFELT % 90))
                   (SPADCALL (SPADCALL (QREFELT % 138)) (QREFELT % 127))
                   (QREFELT % 123))
         (QREFELT % 122))) 

(SDEFUN |FSPECF;d_erfis| ((|x| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL (SPADCALL 2 |x| (QREFELT % 106))
                    (SPADCALL (QREFELT % 51) |x| (QREFELT % 221))
                    (QREFELT % 114))
          (QREFELT % 124))
         (SPADCALL (SPADCALL 2 (QREFELT % 90))
                   (SPADCALL (SPADCALL (QREFELT % 138)) (QREFELT % 127))
                   (QREFELT % 123))
         (QREFELT % 115))) 

(DECLAIM (NOTINLINE |FunctionalSpecialFunction;|)) 

(DEFUN |FunctionalSpecialFunction| (&REST #1=#:G1321)
  (SPROG NIL
         (PROG (#2=#:G1322)
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
   ((#1=#:G175 NIL) (|pv$| NIL) (% NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$| (LIST '|FunctionalSpecialFunction| DV$1 DV$2))
    (LETT % (GETREFV 350))
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
    (QSETREFV % 24 (SPADCALL '|Beta3| (QREFELT % 12)))
    (QSETREFV % 25 (SPADCALL '|digamma| (QREFELT % 12)))
    (QSETREFV % 26 (SPADCALL '|polygamma| (QREFELT % 12)))
    (QSETREFV % 27 (SPADCALL '|besselJ| (QREFELT % 12)))
    (QSETREFV % 28 (SPADCALL '|besselY| (QREFELT % 12)))
    (QSETREFV % 29 (SPADCALL '|besselI| (QREFELT % 12)))
    (QSETREFV % 30 (SPADCALL '|besselK| (QREFELT % 12)))
    (QSETREFV % 31 (SPADCALL '|airyAi| (QREFELT % 12)))
    (QSETREFV % 32 (SPADCALL '|airyAiPrime| (QREFELT % 12)))
    (QSETREFV % 33 (SPADCALL '|airyBi| (QREFELT % 12)))
    (QSETREFV % 34 (SPADCALL '|airyBiPrime| (QREFELT % 12)))
    (QSETREFV % 35 (SPADCALL '|lambertW| (QREFELT % 12)))
    (QSETREFV % 36 (SPADCALL '|polylog| (QREFELT % 12)))
    (QSETREFV % 37 (SPADCALL '|weierstrassP| (QREFELT % 12)))
    (QSETREFV % 38 (SPADCALL '|weierstrassPPrime| (QREFELT % 12)))
    (QSETREFV % 39 (SPADCALL '|weierstrassSigma| (QREFELT % 12)))
    (QSETREFV % 40 (SPADCALL '|weierstrassZeta| (QREFELT % 12)))
    (QSETREFV % 41 (SPADCALL '|hypergeometricF| (QREFELT % 12)))
    (QSETREFV % 42 (SPADCALL '|meijerG| (QREFELT % 12)))
    (QSETREFV % 43 (SPADCALL '|charlierC| (QREFELT % 12)))
    (QSETREFV % 44 (SPADCALL '|hermiteH| (QREFELT % 12)))
    (QSETREFV % 45 (SPADCALL '|jacobiP| (QREFELT % 12)))
    (QSETREFV % 46 (SPADCALL '|laguerreL| (QREFELT % 12)))
    (QSETREFV % 47 (SPADCALL '|meixnerM| (QREFELT % 12)))
    (QSETREFV % 48 (SPADCALL '|%logGamma| (QREFELT % 12)))
    (QSETREFV % 49 (SPADCALL '|%eis| (QREFELT % 12)))
    (QSETREFV % 50 (SPADCALL '|%erfs| (QREFELT % 12)))
    (QSETREFV % 51 (SPADCALL '|%erfis| (QREFELT % 12)))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (QSETREFV % 95
                 (CONS (|dispatchFunction| |FSPECF;hypergeometricF;2L2F;29|)
                       %))
       (QSETREFV % 96
                 (CONS (|dispatchFunction| |FSPECF;meijerG;4L2F;30|) %)))))
    (QSETREFV % 98
              (SPADCALL (SPADCALL '|%diff| (QREFELT % 12)) (QREFELT % 97)))
    (QSETREFV % 101
              (PROG2
                  (LETT #1#
                        (SPADCALL (SPADCALL 2 (QREFELT % 90)) (QREFELT % 100)))
                  (QCDR #1#)
                (|check_union2| (QEQCAR #1# 0) |#2| (|Union| |#2| #2="failed")
                                #1#)))
    (QSETREFV % 102
              (PROG2
                  (LETT #1#
                        (SPADCALL (SPADCALL 3 (QREFELT % 90)) (QREFELT % 100)))
                  (QCDR #1#)
                (|check_union2| (QEQCAR #1# 0) |#2| (|Union| |#2| #2#) #1#)))
    (QSETREFV % 103
              (PROG2
                  (LETT #1#
                        (SPADCALL (SPADCALL 4 (QREFELT % 90)) (QREFELT % 100)))
                  (QCDR #1#)
                (|check_union2| (QEQCAR #1# 0) |#2| (|Union| |#2| #2#) #1#)))
    (QSETREFV % 104
              (PROG2
                  (LETT #1#
                        (SPADCALL (SPADCALL 6 (QREFELT % 90)) (QREFELT % 100)))
                  (QCDR #1#)
                (|check_union2| (QEQCAR #1# 0) |#2| (|Union| |#2| #2#) #1#)))
    (QSETREFV % 107 (SPADCALL 2 (QREFELT % 102) (QREFELT % 106)))
    (QSETREFV % 108 (SPADCALL 3 (QREFELT % 101) (QREFELT % 106)))
    (QSETREFV % 116 (SPADCALL '|weierstrassPInverse| (QREFELT % 12)))
    (SPADCALL (QREFELT % 116)
              (CONS (|function| |FSPECF;elWeierstrassPInverse|) %)
              (QREFELT % 120))
    (COND
     ((|HasCategory| |#2| '(|RadicalCategory|))
      (PROGN
       (SPADCALL (QREFELT % 116)
                 (LIST
                  (CONS (|function| |FSPECF;eWeierstrassPInverseGrad_g2|) %)
                  (CONS (|function| |FSPECF;eWeierstrassPInverseGrad_g3|) %)
                  (CONS (|function| |FSPECF;eWeierstrassPInverseGrad_z|) %))
                 (QREFELT % 129)))))
    (QSETREFV % 130 (SPADCALL '|whittakerM| (QREFELT % 12)))
    (SPADCALL (QREFELT % 130) (CONS (|function| |FSPECF;elWhittakerM|) %)
              (QREFELT % 120))
    (SPADCALL (QREFELT % 130) '|%specialDiff|
              (CONS (|function| |FSPECF;dWhittakerM|) %) (QREFELT % 133))
    (QSETREFV % 134 (SPADCALL '|whittakerW| (QREFELT % 12)))
    (SPADCALL (QREFELT % 134) (CONS (|function| |FSPECF;elWhittakerW|) %)
              (QREFELT % 120))
    (SPADCALL (QREFELT % 134) '|%specialDiff|
              (CONS (|function| |FSPECF;dWhittakerW|) %) (QREFELT % 133))
    (QSETREFV % 136 (SPADCALL '|angerJ| (QREFELT % 12)))
    (COND
     ((|HasCategory| |#2| '(|TranscendentalFunctionCategory|))
      (PROGN
       (SPADCALL (QREFELT % 136) (CONS (|function| |FSPECF;elAngerJ|) %)
                 (QREFELT % 120))
       (SPADCALL (QREFELT % 136) '|%specialDiff|
                 (CONS (|function| |FSPECF;dAngerJ|) %) (QREFELT % 133))))
     ('T
      (PROGN
       (SPADCALL (QREFELT % 136) (CONS (|function| |FSPECF;eeAngerJ|) %)
                 (QREFELT % 120)))))
    (QSETREFV % 140 (SPADCALL '|weberE| (QREFELT % 12)))
    (COND
     ((|HasCategory| |#2| '(|TranscendentalFunctionCategory|))
      (PROGN
       (SPADCALL (QREFELT % 140) (CONS (|function| |FSPECF;elWeberE|) %)
                 (QREFELT % 120))
       (SPADCALL (QREFELT % 140) '|%specialDiff|
                 (CONS (|function| |FSPECF;dWeberE|) %) (QREFELT % 133))))
     ('T
      (PROGN
       (SPADCALL (QREFELT % 140) (CONS (|function| |FSPECF;eeWeberE|) %)
                 (QREFELT % 120)))))
    (QSETREFV % 144 (SPADCALL '|struveH| (QREFELT % 12)))
    (SPADCALL (QREFELT % 144) (CONS (|function| |FSPECF;elStruveH|) %)
              (QREFELT % 120))
    (COND
     ((|HasCategory| |#2| '(|TranscendentalFunctionCategory|))
      (COND
       ((|HasCategory| |#2| '(|RadicalCategory|))
        (PROGN
         (SPADCALL (QREFELT % 144) '|%specialDiff|
                   (CONS (|function| |FSPECF;dStruveH|) %)
                   (QREFELT % 133)))))))
    (QSETREFV % 147 (SPADCALL '|struveL| (QREFELT % 12)))
    (SPADCALL (QREFELT % 147) (CONS (|function| |FSPECF;elStruveL|) %)
              (QREFELT % 120))
    (COND
     ((|HasCategory| |#2| '(|TranscendentalFunctionCategory|))
      (COND
       ((|HasCategory| |#2| '(|RadicalCategory|))
        (PROGN
         (SPADCALL (QREFELT % 147) '|%specialDiff|
                   (CONS (|function| |FSPECF;dStruveL|) %)
                   (QREFELT % 133)))))))
    (QSETREFV % 149 (SPADCALL '|hankelH1| (QREFELT % 12)))
    (SPADCALL (QREFELT % 149) (CONS (|function| |FSPECF;elHankelH1|) %)
              (QREFELT % 120))
    (SPADCALL (QREFELT % 149) '|%specialDiff|
              (CONS (|function| |FSPECF;dHankelH1|) %) (QREFELT % 133))
    (QSETREFV % 151 (SPADCALL '|hankelH2| (QREFELT % 12)))
    (SPADCALL (QREFELT % 151) (CONS (|function| |FSPECF;elHankelH2|) %)
              (QREFELT % 120))
    (SPADCALL (QREFELT % 151) '|%specialDiff|
              (CONS (|function| |FSPECF;dHankelH2|) %) (QREFELT % 133))
    (QSETREFV % 153 (SPADCALL '|lommelS1| (QREFELT % 12)))
    (SPADCALL (QREFELT % 153) (CONS (|function| |FSPECF;elLommelS1|) %)
              (QREFELT % 120))
    (SPADCALL (QREFELT % 153) '|%specialDiff|
              (CONS (|function| |FSPECF;dLommelS1|) %) (QREFELT % 133))
    (QSETREFV % 155 (SPADCALL '|lommelS2| (QREFELT % 12)))
    (SPADCALL (QREFELT % 155) (CONS (|function| |FSPECF;elLommelS2|) %)
              (QREFELT % 120))
    (SPADCALL (QREFELT % 155) '|%specialDiff|
              (CONS (|function| |FSPECF;dLommelS2|) %) (QREFELT % 133))
    (QSETREFV % 157 (SPADCALL '|kummerM| (QREFELT % 12)))
    (SPADCALL (QREFELT % 157) (CONS (|function| |FSPECF;elKummerM|) %)
              (QREFELT % 120))
    (SPADCALL (QREFELT % 157) '|%specialDiff|
              (CONS (|function| |FSPECF;dKummerM|) %) (QREFELT % 133))
    (QSETREFV % 159 (SPADCALL '|kummerU| (QREFELT % 12)))
    (SPADCALL (QREFELT % 159) (CONS (|function| |FSPECF;elKummerU|) %)
              (QREFELT % 120))
    (SPADCALL (QREFELT % 159) '|%specialDiff|
              (CONS (|function| |FSPECF;dKummerU|) %) (QREFELT % 133))
    (QSETREFV % 161 (SPADCALL '|legendreP| (QREFELT % 12)))
    (SPADCALL (QREFELT % 161) (CONS (|function| |FSPECF;elLegendreP|) %)
              (QREFELT % 120))
    (SPADCALL (QREFELT % 161) '|%specialDiff|
              (CONS (|function| |FSPECF;dLegendreP|) %) (QREFELT % 133))
    (QSETREFV % 163 (SPADCALL '|legendreQ| (QREFELT % 12)))
    (SPADCALL (QREFELT % 163) (CONS (|function| |FSPECF;elLegendreQ|) %)
              (QREFELT % 120))
    (SPADCALL (QREFELT % 163) '|%specialDiff|
              (CONS (|function| |FSPECF;dLegendreQ|) %) (QREFELT % 133))
    (QSETREFV % 165 (SPADCALL '|kelvinBei| (QREFELT % 12)))
    (SPADCALL (QREFELT % 165) (CONS (|function| |FSPECF;elKelvinBei|) %)
              (QREFELT % 120))
    (COND
     ((|HasCategory| |#2| '(|RadicalCategory|))
      (PROGN
       (SPADCALL (QREFELT % 165) '|%specialDiff|
                 (CONS (|function| |FSPECF;dKelvinBei|) %) (QREFELT % 133)))))
    (QSETREFV % 168 (SPADCALL '|kelvinBer| (QREFELT % 12)))
    (SPADCALL (QREFELT % 168) (CONS (|function| |FSPECF;elKelvinBer|) %)
              (QREFELT % 120))
    (COND
     ((|HasCategory| |#2| '(|RadicalCategory|))
      (PROGN
       (SPADCALL (QREFELT % 168) '|%specialDiff|
                 (CONS (|function| |FSPECF;dKelvinBer|) %) (QREFELT % 133)))))
    (QSETREFV % 169 (SPADCALL '|kelvinKei| (QREFELT % 12)))
    (SPADCALL (QREFELT % 169) (CONS (|function| |FSPECF;elKelvinKei|) %)
              (QREFELT % 120))
    (COND
     ((|HasCategory| |#2| '(|RadicalCategory|))
      (PROGN
       (SPADCALL (QREFELT % 169) '|%specialDiff|
                 (CONS (|function| |FSPECF;dKelvinKei|) %) (QREFELT % 133)))))
    (QSETREFV % 172 (SPADCALL '|kelvinKer| (QREFELT % 12)))
    (SPADCALL (QREFELT % 172) (CONS (|function| |FSPECF;elKelvinKer|) %)
              (QREFELT % 120))
    (COND
     ((|HasCategory| |#2| '(|RadicalCategory|))
      (PROGN
       (SPADCALL (QREFELT % 172) '|%specialDiff|
                 (CONS (|function| |FSPECF;dKelvinKer|) %) (QREFELT % 133)))))
    (QSETREFV % 173 (SPADCALL '|ellipticK| (QREFELT % 12)))
    (SPADCALL (QREFELT % 173) (CONS (|function| |FSPECF;elEllipticK|) %)
              (QREFELT % 120))
    (SPADCALL (QREFELT % 173) (CONS (|function| |FSPECF;dEllipticK|) %)
              (QREFELT % 179))
    (QSETREFV % 180 (SPADCALL '|ellipticE| (QREFELT % 12)))
    (SPADCALL (QREFELT % 180) (CONS (|function| |FSPECF;elEllipticE|) %)
              (QREFELT % 120))
    (SPADCALL (QREFELT % 180) (CONS (|function| |FSPECF;dEllipticE|) %)
              (QREFELT % 179))
    (QSETREFV % 181 (SPADCALL '|ellipticE2| (QREFELT % 12)))
    (SPADCALL (QREFELT % 181) (CONS (|function| |FSPECF;elEllipticE2|) %)
              (QREFELT % 120))
    (COND
     ((|HasCategory| |#2| '(|RadicalCategory|))
      (PROGN
       (SPADCALL (QREFELT % 181)
                 (LIST (CONS (|function| |FSPECF;eEllipticE2Grad_z|) %)
                       (CONS (|function| |FSPECF;eEllipticE2Grad_m|) %))
                 (QREFELT % 129)))))
    (SPADCALL (QREFELT % 181) (CONS (|function| |FSPECF;inEllipticE2|) %)
              (QREFELT % 188))
    (QSETREFV % 189 (SPADCALL '|ellipticF| (QREFELT % 12)))
    (SPADCALL (QREFELT % 189) (CONS (|function| |FSPECF;elEllipticF|) %)
              (QREFELT % 120))
    (COND
     ((|HasCategory| |#2| '(|RadicalCategory|))
      (PROGN
       (SPADCALL (QREFELT % 189)
                 (LIST (CONS (|function| |FSPECF;eEllipticFGrad_z|) %)
                       (CONS (|function| |FSPECF;eEllipticFGrad_m|) %))
                 (QREFELT % 129)))))
    (QSETREFV % 190 (SPADCALL '|ellipticPi| (QREFELT % 12)))
    (SPADCALL (QREFELT % 190) (CONS (|function| |FSPECF;elEllipticPi|) %)
              (QREFELT % 120))
    (COND
     ((|HasCategory| |#2| '(|RadicalCategory|))
      (PROGN
       (SPADCALL (QREFELT % 190)
                 (LIST (CONS (|function| |FSPECF;eEllipticPiGrad_z|) %)
                       (CONS (|function| |FSPECF;eEllipticPiGrad_n|) %)
                       (CONS (|function| |FSPECF;eEllipticPiGrad_m|) %))
                 (QREFELT % 129)))))
    (QSETREFV % 192 (SPADCALL '|jacobiSn| (QREFELT % 12)))
    (SPADCALL (QREFELT % 192) (CONS (|function| |FSPECF;elJacobiSn|) %)
              (QREFELT % 120))
    (SPADCALL (QREFELT % 192)
              (LIST (CONS (|function| |FSPECF;eJacobiSnGrad_z|) %)
                    (CONS (|function| |FSPECF;eJacobiSnGrad_m|) %))
              (QREFELT % 129))
    (QSETREFV % 201 (SPADCALL '|jacobiCn| (QREFELT % 12)))
    (SPADCALL (QREFELT % 201) (CONS (|function| |FSPECF;elJacobiCn|) %)
              (QREFELT % 120))
    (SPADCALL (QREFELT % 201)
              (LIST (CONS (|function| |FSPECF;eJacobiCnGrad_z|) %)
                    (CONS (|function| |FSPECF;eJacobiCnGrad_m|) %))
              (QREFELT % 129))
    (QSETREFV % 202 (SPADCALL '|jacobiDn| (QREFELT % 12)))
    (SPADCALL (QREFELT % 202) (CONS (|function| |FSPECF;elJacobiDn|) %)
              (QREFELT % 120))
    (SPADCALL (QREFELT % 202)
              (LIST (CONS (|function| |FSPECF;eJacobiDnGrad_z|) %)
                    (CONS (|function| |FSPECF;eJacobiDnGrad_m|) %))
              (QREFELT % 129))
    (QSETREFV % 203 (SPADCALL '|jacobiZeta| (QREFELT % 12)))
    (SPADCALL (QREFELT % 203) (CONS (|function| |FSPECF;elJacobiZeta|) %)
              (QREFELT % 120))
    (SPADCALL (QREFELT % 203)
              (LIST (CONS (|function| |FSPECF;eJacobiZetaGrad_z|) %)
                    (CONS (|function| |FSPECF;eJacobiZetaGrad_m|) %))
              (QREFELT % 129))
    (QSETREFV % 205 (SPADCALL '|jacobiTheta| (QREFELT % 12)))
    (SPADCALL (QREFELT % 205) (CONS (|function| |FSPECF;elJacobiTheta|) %)
              (QREFELT % 120))
    (SPADCALL (QREFELT % 205)
              (LIST (CONS (|function| |FSPECF;eJacobiThetaGrad_z|) %)
                    (CONS (|function| |FSPECF;eJacobiThetaGrad_m|) %))
              (QREFELT % 129))
    (QSETREFV % 207 (SPADCALL '|lerchPhi| (QREFELT % 12)))
    (SPADCALL (QREFELT % 207) (CONS (|function| |FSPECF;elLerchPhi|) %)
              (QREFELT % 120))
    (SPADCALL (QREFELT % 207) '|%specialDiff|
              (CONS (|function| |FSPECF;dLerchPhi|) %) (QREFELT % 133))
    (QSETREFV % 209 (SPADCALL '|riemannZeta| (QREFELT % 12)))
    (SPADCALL (QREFELT % 209) (CONS (|function| |FSPECF;elRiemannZeta|) %)
              (QREFELT % 120))
    (SPADCALL (QREFELT % 43) (CONS (|function| |FSPECF;elCharlierC|) %)
              (QREFELT % 120))
    (SPADCALL (QREFELT % 44) (CONS (|function| |FSPECF;elHermiteH|) %)
              (QREFELT % 120))
    (SPADCALL (QREFELT % 44) '|%specialDiff|
              (CONS (|function| |FSPECF;dHermiteH|) %) (QREFELT % 133))
    (SPADCALL (QREFELT % 45) (CONS (|function| |FSPECF;elJacobiP|) %)
              (QREFELT % 120))
    (SPADCALL (QREFELT % 45) '|%specialDiff|
              (CONS (|function| |FSPECF;dJacobiP|) %) (QREFELT % 133))
    (SPADCALL (QREFELT % 46) (CONS (|function| |FSPECF;elLaguerreL|) %)
              (QREFELT % 120))
    (SPADCALL (QREFELT % 46) '|%specialDiff|
              (CONS (|function| |FSPECF;dLaguerreL|) %) (QREFELT % 133))
    (SPADCALL (QREFELT % 47) (CONS (|function| |FSPECF;elMeixnerM|) %)
              (QREFELT % 120))
    (COND
     ((|HasCategory| |#2| '(|RetractableTo| (|Fraction| (|Integer|))))
      (PROGN
       (QSETREFV % 227 (CONS (|dispatchFunction| |FSPECF;retract_Q;FU;216|) %))
       (QSETREFV % 229
                 (CONS (|dispatchFunction| |FSPECF;coerce_Q;FF;217|) %))))
     ('T
      (QSETREFV % 227
                (CONS (|dispatchFunction| |FSPECF;retract_Q;FU;218|) %))))
    (SPADCALL (QREFELT % 14) (CONS #'|FunctionalSpecialFunction!0| %)
              (QREFELT % 179))
    (SPADCALL (QREFELT % 14) (CONS (|function| |FSPECF;isign|) %)
              (QREFELT % 231))
    (SPADCALL (QREFELT % 15) (ELT % 59) (QREFELT % 179))
    (SPADCALL (QREFELT % 15) (CONS (|function| |FSPECF;i_unitStep|) %)
              (QREFELT % 231))
    (SPADCALL (QREFELT % 16) (CONS (|function| |FSPECF;i_ceiling|) %)
              (QREFELT % 231))
    (SPADCALL (QREFELT % 17) (CONS (|function| |FSPECF;i_floor|) %)
              (QREFELT % 231))
    (SPADCALL (QREFELT % 18) (CONS (|function| |FSPECF;i_fractionPart|) %)
              (QREFELT % 231))
    (SPADCALL (QREFELT % 19) (CONS (|function| |FSPECF;i_diracDelta|) %)
              (QREFELT % 231))
    (COND
     ((|HasCategory| |#2| '(|ElementaryFunctionCategory|))
      (PROGN
       (QSETREFV % 236 (CONS (|dispatchFunction| |FSPECF;iAiryAi;2F;232|) %))
       (QSETREFV % 237
                 (CONS (|dispatchFunction| |FSPECF;iAiryAiPrime;2F;233|) %))
       (QSETREFV % 238 (CONS (|dispatchFunction| |FSPECF;iAiryBi;2F;234|) %))
       (QSETREFV % 239
                 (CONS (|dispatchFunction| |FSPECF;iAiryBiPrime;2F;235|) %))))
     ('T
      (PROGN
       (QSETREFV % 236 (CONS (|dispatchFunction| |FSPECF;iAiryAi;2F;236|) %))
       (QSETREFV % 237
                 (CONS (|dispatchFunction| |FSPECF;iAiryAiPrime;2F;237|) %))
       (QSETREFV % 238 (CONS (|dispatchFunction| |FSPECF;iAiryBi;2F;238|) %))
       (QSETREFV % 239
                 (CONS (|dispatchFunction| |FSPECF;iAiryBiPrime;2F;239|) %)))))
    (COND
     ((|HasCategory| |#2| '(|ElementaryFunctionCategory|))
      (QSETREFV % 241 (CONS (|dispatchFunction| |FSPECF;iLambertW;2F;240|) %)))
     ('T
      (QSETREFV % 241
                (CONS (|dispatchFunction| |FSPECF;iLambertW;2F;241|) %))))
    (COND
     ((|HasCategory| |#2| '(|ElementaryFunctionCategory|))
      (COND
       ((|HasCategory| |#2| '(|LiouvillianFunctionCategory|))
        (QSETREFV % 244
                  (CONS (|dispatchFunction| |FSPECF;iiPolylog;3F;243|) %)))
       ('T
        (QSETREFV % 244
                  (CONS (|dispatchFunction| |FSPECF;iiPolylog;3F;244|) %)))))
     ('T
      (QSETREFV % 244
                (CONS (|dispatchFunction| |FSPECF;iiPolylog;3F;245|) %))))
    (COND
     ((|HasSignature| |#1|
                      (LIST '|abs|
                            (LIST (|devaluate| |#1|) (|devaluate| |#1|))))
      (PROGN
       (QSETREFV % 256 (CONS (|dispatchFunction| |FSPECF;iiabs;2F;251|) %))))
     ('T (QSETREFV % 256 (CONS (|dispatchFunction| |FSPECF;iiabs;2F;252|) %))))
    (COND
     ((|HasCategory| |#1| '(|SpecialFunctionCategory|))
      (PROGN
       (QSETREFV % 284 (CONS (|dispatchFunction| |FSPECF;iiGamma;2F;254|) %))
       (QSETREFV % 286 (CONS (|dispatchFunction| |FSPECF;iiBeta;LF;255|) %))
       (QSETREFV % 288 (CONS (|dispatchFunction| |FSPECF;iidigamma;2F;256|) %))
       (QSETREFV % 290
                 (CONS (|dispatchFunction| |FSPECF;iipolygamma;LF;257|) %))
       (QSETREFV % 292 (CONS (|dispatchFunction| |FSPECF;iiBesselJ;LF;258|) %))
       (QSETREFV % 294 (CONS (|dispatchFunction| |FSPECF;iiBesselY;LF;259|) %))
       (QSETREFV % 296 (CONS (|dispatchFunction| |FSPECF;iiBesselI;LF;260|) %))
       (QSETREFV % 298 (CONS (|dispatchFunction| |FSPECF;iiBesselK;LF;261|) %))
       (QSETREFV % 300 (CONS (|dispatchFunction| |FSPECF;iiAiryAi;2F;262|) %))
       (QSETREFV % 302
                 (CONS (|dispatchFunction| |FSPECF;iiAiryAiPrime;2F;263|) %))
       (QSETREFV % 304 (CONS (|dispatchFunction| |FSPECF;iiAiryBi;2F;264|) %))
       (QSETREFV % 306
                 (CONS (|dispatchFunction| |FSPECF;iiAiryBiPrime;2F;265|) %))))
     ('T
      (PROGN
       (COND
        ((|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
         (QSETREFV % 284
                   (CONS (|dispatchFunction| |FSPECF;iiGamma;2F;266|) %)))
        ('T
         (QSETREFV % 284
                   (CONS (|dispatchFunction| |FSPECF;iiGamma;2F;267|) %))))
       (QSETREFV % 286 (CONS (|dispatchFunction| |FSPECF;iiBeta;LF;268|) %))
       (QSETREFV % 288 (CONS (|dispatchFunction| |FSPECF;iidigamma;2F;269|) %))
       (QSETREFV % 290
                 (CONS (|dispatchFunction| |FSPECF;iipolygamma;LF;270|) %))
       (QSETREFV % 292 (CONS (|dispatchFunction| |FSPECF;iiBesselJ;LF;271|) %))
       (QSETREFV % 294 (CONS (|dispatchFunction| |FSPECF;iiBesselY;LF;272|) %))
       (QSETREFV % 296 (CONS (|dispatchFunction| |FSPECF;iiBesselI;LF;273|) %))
       (QSETREFV % 298 (CONS (|dispatchFunction| |FSPECF;iiBesselK;LF;274|) %))
       (QSETREFV % 300 (CONS (|dispatchFunction| |FSPECF;iiAiryAi;2F;275|) %))
       (QSETREFV % 302
                 (CONS (|dispatchFunction| |FSPECF;iiAiryAiPrime;2F;276|) %))
       (QSETREFV % 304 (CONS (|dispatchFunction| |FSPECF;iiAiryBi;2F;277|) %))
       (QSETREFV % 306
                 (CONS (|dispatchFunction| |FSPECF;iiAiryBiPrime;2F;278|)
                       %)))))
    (SPADCALL (QREFELT % 21) (ELT % 284) (QREFELT % 231))
    (SPADCALL (QREFELT % 13) (ELT % 256) (QREFELT % 231))
    (SPADCALL (QREFELT % 20) (ELT % 267) (QREFELT % 231))
    (SPADCALL (QREFELT % 23) (ELT % 286) (QREFELT % 120))
    (SPADCALL (QREFELT % 25) (ELT % 288) (QREFELT % 231))
    (SPADCALL (QREFELT % 26) (ELT % 290) (QREFELT % 120))
    (SPADCALL (QREFELT % 27) (ELT % 292) (QREFELT % 120))
    (SPADCALL (QREFELT % 28) (ELT % 294) (QREFELT % 120))
    (SPADCALL (QREFELT % 29) (ELT % 296) (QREFELT % 120))
    (SPADCALL (QREFELT % 30) (ELT % 298) (QREFELT % 120))
    (SPADCALL (QREFELT % 31) (ELT % 300) (QREFELT % 231))
    (SPADCALL (QREFELT % 32) (ELT % 302) (QREFELT % 231))
    (SPADCALL (QREFELT % 33) (ELT % 304) (QREFELT % 231))
    (SPADCALL (QREFELT % 34) (ELT % 306) (QREFELT % 231))
    (SPADCALL (QREFELT % 35) (ELT % 241) (QREFELT % 231))
    (SPADCALL (QREFELT % 36) (CONS (|function| |FSPECF;iPolylog|) %)
              (QREFELT % 120))
    (SPADCALL (QREFELT % 37) (CONS (|function| |FSPECF;iiWeierstrassP|) %)
              (QREFELT % 120))
    (SPADCALL (QREFELT % 38) (CONS (|function| |FSPECF;iiWeierstrassPPrime|) %)
              (QREFELT % 120))
    (SPADCALL (QREFELT % 39) (CONS (|function| |FSPECF;iiWeierstrassSigma|) %)
              (QREFELT % 120))
    (SPADCALL (QREFELT % 40) (CONS (|function| |FSPECF;iiWeierstrassZeta|) %)
              (QREFELT % 120))
    (SPADCALL (QREFELT % 41) (ELT % 311) (QREFELT % 120))
    (SPADCALL (QREFELT % 42) (CONS (|function| |FSPECF;iiMeijerG|) %)
              (QREFELT % 120))
    (SPADCALL (QREFELT % 24) (CONS (|function| |FSPECF;elBeta3|) %)
              (QREFELT % 120))
    (COND
     ((|HasCategory| |#2| '(|ElementaryFunctionCategory|))
      (COND
       ((|HasCategory| |#2| '(|PrimitiveFunctionCategory|))
        (PROGN
         (SPADCALL (QREFELT % 24)
                   (LIST (CONS (|function| |FSPECF;eBeta3Grad1|) %)
                         (CONS (|function| |FSPECF;eBeta3Grad2|) %)
                         (CONS (|function| |FSPECF;eBeta3Grad3|) %))
                   (QREFELT % 129)))))))
    (SPADCALL (QREFELT % 24) (CONS (|function| |FSPECF;inBeta3|) %)
              (QREFELT % 188))
    (COND
     ((|HasCategory| |#2| '(|ElementaryFunctionCategory|))
      (PROGN
       (SPADCALL (QREFELT % 22) '|%specialDiff|
                 (CONS (|function| |FSPECF;iGamma2|) %) (QREFELT % 133)))))
    (SPADCALL (QREFELT % 22) (CONS (|function| |FSPECF;inGamma2|) %)
              (QREFELT % 188))
    (SPADCALL (QREFELT % 20) (CONS (|function| |FSPECF;dconjugate|) %)
              (QREFELT % 326))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (QSETREFV % 311
                 (CONS (|dispatchFunction| |FSPECF;iiHypergeometricF;LF;315|)
                       %))
       (SPADCALL (QREFELT % 41) '|%diffDisp|
                 (CONS (|function| |FSPECF;ddhyper|) %) (QREFELT % 133))
       (SPADCALL (QREFELT % 42) '|%diffDisp|
                 (CONS (|function| |FSPECF;ddmeijer|) %) (QREFELT % 133))
       (SPADCALL (QREFELT % 41) (CONS (|function| |FSPECF;dhyper|) %)
                 (QREFELT % 326))
       (SPADCALL (QREFELT % 42) (CONS (|function| |FSPECF;dmeijer|) %)
                 (QREFELT % 326))
       (SPADCALL (QREFELT % 41) '|%specialDiff|
                 (CONS (|function| |FSPECF;dvhypergeom|) %) (QREFELT % 133))
       (SPADCALL (QREFELT % 42) '|%specialDiff|
                 (CONS (|function| |FSPECF;dvmeijer|) %) (QREFELT % 133))
       (SPADCALL (QREFELT % 41) (CONS (|function| |FSPECF;inhyper|) %)
                 (QREFELT % 188))
       (SPADCALL (QREFELT % 42) (CONS (|function| |FSPECF;inmeijer|) %)
                 (QREFELT % 188))))
     ('T
      (QSETREFV % 311
                (CONS (|dispatchFunction| |FSPECF;iiHypergeometricF;LF;334|)
                      %))))
    (COND
     ((|HasCategory| |#2| '(|TranscendentalFunctionCategory|))
      (COND
       ((|HasCategory| |#2| '(|RadicalCategory|))
        (PROGN
         (SPADCALL (QREFELT % 50) (CONS (|function| |FSPECF;d_erfs|) %)
                   (QREFELT % 179))
         (SPADCALL (QREFELT % 51) (CONS (|function| |FSPECF;d_erfis|) %)
                   (QREFELT % 179)))))))
    (SPADCALL (QREFELT % 13) (CONS #'|FunctionalSpecialFunction!1| %)
              (QREFELT % 179))
    (SPADCALL (QREFELT % 21) (CONS #'|FunctionalSpecialFunction!2| %)
              (QREFELT % 179))
    (SPADCALL (QREFELT % 48) (ELT % 67) (QREFELT % 179))
    (SPADCALL (QREFELT % 23)
              (LIST (CONS (|function| |FSPECF;iBetaGrad1|) %)
                    (CONS (|function| |FSPECF;iBetaGrad2|) %))
              (QREFELT % 129))
    (SPADCALL (QREFELT % 25) (CONS #'|FunctionalSpecialFunction!3| %)
              (QREFELT % 179))
    (SPADCALL (QREFELT % 49) (CONS (|function| |FSPECF;d_eis|) %)
              (QREFELT % 179))
    (SPADCALL (QREFELT % 31) (ELT % 74) (QREFELT % 179))
    (SPADCALL (QREFELT % 32) (CONS #'|FunctionalSpecialFunction!4| %)
              (QREFELT % 179))
    (SPADCALL (QREFELT % 33) (ELT % 76) (QREFELT % 179))
    (SPADCALL (QREFELT % 34) (CONS #'|FunctionalSpecialFunction!5| %)
              (QREFELT % 179))
    (SPADCALL (QREFELT % 35) (CONS (|function| |FSPECF;dLambertW|) %)
              (QREFELT % 179))
    (SPADCALL (QREFELT % 37)
              (LIST (CONS (|function| |FSPECF;iWeierstrassPGrad1|) %)
                    (CONS (|function| |FSPECF;iWeierstrassPGrad2|) %)
                    (CONS (|function| |FSPECF;iWeierstrassPGrad3|) %))
              (QREFELT % 129))
    (SPADCALL (QREFELT % 38)
              (LIST (CONS (|function| |FSPECF;iWeierstrassPPrimeGrad1|) %)
                    (CONS (|function| |FSPECF;iWeierstrassPPrimeGrad2|) %)
                    (CONS (|function| |FSPECF;iWeierstrassPPrimeGrad3|) %))
              (QREFELT % 129))
    (SPADCALL (QREFELT % 39)
              (LIST (CONS (|function| |FSPECF;iWeierstrassSigmaGrad1|) %)
                    (CONS (|function| |FSPECF;iWeierstrassSigmaGrad2|) %)
                    (CONS (|function| |FSPECF;iWeierstrassSigmaGrad3|) %))
              (QREFELT % 129))
    (SPADCALL (QREFELT % 40)
              (LIST (CONS (|function| |FSPECF;iWeierstrassZetaGrad1|) %)
                    (CONS (|function| |FSPECF;iWeierstrassZetaGrad2|) %)
                    (CONS (|function| |FSPECF;iWeierstrassZetaGrad3|) %))
              (QREFELT % 129))
    (SPADCALL (QREFELT % 26) '|%specialDiff|
              (CONS (|function| |FSPECF;ipolygamma|) %) (QREFELT % 133))
    (SPADCALL (QREFELT % 27) '|%specialDiff|
              (CONS (|function| |FSPECF;iBesselJ|) %) (QREFELT % 133))
    (SPADCALL (QREFELT % 28) '|%specialDiff|
              (CONS (|function| |FSPECF;iBesselY|) %) (QREFELT % 133))
    (SPADCALL (QREFELT % 29) '|%specialDiff|
              (CONS (|function| |FSPECF;iBesselI|) %) (QREFELT % 133))
    (SPADCALL (QREFELT % 30) '|%specialDiff|
              (CONS (|function| |FSPECF;iBesselK|) %) (QREFELT % 133))
    (SPADCALL (QREFELT % 36) '|%specialDiff|
              (CONS (|function| |FSPECF;dPolylog|) %) (QREFELT % 133))
    %))) 

(DEFUN |FunctionalSpecialFunction!5| (|x| %)
  (SPADCALL |x| (SPADCALL |x| (QREFELT % 75)) (QREFELT % 114))) 

(DEFUN |FunctionalSpecialFunction!4| (|x| %)
  (SPADCALL |x| (SPADCALL |x| (QREFELT % 73)) (QREFELT % 114))) 

(DEFUN |FunctionalSpecialFunction!3| (|x| %)
  (SPADCALL (|spadConstant| % 88) |x| (QREFELT % 68))) 

(DEFUN |FunctionalSpecialFunction!2| (|x| %)
  (SPADCALL (SPADCALL |x| (QREFELT % 67)) (SPADCALL |x| (QREFELT % 61))
            (QREFELT % 114))) 

(DEFUN |FunctionalSpecialFunction!1| (|x| %)
  (SPADCALL (SPADCALL |x| (QREFELT % 53)) (SPADCALL |x| (QREFELT % 349))
            (QREFELT % 114))) 

(DEFUN |FunctionalSpecialFunction!0| (|x| %)
  (SPADCALL (SPADCALL 2 (QREFELT % 90)) (SPADCALL |x| (QREFELT % 59))
            (QREFELT % 114))) 

(MAKEPROP '|FunctionalSpecialFunction| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'SPECIAL
              (|BasicOperator|) (|Symbol|) (|CommonOperators|) (0 . |operator|)
              '|opabs| '|opsign| '|op_unitStep| '|op_ceiling| '|op_floor|
              '|op_fractionPart| '|op_diracDelta| '|opconjugate| '|opGamma|
              '|opGamma2| '|opBeta| '|opBeta3| '|opdigamma| '|oppolygamma|
              '|opBesselJ| '|opBesselY| '|opBesselI| '|opBesselK| '|opAiryAi|
              '|opAiryAiPrime| '|opAiryBi| '|opAiryBiPrime| '|opLambertW|
              '|opPolylog| '|opWeierstrassP| '|opWeierstrassPPrime|
              '|opWeierstrassSigma| '|opWeierstrassZeta| '|opHypergeometricF|
              '|opMeijerG| '|opCharlierC| '|opHermiteH| '|opJacobiP|
              '|opLaguerreL| '|opMeixnerM| '|op_log_gamma| '|op_eis| '|op_erfs|
              '|op_erfis| (5 . |elt|) |FSPECF;abs;2F;1| |FSPECF;sign;2F;2|
              |FSPECF;unitStep;2F;3| |FSPECF;ceiling;2F;4| |FSPECF;floor;2F;5|
              |FSPECF;fractionPart;2F;6| |FSPECF;diracDelta;2F;7|
              |FSPECF;conjugate;2F;8| |FSPECF;Gamma;2F;9| (11 . |elt|)
              |FSPECF;Gamma;3F;10| |FSPECF;Beta;3F;11| (18 . |elt|)
              |FSPECF;Beta;4F;12| |FSPECF;digamma;2F;13|
              |FSPECF;polygamma;3F;14| |FSPECF;besselJ;3F;15|
              |FSPECF;besselY;3F;16| |FSPECF;besselI;3F;17|
              |FSPECF;besselK;3F;18| |FSPECF;airyAi;2F;19|
              |FSPECF;airyAiPrime;2F;20| |FSPECF;airyBi;2F;21|
              |FSPECF;airyBiPrime;2F;22| |FSPECF;lambertW;2F;23|
              |FSPECF;polylog;3F;24| |FSPECF;weierstrassP;4F;25|
              |FSPECF;weierstrassPPrime;4F;26| |FSPECF;weierstrassSigma;4F;27|
              |FSPECF;weierstrassZeta;4F;28| (26 . |Zero|) (30 . |Zero|)
              (|Boolean|) (34 . =) (40 . |One|) (44 . |One|) (|Integer|)
              (48 . |coerce|) (|List| 7) (53 . |concat|) (|List| %)
              (59 . |elt|) (65 . |hypergeometricF|) (72 . |meijerG|)
              (81 . |operator|) '|opdiff| (|Union| % '"failed") (86 . |recip|)
              '|ahalf| '|athird| '|afourth| '|asixth| (|PositiveInteger|)
              (91 . *) '|twothirds| '|threehalfs| (97 . |elt|) (103 . |new|)
              (107 . |coerce|) (112 . |differentiate|) (118 . |kernel|)
              (124 . *) (130 . +) '|opWeierstrassPInverse|
              |FSPECF;weierstrassPInverse;4F;34| (|Mapping| 7 91)
              (|BasicOperatorFunctions1| 7) (136 . |evaluate|) (142 . ^)
              (148 . -) (154 . /) (160 . -)
              (|SparseMultivariatePolynomial| 6 197) (165 . |One|)
              (169 . |sqrt|) (|List| 118) (174 . |derivative|) '|opWhittakerM|
              |FSPECF;whittakerM;4F;40| (|None|) (180 . |setProperty|)
              '|opWhittakerW| |FSPECF;whittakerW;4F;45| '|opAngerJ|
              |FSPECF;angerJ;3F;50| (187 . |pi|) (191 . |sin|) '|opWeberE|
              |FSPECF;weberE;3F;56| (196 . ^) (202 . |cos|) '|opStruveH|
              |FSPECF;struveH;3F;62| (207 . ^) '|opStruveL|
              |FSPECF;struveL;3F;67| '|opHankelH1| |FSPECF;hankelH1;3F;72|
              '|opHankelH2| |FSPECF;hankelH2;3F;77| '|opLommelS1|
              |FSPECF;lommelS1;4F;82| '|opLommelS2| |FSPECF;lommelS2;4F;87|
              '|opKummerM| |FSPECF;kummerM;4F;92| '|opKummerU|
              |FSPECF;kummerU;4F;97| '|opLegendreP| |FSPECF;legendreP;4F;102|
              '|opLegendreQ| |FSPECF;legendreQ;4F;107| '|opKelvinBei|
              |FSPECF;kelvinBei;3F;112| |FSPECF;kelvinBer;3F;117|
              '|opKelvinBer| '|opKelvinKei| |FSPECF;kelvinKei;3F;122|
              |FSPECF;kelvinKer;3F;127| '|opKelvinKer| '|opEllipticK|
              |FSPECF;ellipticK;2F;132| |FSPECF;ellipticE;2F;136|
              (|Fraction| 89) (213 . |One|) (|Mapping| 7 7)
              (217 . |derivative|) '|opEllipticE| '|opEllipticE2|
              |FSPECF;ellipticE;3F;140| |FSPECF;ellipticF;3F;146| (|InputForm|)
              (223 . |convert|) (228 . |convert|) (|Mapping| 184 336)
              (233 . |input|) '|opEllipticF| '|opEllipticPi|
              |FSPECF;ellipticPi;4F;151| '|opJacobiSn| |FSPECF;jacobiSn;3F;157|
              (239 . |is?|) (|Kernel| %) (245 . |retract|) (|Kernel| 7)
              (250 . |argument|) |FSPECF;jacobiCn;3F;163|
              |FSPECF;jacobiDn;3F;168| '|opJacobiCn| '|opJacobiDn|
              '|opJacobiZeta| |FSPECF;jacobiZeta;3F;173| '|opJacobiTheta|
              |FSPECF;jacobiTheta;3F;178| '|opLerchPhi|
              |FSPECF;lerchPhi;4F;183| '|opRiemannZeta|
              |FSPECF;riemannZeta;2F;187| |FSPECF;charlierC;4F;190|
              |FSPECF;hermiteH;3F;193| (255 . |elt|) |FSPECF;jacobiP;5F;198|
              |FSPECF;laguerreL;4F;203| |FSPECF;meixnerM;5F;208| (264 . |has?|)
              |FSPECF;belong?;BoB;211| (270 . |is?|) |FSPECF;operator;2Bo;212|
              (276 . |kernel|) (282 . |zero?|) (287 . |one?|)
              (292 . |smaller?|) (|Union| 176 '#1="failed")
              (298 . |retractIfCan|) (303 . |retract_Q|) (308 . |coerce|)
              (313 . |coerce_Q|) (318 . |sign|) (323 . |evaluate|)
              (329 . |ceiling|) (334 . |coerce|) (339 . |floor|)
              (344 . |fractionPart|) (349 . |iAiryAi|) (354 . |iAiryAiPrime|)
              (359 . |iAiryBi|) (364 . |iAiryBiPrime|) (369 . |exp|)
              (374 . |iLambertW|) (379 . |log|) (384 . |dilog|)
              (389 . |iiPolylog|) (395 . |second|) (|Union| 249 '#1#)
              (400 . |retractIfCan|) (|Polynomial| 6) (|Fraction| 248)
              (405 . |numer|) (|Union| 6 '"failed") (410 . |retractIfCan|)
              (415 . |denom|) (420 . |abs|) (425 . |coerce|) (430 . |iiabs|)
              (|Union| 10 '#1#) (435 . |retractIfCan|) (|List| 195)
              (440 . |kernels|) (|NonNegativeInteger|) (445 . |height|)
              (450 . |Zero|) (454 . =) (460 . |coerce|) (465 . |One|)
              |FSPECF;iiconjugate;2F;253| (|Mapping| % %) (469 . |map|)
              (|Mapping| 7 197) (|List| 197) (|ListFunctions2| 197 7)
              (475 . |map|) (481 . |eval|) (488 . |conjugate|)
              (|SparseMultivariatePolynomial| 6 195) (493 . |numer|)
              (|Mapping| 6 6) (498 . |map|) (504 . |coerce|) (509 . |denom|)
              (514 . |retractIfCan|) (519 . |Gamma|) (524 . |iiGamma|)
              (529 . |Beta|) (535 . |iiBeta|) (540 . |digamma|)
              (545 . |iidigamma|) (550 . |polygamma|) (556 . |iipolygamma|)
              (561 . |besselJ|) (567 . |iiBesselJ|) (572 . |besselY|)
              (578 . |iiBesselY|) (583 . |besselI|) (589 . |iiBesselI|)
              (594 . |besselK|) (600 . |iiBesselK|) (605 . |airyAi|)
              (610 . |iiAiryAi|) (615 . |airyAiPrime|) (620 . |iiAiryAiPrime|)
              (625 . |airyBi|) (630 . |iiAiryBi|) (635 . |airyBiPrime|)
              (640 . |iiAiryBiPrime|) (|Union| 89 '#1#) (645 . |retractIfCan|)
              (650 . |factorial|) (655 . |third|) (660 . |iiHypergeometricF|)
              (|List| 10) (665 . |variables|) (670 . |member?|) (|Segment| 7)
              (676 . |segment|) (|SegmentBinding| 7) (682 . |equation|)
              (|SegmentBinding| %) (688 . |integral|) (|OutputForm|)
              (|List| 321) (694 . |elt|) (700 . |overbar|) (|Mapping| 321 322)
              (705 . |display|) (711 . |retract|) (|List| 89) (|Mapping| 89 7)
              (|ListFunctions2| 7 89) (716 . |map|) (722 . |first|)
              (728 . |rest|) (734 . ~=) (740 . |elt|) (|List| 184)
              (746 . |rest|) (|SExpression|) (752 . |integer|) (757 . |rest|)
              (763 . |first|) (769 . |bracket|) (774 . |prefix|)
              (780 . |coerce|) (|List| 322) (|ListFunctions2| 322 321)
              (785 . |map|) (791 . |concat|) (797 . |inv|))
           '#(|whittakerW| 802 |whittakerM| 809 |weierstrassZeta| 816
              |weierstrassSigma| 823 |weierstrassPPrime| 830
              |weierstrassPInverse| 837 |weierstrassP| 844 |weberE| 851
              |unitStep| 857 |struveL| 862 |struveH| 868 |sign| 874
              |riemannZeta| 879 |retract_Q| 884 |polylog| 889 |polygamma| 895
              |operator| 901 |meixnerM| 906 |meijerG| 914 |lommelS2| 923
              |lommelS1| 930 |lerchPhi| 937 |legendreQ| 944 |legendreP| 951
              |lambertW| 958 |laguerreL| 963 |kummerU| 970 |kummerM| 977
              |kelvinKer| 984 |kelvinKei| 990 |kelvinBer| 996 |kelvinBei| 1002
              |jacobiZeta| 1008 |jacobiTheta| 1014 |jacobiSn| 1020 |jacobiP|
              1026 |jacobiDn| 1034 |jacobiCn| 1040 |iipolygamma| 1046
              |iidigamma| 1051 |iiconjugate| 1056 |iiabs| 1061 |iiPolylog| 1066
              |iiHypergeometricF| 1072 |iiGamma| 1077 |iiBeta| 1082 |iiBesselY|
              1087 |iiBesselK| 1092 |iiBesselJ| 1097 |iiBesselI| 1102
              |iiAiryBiPrime| 1107 |iiAiryBi| 1112 |iiAiryAiPrime| 1117
              |iiAiryAi| 1122 |iLambertW| 1127 |iAiryBiPrime| 1132 |iAiryBi|
              1137 |iAiryAiPrime| 1142 |iAiryAi| 1147 |hypergeometricF| 1152
              |hermiteH| 1159 |hankelH2| 1165 |hankelH1| 1171 |fractionPart|
              1177 |floor| 1182 |ellipticPi| 1187 |ellipticK| 1194 |ellipticF|
              1199 |ellipticE| 1205 |diracDelta| 1216 |digamma| 1221
              |conjugate| 1226 |coerce_Q| 1231 |charlierC| 1236 |ceiling| 1243
              |besselY| 1248 |besselK| 1254 |besselJ| 1260 |besselI| 1266
              |belong?| 1272 |angerJ| 1277 |airyBiPrime| 1283 |airyBi| 1288
              |airyAiPrime| 1293 |airyAi| 1298 |abs| 1303 |Gamma| 1308 |Beta|
              1319)
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
                              '((|Beta| (|#2| |#2| |#2| |#2|)) T)
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
                                (|has| 7 (|RetractableTo| 89)))
                              '((|meijerG|
                                 (|#2| (|List| |#2|) (|List| |#2|)
                                  (|List| |#2|) (|List| |#2|) |#2|))
                                (|has| 7 (|RetractableTo| 89)))
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
                        (|makeByteWordVec2| 349
                                            '(1 11 9 10 12 2 7 0 9 0 52 3 7 0 9
                                              0 0 62 4 7 0 9 0 0 0 65 0 6 0 83
                                              0 7 0 84 2 7 85 0 0 86 0 6 0 87 0
                                              7 0 88 1 7 0 89 90 2 91 0 0 0 92
                                              2 7 0 9 93 94 3 0 7 91 91 7 95 5
                                              0 7 91 91 91 91 7 96 1 7 9 9 97 1
                                              7 99 0 100 2 7 0 105 0 106 2 91 7
                                              0 89 109 0 10 0 110 1 7 0 10 111
                                              2 7 0 0 10 112 2 7 0 9 93 113 2 7
                                              0 0 0 114 2 7 0 0 0 115 2 119 9 9
                                              118 120 2 7 0 0 105 121 2 7 0 0 0
                                              122 2 7 0 0 0 123 1 7 0 0 124 0
                                              125 0 126 1 7 0 0 127 2 119 9 9
                                              128 129 3 9 0 0 10 132 133 0 7 0
                                              138 1 7 0 0 139 2 7 0 0 89 142 1
                                              7 0 0 143 2 7 0 0 0 146 0 176 0
                                              177 2 119 9 9 178 179 1 10 184 0
                                              185 1 184 0 93 186 2 9 0 0 187
                                              188 2 7 85 0 9 194 1 7 195 0 196
                                              1 197 91 0 198 5 7 0 9 0 0 0 0
                                              213 2 9 85 0 10 217 2 9 85 0 10
                                              219 2 7 0 9 0 221 1 7 85 0 222 1
                                              7 85 0 223 2 7 85 0 0 224 1 7 225
                                              0 226 1 0 225 7 227 1 7 0 176 228
                                              1 0 7 176 229 1 176 89 0 230 2
                                              119 9 9 178 231 1 176 89 0 232 1
                                              176 0 89 233 1 176 89 0 234 1 176
                                              0 0 235 1 0 7 7 236 1 0 7 7 237 1
                                              0 7 7 238 1 0 7 7 239 1 7 0 0 240
                                              1 0 7 7 241 1 7 0 0 242 1 7 0 0
                                              243 2 0 7 7 7 244 1 91 7 0 245 1
                                              7 246 0 247 1 249 248 0 250 1 248
                                              251 0 252 1 249 248 0 253 1 6 0 0
                                              254 1 7 0 6 255 1 0 7 7 256 1 7
                                              257 0 258 1 7 259 0 260 1 197 261
                                              0 262 0 261 0 263 2 261 85 0 0
                                              264 1 7 0 195 265 0 105 0 266 2 7
                                              0 268 195 269 2 272 91 270 271
                                              273 3 7 0 0 259 93 274 1 6 0 0
                                              275 1 7 276 0 277 2 125 0 278 0
                                              279 1 7 0 276 280 1 7 276 0 281 1
                                              7 251 0 282 1 6 0 0 283 1 0 7 7
                                              284 2 6 0 0 0 285 1 0 7 91 286 1
                                              6 0 0 287 1 0 7 7 288 2 6 0 0 0
                                              289 1 0 7 91 290 2 6 0 0 0 291 1
                                              0 7 91 292 2 6 0 0 0 293 1 0 7 91
                                              294 2 6 0 0 0 295 1 0 7 91 296 2
                                              6 0 0 0 297 1 0 7 91 298 1 6 0 0
                                              299 1 0 7 7 300 1 6 0 0 301 1 0 7
                                              7 302 1 6 0 0 303 1 0 7 7 304 1 6
                                              0 0 305 1 0 7 7 306 1 7 307 0 308
                                              1 89 0 0 309 1 91 7 0 310 1 0 7
                                              91 311 1 7 312 0 313 2 312 85 10
                                              0 314 2 315 0 7 7 316 2 317 0 10
                                              315 318 2 7 0 0 319 320 2 322 321
                                              0 89 323 1 321 0 0 324 2 9 0 0
                                              325 326 1 7 89 0 327 2 330 328
                                              329 91 331 2 91 0 0 261 332 2 91
                                              0 0 261 333 2 261 85 0 0 334 2
                                              328 89 0 89 335 2 336 0 0 261 337
                                              1 338 89 0 339 2 322 0 0 261 340
                                              2 322 0 0 261 341 1 321 0 93 342
                                              2 321 0 0 93 343 1 10 321 0 344 2
                                              346 322 325 345 347 2 322 0 0 0
                                              348 1 7 0 0 349 3 0 7 7 7 7 135 3
                                              0 7 7 7 7 131 3 0 7 7 7 7 82 3 0
                                              7 7 7 7 81 3 0 7 7 7 7 80 3 0 7 7
                                              7 7 117 3 0 7 7 7 7 79 2 0 7 7 7
                                              141 1 0 7 7 55 2 0 7 7 7 148 2 0
                                              7 7 7 145 1 0 7 7 54 1 0 7 7 210
                                              1 0 225 7 227 2 0 7 7 7 78 2 0 7
                                              7 7 68 1 0 9 9 220 4 0 7 7 7 7 7
                                              216 5 1 7 91 91 91 91 7 96 3 0 7
                                              7 7 7 156 3 0 7 7 7 7 154 3 0 7 7
                                              7 7 208 3 0 7 7 7 7 164 3 0 7 7 7
                                              7 162 1 0 7 7 77 3 0 7 7 7 7 215
                                              3 0 7 7 7 7 160 3 0 7 7 7 7 158 2
                                              0 7 7 7 171 2 0 7 7 7 170 2 0 7 7
                                              7 167 2 0 7 7 7 166 2 0 7 7 7 204
                                              2 0 7 7 7 206 2 0 7 7 7 193 4 0 7
                                              7 7 7 7 214 2 0 7 7 7 200 2 0 7 7
                                              7 199 1 0 7 91 290 1 0 7 7 288 1
                                              0 7 7 267 1 0 7 7 256 2 0 7 7 7
                                              244 1 0 7 91 311 1 0 7 7 284 1 0
                                              7 91 286 1 0 7 91 294 1 0 7 91
                                              298 1 0 7 91 292 1 0 7 91 296 1 0
                                              7 7 306 1 0 7 7 304 1 0 7 7 302 1
                                              0 7 7 300 1 0 7 7 241 1 0 7 7 239
                                              1 0 7 7 238 1 0 7 7 237 1 0 7 7
                                              236 3 1 7 91 91 7 95 2 0 7 7 7
                                              212 2 0 7 7 7 152 2 0 7 7 7 150 1
                                              0 7 7 58 1 0 7 7 57 3 0 7 7 7 7
                                              191 1 0 7 7 174 2 0 7 7 7 183 1 0
                                              7 7 175 2 0 7 7 7 182 1 0 7 7 59
                                              1 0 7 7 67 1 0 7 7 60 1 0 7 176
                                              229 3 0 7 7 7 7 211 1 0 7 7 56 2
                                              0 7 7 7 70 2 0 7 7 7 72 2 0 7 7 7
                                              69 2 0 7 7 7 71 1 0 85 9 218 2 0
                                              7 7 7 137 1 0 7 7 76 1 0 7 7 75 1
                                              0 7 7 74 1 0 7 7 73 1 0 7 7 53 1
                                              0 7 7 61 2 0 7 7 7 63 2 0 7 7 7
                                              64 3 0 7 7 7 7 66)))))
           '|lookupComplete|)) 
