
(SDEFUN |OC-;characteristic;Nni;1| ((% (|NonNegativeInteger|)))
        (SPADCALL (QREFELT % 9))) 

(MAKEPROP '|OC-;rank;Pi;2| '|SPADreplace| '(XLAM NIL 8)) 

(SDEFUN |OC-;rank;Pi;2| ((% (|PositiveInteger|))) 8) 

(SDEFUN |OC-;coordinates;SV;3| ((|x| (S)) (% (|Vector| R)))
        (SPADCALL
         (LIST (SPADCALL |x| (QREFELT % 13)) (SPADCALL |x| (QREFELT % 14))
               (SPADCALL |x| (QREFELT % 15)) (SPADCALL |x| (QREFELT % 16))
               (SPADCALL |x| (QREFELT % 17)) (SPADCALL |x| (QREFELT % 18))
               (SPADCALL |x| (QREFELT % 19)) (SPADCALL |x| (QREFELT % 20)))
         (QREFELT % 23))) 

(SDEFUN |OC-;represents;VS;4| ((|v| (|Vector| R)) (% (S)))
        (SPADCALL (SPADCALL |v| 1 (QREFELT % 28))
                  (SPADCALL |v| 2 (QREFELT % 28))
                  (SPADCALL |v| 3 (QREFELT % 28))
                  (SPADCALL |v| 4 (QREFELT % 28))
                  (SPADCALL |v| 5 (QREFELT % 28))
                  (SPADCALL |v| 6 (QREFELT % 28))
                  (SPADCALL |v| 7 (QREFELT % 28))
                  (SPADCALL |v| 8 (QREFELT % 28)) (QREFELT % 29))) 

(SDEFUN |OC-;basis;V;5| ((% (|Vector| S)))
        (SPROG ((|res| (|Vector| S)) (|vv| (|Vector| R)) (|i| NIL))
               (SEQ (LETT |res| (SPADCALL 8 (QREFELT % 32)))
                    (LETT |vv| (SPADCALL 8 (QREFELT % 33)))
                    (SEQ (LETT |i| 1) G190
                         (COND ((|greater_SI| |i| 8) (GO G191)))
                         (SEQ
                          (SPADCALL |vv| |i| (|spadConstant| % 26)
                                    (QREFELT % 34))
                          (SPADCALL |res| |i| (SPADCALL |vv| (QREFELT % 35))
                                    (QREFELT % 36))
                          (EXIT
                           (SPADCALL |vv| |i| (|spadConstant| % 38)
                                     (QREFELT % 34))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT |res|)))) 

(SDEFUN |OC-;conjugate;2S;6| ((|x| (S)) (% (S)))
        (SPADCALL (SPADCALL |x| (QREFELT % 13))
                  (SPADCALL (SPADCALL |x| (QREFELT % 14)) (QREFELT % 41))
                  (SPADCALL (SPADCALL |x| (QREFELT % 15)) (QREFELT % 41))
                  (SPADCALL (SPADCALL |x| (QREFELT % 16)) (QREFELT % 41))
                  (SPADCALL (SPADCALL |x| (QREFELT % 17)) (QREFELT % 41))
                  (SPADCALL (SPADCALL |x| (QREFELT % 18)) (QREFELT % 41))
                  (SPADCALL (SPADCALL |x| (QREFELT % 19)) (QREFELT % 41))
                  (SPADCALL (SPADCALL |x| (QREFELT % 20)) (QREFELT % 41))
                  (QREFELT % 29))) 

(SDEFUN |OC-;map;M2S;7| ((|fn| (|Mapping| R R)) (|x| (S)) (% (S)))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT % 13)) |fn|)
                  (SPADCALL (SPADCALL |x| (QREFELT % 14)) |fn|)
                  (SPADCALL (SPADCALL |x| (QREFELT % 15)) |fn|)
                  (SPADCALL (SPADCALL |x| (QREFELT % 16)) |fn|)
                  (SPADCALL (SPADCALL |x| (QREFELT % 17)) |fn|)
                  (SPADCALL (SPADCALL |x| (QREFELT % 18)) |fn|)
                  (SPADCALL (SPADCALL |x| (QREFELT % 19)) |fn|)
                  (SPADCALL (SPADCALL |x| (QREFELT % 20)) |fn|) (QREFELT % 29))) 

(SDEFUN |OC-;norm;SR;8| ((|x| (S)) (% (R)))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL
            (SPADCALL
             (SPADCALL
              (SPADCALL
               (SPADCALL (SPADCALL |x| (QREFELT % 13))
                         (SPADCALL |x| (QREFELT % 13)) (QREFELT % 45))
               (SPADCALL (SPADCALL |x| (QREFELT % 14))
                         (SPADCALL |x| (QREFELT % 14)) (QREFELT % 45))
               (QREFELT % 46))
              (SPADCALL (SPADCALL |x| (QREFELT % 15))
                        (SPADCALL |x| (QREFELT % 15)) (QREFELT % 45))
              (QREFELT % 46))
             (SPADCALL (SPADCALL |x| (QREFELT % 16))
                       (SPADCALL |x| (QREFELT % 16)) (QREFELT % 45))
             (QREFELT % 46))
            (SPADCALL (SPADCALL |x| (QREFELT % 17))
                      (SPADCALL |x| (QREFELT % 17)) (QREFELT % 45))
            (QREFELT % 46))
           (SPADCALL (SPADCALL |x| (QREFELT % 18))
                     (SPADCALL |x| (QREFELT % 18)) (QREFELT % 45))
           (QREFELT % 46))
          (SPADCALL (SPADCALL |x| (QREFELT % 19)) (SPADCALL |x| (QREFELT % 19))
                    (QREFELT % 45))
          (QREFELT % 46))
         (SPADCALL (SPADCALL |x| (QREFELT % 20)) (SPADCALL |x| (QREFELT % 20))
                   (QREFELT % 45))
         (QREFELT % 46))) 

(SDEFUN |OC-;=;2SB;9| ((|x| (S)) (|y| (S)) (% (|Boolean|)))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT % 13)) (SPADCALL |y| (QREFELT % 13))
                    (QREFELT % 49))
          (COND
           ((SPADCALL (SPADCALL |x| (QREFELT % 14))
                      (SPADCALL |y| (QREFELT % 14)) (QREFELT % 49))
            (COND
             ((SPADCALL (SPADCALL |x| (QREFELT % 15))
                        (SPADCALL |y| (QREFELT % 15)) (QREFELT % 49))
              (COND
               ((SPADCALL (SPADCALL |x| (QREFELT % 16))
                          (SPADCALL |y| (QREFELT % 16)) (QREFELT % 49))
                (COND
                 ((SPADCALL (SPADCALL |x| (QREFELT % 17))
                            (SPADCALL |y| (QREFELT % 17)) (QREFELT % 49))
                  (COND
                   ((SPADCALL (SPADCALL |x| (QREFELT % 18))
                              (SPADCALL |y| (QREFELT % 18)) (QREFELT % 49))
                    (COND
                     ((SPADCALL (SPADCALL |x| (QREFELT % 19))
                                (SPADCALL |y| (QREFELT % 19)) (QREFELT % 49))
                      (SPADCALL (SPADCALL |x| (QREFELT % 20))
                                (SPADCALL |y| (QREFELT % 20)) (QREFELT % 49)))
                     (#1='T NIL)))
                   (#1# NIL)))
                 (#1# NIL)))
               (#1# NIL)))
             (#1# NIL)))
           (#1# NIL)))
         (#1# NIL))) 

(SDEFUN |OC-;+;3S;10| ((|x| (S)) (|y| (S)) (% (S)))
        (SPADCALL
         (SPADCALL (SPADCALL |x| (QREFELT % 13)) (SPADCALL |y| (QREFELT % 13))
                   (QREFELT % 46))
         (SPADCALL (SPADCALL |x| (QREFELT % 14)) (SPADCALL |y| (QREFELT % 14))
                   (QREFELT % 46))
         (SPADCALL (SPADCALL |x| (QREFELT % 15)) (SPADCALL |y| (QREFELT % 15))
                   (QREFELT % 46))
         (SPADCALL (SPADCALL |x| (QREFELT % 16)) (SPADCALL |y| (QREFELT % 16))
                   (QREFELT % 46))
         (SPADCALL (SPADCALL |x| (QREFELT % 17)) (SPADCALL |y| (QREFELT % 17))
                   (QREFELT % 46))
         (SPADCALL (SPADCALL |x| (QREFELT % 18)) (SPADCALL |y| (QREFELT % 18))
                   (QREFELT % 46))
         (SPADCALL (SPADCALL |x| (QREFELT % 19)) (SPADCALL |y| (QREFELT % 19))
                   (QREFELT % 46))
         (SPADCALL (SPADCALL |x| (QREFELT % 20)) (SPADCALL |y| (QREFELT % 20))
                   (QREFELT % 46))
         (QREFELT % 29))) 

(SDEFUN |OC-;-;2S;11| ((|x| (S)) (% (S)))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT % 13)) (QREFELT % 41))
                  (SPADCALL (SPADCALL |x| (QREFELT % 14)) (QREFELT % 41))
                  (SPADCALL (SPADCALL |x| (QREFELT % 15)) (QREFELT % 41))
                  (SPADCALL (SPADCALL |x| (QREFELT % 16)) (QREFELT % 41))
                  (SPADCALL (SPADCALL |x| (QREFELT % 17)) (QREFELT % 41))
                  (SPADCALL (SPADCALL |x| (QREFELT % 18)) (QREFELT % 41))
                  (SPADCALL (SPADCALL |x| (QREFELT % 19)) (QREFELT % 41))
                  (SPADCALL (SPADCALL |x| (QREFELT % 20)) (QREFELT % 41))
                  (QREFELT % 29))) 

(SDEFUN |OC-;*;R2S;12| ((|r| (R)) (|x| (S)) (% (S)))
        (SPADCALL (SPADCALL |r| (SPADCALL |x| (QREFELT % 13)) (QREFELT % 45))
                  (SPADCALL |r| (SPADCALL |x| (QREFELT % 14)) (QREFELT % 45))
                  (SPADCALL |r| (SPADCALL |x| (QREFELT % 15)) (QREFELT % 45))
                  (SPADCALL |r| (SPADCALL |x| (QREFELT % 16)) (QREFELT % 45))
                  (SPADCALL |r| (SPADCALL |x| (QREFELT % 17)) (QREFELT % 45))
                  (SPADCALL |r| (SPADCALL |x| (QREFELT % 18)) (QREFELT % 45))
                  (SPADCALL |r| (SPADCALL |x| (QREFELT % 19)) (QREFELT % 45))
                  (SPADCALL |r| (SPADCALL |x| (QREFELT % 20)) (QREFELT % 45))
                  (QREFELT % 29))) 

(SDEFUN |OC-;*;I2S;13| ((|n| (|Integer|)) (|x| (S)) (% (S)))
        (SPADCALL (SPADCALL |n| (SPADCALL |x| (QREFELT % 13)) (QREFELT % 54))
                  (SPADCALL |n| (SPADCALL |x| (QREFELT % 14)) (QREFELT % 54))
                  (SPADCALL |n| (SPADCALL |x| (QREFELT % 15)) (QREFELT % 54))
                  (SPADCALL |n| (SPADCALL |x| (QREFELT % 16)) (QREFELT % 54))
                  (SPADCALL |n| (SPADCALL |x| (QREFELT % 17)) (QREFELT % 54))
                  (SPADCALL |n| (SPADCALL |x| (QREFELT % 18)) (QREFELT % 54))
                  (SPADCALL |n| (SPADCALL |x| (QREFELT % 19)) (QREFELT % 54))
                  (SPADCALL |n| (SPADCALL |x| (QREFELT % 20)) (QREFELT % 54))
                  (QREFELT % 29))) 

(SDEFUN |OC-;coerce;RS;14| ((|r| (R)) (% (S)))
        (SPADCALL |r| (|spadConstant| % 38) (|spadConstant| % 38)
                  (|spadConstant| % 38) (|spadConstant| % 38)
                  (|spadConstant| % 38) (|spadConstant| % 38)
                  (|spadConstant| % 38) (QREFELT % 29))) 

(SDEFUN |OC-;coerce;IS;15| ((|n| (|Integer|)) (% (S)))
        (SPADCALL (SPADCALL |n| (QREFELT % 57)) (|spadConstant| % 38)
                  (|spadConstant| % 38) (|spadConstant| % 38)
                  (|spadConstant| % 38) (|spadConstant| % 38)
                  (|spadConstant| % 38) (|spadConstant| % 38) (QREFELT % 29))) 

(SDEFUN |OC-;zero?;SB;16| ((|x| (S)) (% (|Boolean|)))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT % 13)) (QREFELT % 59))
          (COND
           ((SPADCALL (SPADCALL |x| (QREFELT % 14)) (QREFELT % 59))
            (COND
             ((SPADCALL (SPADCALL |x| (QREFELT % 15)) (QREFELT % 59))
              (COND
               ((SPADCALL (SPADCALL |x| (QREFELT % 16)) (QREFELT % 59))
                (COND
                 ((SPADCALL (SPADCALL |x| (QREFELT % 17)) (QREFELT % 59))
                  (COND
                   ((SPADCALL (SPADCALL |x| (QREFELT % 18)) (QREFELT % 59))
                    (COND
                     ((SPADCALL (SPADCALL |x| (QREFELT % 19)) (QREFELT % 59))
                      (SPADCALL (SPADCALL |x| (QREFELT % 20)) (QREFELT % 59)))
                     (#1='T NIL)))
                   (#1# NIL)))
                 (#1# NIL)))
               (#1# NIL)))
             (#1# NIL)))
           (#1# NIL)))
         (#1# NIL))) 

(SDEFUN |OC-;retract;SR;17| ((|x| (S)) (% (R)))
        (SEQ
         (COND
          ((SPADCALL (SPADCALL |x| (QREFELT % 14)) (QREFELT % 59))
           (COND
            ((SPADCALL (SPADCALL |x| (QREFELT % 15)) (QREFELT % 59))
             (COND
              ((SPADCALL (SPADCALL |x| (QREFELT % 16)) (QREFELT % 59))
               (COND
                ((SPADCALL (SPADCALL |x| (QREFELT % 17)) (QREFELT % 59))
                 (COND
                  ((SPADCALL (SPADCALL |x| (QREFELT % 18)) (QREFELT % 59))
                   (COND
                    ((SPADCALL (SPADCALL |x| (QREFELT % 19)) (QREFELT % 59))
                     (COND
                      ((NULL
                        (SPADCALL (SPADCALL |x| (QREFELT % 20))
                                  (QREFELT % 59)))
                       (EXIT (|error| #1="Cannot retract octonion.")))))
                    (#2='T (EXIT (|error| #1#)))))
                  (#2# (EXIT (|error| #1#)))))
                (#2# (EXIT (|error| #1#)))))
              (#2# (EXIT (|error| #1#)))))
            (#2# (EXIT (|error| #1#)))))
          (#2# (EXIT (|error| #1#))))
         (EXIT (SPADCALL |x| (QREFELT % 13))))) 

(SDEFUN |OC-;retractIfCan;SU;18| ((|x| (S)) (% (|Union| R "failed")))
        (SEQ
         (COND
          ((SPADCALL (SPADCALL |x| (QREFELT % 14)) (QREFELT % 59))
           (COND
            ((SPADCALL (SPADCALL |x| (QREFELT % 15)) (QREFELT % 59))
             (COND
              ((SPADCALL (SPADCALL |x| (QREFELT % 16)) (QREFELT % 59))
               (COND
                ((SPADCALL (SPADCALL |x| (QREFELT % 17)) (QREFELT % 59))
                 (COND
                  ((SPADCALL (SPADCALL |x| (QREFELT % 18)) (QREFELT % 59))
                   (COND
                    ((SPADCALL (SPADCALL |x| (QREFELT % 19)) (QREFELT % 59))
                     (COND
                      ((NULL
                        (SPADCALL (SPADCALL |x| (QREFELT % 20))
                                  (QREFELT % 59)))
                       (EXIT (CONS 1 #1="failed")))))
                    (#2='T (EXIT (CONS 1 #1#)))))
                  (#2# (EXIT (CONS 1 #1#)))))
                (#2# (EXIT (CONS 1 #1#)))))
              (#2# (EXIT (CONS 1 #1#)))))
            (#2# (EXIT (CONS 1 #1#)))))
          (#2# (EXIT (CONS 1 #1#))))
         (EXIT (CONS 0 (SPADCALL |x| (QREFELT % 13)))))) 

(SDEFUN |OC-;coerce;SOf;19| ((|x| (S)) (% (|OutputForm|)))
        (SPROG ((|y| (S)) (|z| (|OutputForm|)) (|part| (|OutputForm|)))
               (SEQ
                (COND
                 ((SPADCALL |x| (QREFELT % 64))
                  (SPADCALL (|spadConstant| % 38) (QREFELT % 66)))
                 ((NULL
                   (SPADCALL (SPADCALL |x| (QREFELT % 13)) (QREFELT % 59)))
                  (SEQ
                   (LETT |y|
                         (SPADCALL (|spadConstant| % 38)
                                   (SPADCALL |x| (QREFELT % 14))
                                   (SPADCALL |x| (QREFELT % 15))
                                   (SPADCALL |x| (QREFELT % 16))
                                   (SPADCALL |x| (QREFELT % 17))
                                   (SPADCALL |x| (QREFELT % 18))
                                   (SPADCALL |x| (QREFELT % 19))
                                   (SPADCALL |x| (QREFELT % 20))
                                   (QREFELT % 29)))
                   (EXIT
                    (COND
                     ((SPADCALL |y| (QREFELT % 64))
                      (SPADCALL (SPADCALL |x| (QREFELT % 13)) (QREFELT % 66)))
                     (#1='T
                      (SPADCALL
                       (SPADCALL (SPADCALL |x| (QREFELT % 13)) (QREFELT % 66))
                       (SPADCALL |y| (QREFELT % 67)) (QREFELT % 68)))))))
                 ((NULL
                   (SPADCALL (SPADCALL |x| (QREFELT % 14)) (QREFELT % 59)))
                  (SEQ
                   (LETT |y|
                         (SPADCALL (|spadConstant| % 38) (|spadConstant| % 38)
                                   (SPADCALL |x| (QREFELT % 15))
                                   (SPADCALL |x| (QREFELT % 16))
                                   (SPADCALL |x| (QREFELT % 17))
                                   (SPADCALL |x| (QREFELT % 18))
                                   (SPADCALL |x| (QREFELT % 19))
                                   (SPADCALL |x| (QREFELT % 20))
                                   (QREFELT % 29)))
                   (LETT |z|
                         (SEQ (LETT |part| (SPADCALL '|i| (QREFELT % 70)))
                              (EXIT
                               (COND
                                ((SPADCALL (SPADCALL |x| (QREFELT % 14))
                                           (|spadConstant| % 26)
                                           (QREFELT % 49))
                                 |part|)
                                (#1#
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |x| (QREFELT % 14))
                                            (QREFELT % 66))
                                  |part| (QREFELT % 71)))))))
                   (EXIT
                    (COND ((SPADCALL |y| (QREFELT % 64)) |z|)
                          (#1#
                           (SPADCALL |z| (SPADCALL |y| (QREFELT % 67))
                                     (QREFELT % 68)))))))
                 ((NULL
                   (SPADCALL (SPADCALL |x| (QREFELT % 15)) (QREFELT % 59)))
                  (SEQ
                   (LETT |y|
                         (SPADCALL (|spadConstant| % 38) (|spadConstant| % 38)
                                   (|spadConstant| % 38)
                                   (SPADCALL |x| (QREFELT % 16))
                                   (SPADCALL |x| (QREFELT % 17))
                                   (SPADCALL |x| (QREFELT % 18))
                                   (SPADCALL |x| (QREFELT % 19))
                                   (SPADCALL |x| (QREFELT % 20))
                                   (QREFELT % 29)))
                   (LETT |z|
                         (SEQ (LETT |part| (SPADCALL '|j| (QREFELT % 70)))
                              (EXIT
                               (COND
                                ((SPADCALL (SPADCALL |x| (QREFELT % 15))
                                           (|spadConstant| % 26)
                                           (QREFELT % 49))
                                 |part|)
                                (#1#
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |x| (QREFELT % 15))
                                            (QREFELT % 66))
                                  |part| (QREFELT % 71)))))))
                   (EXIT
                    (COND ((SPADCALL |y| (QREFELT % 64)) |z|)
                          (#1#
                           (SPADCALL |z| (SPADCALL |y| (QREFELT % 67))
                                     (QREFELT % 68)))))))
                 ((NULL
                   (SPADCALL (SPADCALL |x| (QREFELT % 16)) (QREFELT % 59)))
                  (SEQ
                   (LETT |y|
                         (SPADCALL (|spadConstant| % 38) (|spadConstant| % 38)
                                   (|spadConstant| % 38) (|spadConstant| % 38)
                                   (SPADCALL |x| (QREFELT % 17))
                                   (SPADCALL |x| (QREFELT % 18))
                                   (SPADCALL |x| (QREFELT % 19))
                                   (SPADCALL |x| (QREFELT % 20))
                                   (QREFELT % 29)))
                   (LETT |z|
                         (SEQ (LETT |part| (SPADCALL '|k| (QREFELT % 70)))
                              (EXIT
                               (COND
                                ((SPADCALL (SPADCALL |x| (QREFELT % 16))
                                           (|spadConstant| % 26)
                                           (QREFELT % 49))
                                 |part|)
                                (#1#
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |x| (QREFELT % 16))
                                            (QREFELT % 66))
                                  |part| (QREFELT % 71)))))))
                   (EXIT
                    (COND ((SPADCALL |y| (QREFELT % 64)) |z|)
                          (#1#
                           (SPADCALL |z| (SPADCALL |y| (QREFELT % 67))
                                     (QREFELT % 68)))))))
                 ((NULL
                   (SPADCALL (SPADCALL |x| (QREFELT % 17)) (QREFELT % 59)))
                  (SEQ
                   (LETT |y|
                         (SPADCALL (|spadConstant| % 38) (|spadConstant| % 38)
                                   (|spadConstant| % 38) (|spadConstant| % 38)
                                   (|spadConstant| % 38)
                                   (SPADCALL |x| (QREFELT % 18))
                                   (SPADCALL |x| (QREFELT % 19))
                                   (SPADCALL |x| (QREFELT % 20))
                                   (QREFELT % 29)))
                   (LETT |z|
                         (SEQ (LETT |part| (SPADCALL 'E (QREFELT % 70)))
                              (EXIT
                               (COND
                                ((SPADCALL (SPADCALL |x| (QREFELT % 17))
                                           (|spadConstant| % 26)
                                           (QREFELT % 49))
                                 |part|)
                                (#1#
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |x| (QREFELT % 17))
                                            (QREFELT % 66))
                                  |part| (QREFELT % 71)))))))
                   (EXIT
                    (COND ((SPADCALL |y| (QREFELT % 64)) |z|)
                          (#1#
                           (SPADCALL |z| (SPADCALL |y| (QREFELT % 67))
                                     (QREFELT % 68)))))))
                 ((NULL
                   (SPADCALL (SPADCALL |x| (QREFELT % 18)) (QREFELT % 59)))
                  (SEQ
                   (LETT |y|
                         (SPADCALL (|spadConstant| % 38) (|spadConstant| % 38)
                                   (|spadConstant| % 38) (|spadConstant| % 38)
                                   (|spadConstant| % 38) (|spadConstant| % 38)
                                   (SPADCALL |x| (QREFELT % 19))
                                   (SPADCALL |x| (QREFELT % 20))
                                   (QREFELT % 29)))
                   (LETT |z|
                         (SEQ (LETT |part| (SPADCALL 'I (QREFELT % 70)))
                              (EXIT
                               (COND
                                ((SPADCALL (SPADCALL |x| (QREFELT % 18))
                                           (|spadConstant| % 26)
                                           (QREFELT % 49))
                                 |part|)
                                (#1#
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |x| (QREFELT % 18))
                                            (QREFELT % 66))
                                  |part| (QREFELT % 71)))))))
                   (EXIT
                    (COND ((SPADCALL |y| (QREFELT % 64)) |z|)
                          (#1#
                           (SPADCALL |z| (SPADCALL |y| (QREFELT % 67))
                                     (QREFELT % 68)))))))
                 ((NULL
                   (SPADCALL (SPADCALL |x| (QREFELT % 19)) (QREFELT % 59)))
                  (SEQ
                   (LETT |y|
                         (SPADCALL (|spadConstant| % 38) (|spadConstant| % 38)
                                   (|spadConstant| % 38) (|spadConstant| % 38)
                                   (|spadConstant| % 38) (|spadConstant| % 38)
                                   (|spadConstant| % 38)
                                   (SPADCALL |x| (QREFELT % 20))
                                   (QREFELT % 29)))
                   (LETT |z|
                         (SEQ (LETT |part| (SPADCALL 'J (QREFELT % 70)))
                              (EXIT
                               (COND
                                ((SPADCALL (SPADCALL |x| (QREFELT % 19))
                                           (|spadConstant| % 26)
                                           (QREFELT % 49))
                                 |part|)
                                (#1#
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |x| (QREFELT % 19))
                                            (QREFELT % 66))
                                  |part| (QREFELT % 71)))))))
                   (EXIT
                    (COND ((SPADCALL |y| (QREFELT % 64)) |z|)
                          (#1#
                           (SPADCALL |z| (SPADCALL |y| (QREFELT % 67))
                                     (QREFELT % 68)))))))
                 ('T
                  (SEQ (LETT |part| (SPADCALL 'K (QREFELT % 70)))
                       (EXIT
                        (COND
                         ((SPADCALL (SPADCALL |x| (QREFELT % 20))
                                    (|spadConstant| % 26) (QREFELT % 49))
                          |part|)
                         (#1#
                          (SPADCALL
                           (SPADCALL (SPADCALL |x| (QREFELT % 20))
                                     (QREFELT % 66))
                           |part| (QREFELT % 71))))))))))) 

(SDEFUN |OC-;inv;2S;20| ((|x| (S)) (% (S)))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT % 73)) (|spadConstant| % 38)
                    (QREFELT % 49))
          (|error| "This octonion is not invertible."))
         ('T
          (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT % 73)) (QREFELT % 74))
                    (SPADCALL |x| (QREFELT % 75)) (QREFELT % 76))))) 

(SDEFUN |OC-;convert;SIf;21| ((|x| (S)) (% (|InputForm|)))
        (SPROG ((|l| (|List| (|InputForm|))))
               (SEQ
                (LETT |l|
                      (LIST (SPADCALL '|octon| (QREFELT % 79))
                            (SPADCALL (SPADCALL |x| (QREFELT % 13))
                                      (QREFELT % 80))
                            (SPADCALL (SPADCALL |x| (QREFELT % 14))
                                      (QREFELT % 80))
                            (SPADCALL (SPADCALL |x| (QREFELT % 15))
                                      (QREFELT % 80))
                            (SPADCALL (SPADCALL |x| (QREFELT % 16))
                                      (QREFELT % 80))
                            (SPADCALL (SPADCALL |x| (QREFELT % 17))
                                      (QREFELT % 80))
                            (SPADCALL (SPADCALL |x| (QREFELT % 18))
                                      (QREFELT % 80))
                            (SPADCALL (SPADCALL |x| (QREFELT % 19))
                                      (QREFELT % 80))
                            (SPADCALL (SPADCALL |x| (QREFELT % 20))
                                      (QREFELT % 80))))
                (EXIT (SPADCALL |l| (QREFELT % 82)))))) 

(SDEFUN |OC-;<;2SB;22| ((|x| (S)) (|y| (S)) (% (|Boolean|)))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT % 13)) (SPADCALL |y| (QREFELT % 13))
                    (QREFELT % 49))
          (COND
           ((SPADCALL (SPADCALL |x| (QREFELT % 14))
                      (SPADCALL |y| (QREFELT % 14)) (QREFELT % 49))
            (COND
             ((SPADCALL (SPADCALL |x| (QREFELT % 15))
                        (SPADCALL |y| (QREFELT % 15)) (QREFELT % 49))
              (COND
               ((SPADCALL (SPADCALL |x| (QREFELT % 16))
                          (SPADCALL |y| (QREFELT % 16)) (QREFELT % 49))
                (COND
                 ((SPADCALL (SPADCALL |x| (QREFELT % 17))
                            (SPADCALL |y| (QREFELT % 17)) (QREFELT % 49))
                  (COND
                   ((SPADCALL (SPADCALL |x| (QREFELT % 18))
                              (SPADCALL |y| (QREFELT % 18)) (QREFELT % 49))
                    (COND
                     ((SPADCALL (SPADCALL |x| (QREFELT % 19))
                                (SPADCALL |y| (QREFELT % 19)) (QREFELT % 49))
                      (SPADCALL (SPADCALL |x| (QREFELT % 20))
                                (SPADCALL |y| (QREFELT % 20)) (QREFELT % 84)))
                     (#1='T
                      (SPADCALL (SPADCALL |x| (QREFELT % 19))
                                (SPADCALL |y| (QREFELT % 19))
                                (QREFELT % 84)))))
                   (#1#
                    (SPADCALL (SPADCALL |x| (QREFELT % 18))
                              (SPADCALL |y| (QREFELT % 18)) (QREFELT % 84)))))
                 (#1#
                  (SPADCALL (SPADCALL |x| (QREFELT % 17))
                            (SPADCALL |y| (QREFELT % 17)) (QREFELT % 84)))))
               (#1#
                (SPADCALL (SPADCALL |x| (QREFELT % 16))
                          (SPADCALL |y| (QREFELT % 16)) (QREFELT % 84)))))
             (#1#
              (SPADCALL (SPADCALL |x| (QREFELT % 15))
                        (SPADCALL |y| (QREFELT % 15)) (QREFELT % 84)))))
           (#1#
            (SPADCALL (SPADCALL |x| (QREFELT % 14))
                      (SPADCALL |y| (QREFELT % 14)) (QREFELT % 84)))))
         (#1#
          (SPADCALL (SPADCALL |x| (QREFELT % 13)) (SPADCALL |y| (QREFELT % 13))
                    (QREFELT % 84))))) 

(SDEFUN |OC-;abs;SR;23| ((|x| (S)) (% (R)))
        (SPADCALL (SPADCALL |x| (QREFELT % 73)) (QREFELT % 86))) 

(SDEFUN |OC-;rational?;SB;24| ((|x| (S)) (% (|Boolean|)))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT % 14)) (QREFELT % 59))
          (COND
           ((SPADCALL (SPADCALL |x| (QREFELT % 15)) (QREFELT % 59))
            (COND
             ((SPADCALL (SPADCALL |x| (QREFELT % 16)) (QREFELT % 59))
              (COND
               ((SPADCALL (SPADCALL |x| (QREFELT % 17)) (QREFELT % 59))
                (COND
                 ((SPADCALL (SPADCALL |x| (QREFELT % 18)) (QREFELT % 59))
                  (COND
                   ((SPADCALL (SPADCALL |x| (QREFELT % 19)) (QREFELT % 59))
                    (SPADCALL (SPADCALL |x| (QREFELT % 20)) (QREFELT % 59)))
                   (#1='T NIL)))
                 (#1# NIL)))
               (#1# NIL)))
             (#1# NIL)))
           (#1# NIL)))
         (#1# NIL))) 

(SDEFUN |OC-;rational;SF;25| ((|x| (S)) (% (|Fraction| (|Integer|))))
        (COND
         ((SPADCALL |x| (QREFELT % 89))
          (SPADCALL (SPADCALL |x| (QREFELT % 13)) (QREFELT % 91)))
         ('T (|error| "Not a rational number")))) 

(SDEFUN |OC-;rationalIfCan;SU;26|
        ((|x| (S)) (% (|Union| (|Fraction| (|Integer|)) "failed")))
        (COND
         ((SPADCALL |x| (QREFELT % 89))
          (CONS 0 (SPADCALL (SPADCALL |x| (QREFELT % 13)) (QREFELT % 91))))
         ('T (CONS 1 "failed")))) 

(DECLAIM (NOTINLINE |OctonionCategory&;|)) 

(DEFUN |OctonionCategory&| (|#1| |#2|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|OctonionCategory&| DV$1 DV$2))
          (LETT % (GETREFV 97))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#2| '(|Field|))
                                              (|HasCategory| |#2|
                                                             '(|IntegerNumberSystem|))
                                              (|HasCategory| |#2|
                                                             '(|RealNumberSystem|))
                                              (|HasCategory| |#2|
                                                             '(|CharacteristicNonZero|))
                                              (|HasCategory| |#2|
                                                             '(|CharacteristicZero|))
                                              (|HasCategory| |#2|
                                                             '(|ConvertibleTo|
                                                               (|InputForm|)))
                                              (|HasCategory| |#2|
                                                             '(|OrderedSet|))))))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (COND
           ((|testBitVector| |pv$| 1)
            (QSETREFV % 77 (CONS (|dispatchFunction| |OC-;inv;2S;20|) %))))
          (COND
           ((|testBitVector| |pv$| 6)
            (QSETREFV % 83
                      (CONS (|dispatchFunction| |OC-;convert;SIf;21|) %))))
          (COND
           ((|testBitVector| |pv$| 7)
            (QSETREFV % 85 (CONS (|dispatchFunction| |OC-;<;2SB;22|) %))))
          (COND
           ((|testBitVector| |pv$| 3)
            (QSETREFV % 87 (CONS (|dispatchFunction| |OC-;abs;SR;23|) %))))
          (COND
           ((|testBitVector| |pv$| 2)
            (PROGN
             (QSETREFV % 88
                       (CONS (|dispatchFunction| |OC-;rational?;SB;24|) %))
             (QSETREFV % 92 (CONS (|dispatchFunction| |OC-;rational;SF;25|) %))
             (QSETREFV % 94
                       (CONS (|dispatchFunction| |OC-;rationalIfCan;SU;26|)
                             %)))))
          %))) 

(MAKEPROP '|OctonionCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|NonNegativeInteger|) (0 . |characteristic|)
              |OC-;characteristic;Nni;1| (|PositiveInteger|) |OC-;rank;Pi;2|
              (4 . |real|) (9 . |imagi|) (14 . |imagj|) (19 . |imagk|)
              (24 . |imagE|) (29 . |imagI|) (34 . |imagJ|) (39 . |imagK|)
              (|List| 7) (|Vector| 7) (44 . |vector|) |OC-;coordinates;SV;3|
              (49 . |1|) (53 . |1|) (|Integer|) (57 . |elt|) (63 . |octon|)
              |OC-;represents;VS;4| (|Vector| 6) (75 . |zero|) (80 . |zero|)
              (85 . |setelt!|) (92 . |represents|) (97 . |setelt!|) (104 . |0|)
              (108 . |0|) (|Vector| %) |OC-;basis;V;5| (112 . -)
              |OC-;conjugate;2S;6| (|Mapping| 7 7) |OC-;map;M2S;7| (117 . *)
              (123 . +) |OC-;norm;SR;8| (|Boolean|) (129 . =) |OC-;=;2SB;9|
              |OC-;+;3S;10| |OC-;-;2S;11| |OC-;*;R2S;12| (135 . *)
              |OC-;*;I2S;13| |OC-;coerce;RS;14| (141 . |coerce|)
              |OC-;coerce;IS;15| (146 . |zero?|) |OC-;zero?;SB;16|
              |OC-;retract;SR;17| (|Union| 7 '"failed")
              |OC-;retractIfCan;SU;18| (151 . |zero?|) (|OutputForm|)
              (156 . |coerce|) (161 . |coerce|) (166 . +) (|Symbol|)
              (172 . |coerce|) (177 . *) |OC-;coerce;SOf;19| (183 . |norm|)
              (188 . |inv|) (193 . |conjugate|) (198 . *) (204 . |inv|)
              (|InputForm|) (209 . |convert|) (214 . |convert|) (|List| %)
              (219 . |convert|) (224 . |convert|) (229 . <) (235 . <)
              (241 . |sqrt|) (246 . |abs|) (251 . |rational?|)
              (256 . |rational?|) (|Fraction| 27) (261 . |rational|)
              (266 . |rational|) (|Union| 90 '#1="failed")
              (271 . |rationalIfCan|) (|Matrix| 7) (|Union| 27 '#2="failed"))
           '#(|zero?| 276 |retractIfCan| 281 |retract| 286 |represents| 291
              |rationalIfCan| 296 |rational?| 301 |rational| 306 |rank| 311
              |norm| 315 |map| 320 |inv| 326 |coordinates| 331 |convert| 336
              |conjugate| 341 |coerce| 346 |characteristic| 361 |basis| 365
              |abs| 369 = 374 < 380 - 386 + 391 * 397)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((< ((|Boolean|) |#1| |#1|)) T)
                                   '((|convert| ((|InputForm|) |#1|)) T)
                                   '((|inv| (|#1| |#1|)) T)
                                   '((|rationalIfCan|
                                      ((|Union| (|Fraction| (|Integer|)) #1#)
                                       |#1|))
                                     T)
                                   '((|rational|
                                      ((|Fraction| (|Integer|)) |#1|))
                                     T)
                                   '((|rational?| ((|Boolean|) |#1|)) T)
                                   '((|abs| (|#2| |#1|)) T)
                                   '((|norm| (|#2| |#1|)) T)
                                   '((|conjugate| (|#1| |#1|)) T)
                                   '((|map| (|#1| (|Mapping| |#2| |#2|) |#1|))
                                     T)
                                   '((|coerce| (|#1| |#2|)) T)
                                   '((|retractIfCan| ((|Union| |#2| #2#) |#1|))
                                     T)
                                   '((|retract| (|#2| |#1|)) T)
                                   '((|retract|
                                      ((|Fraction| (|Integer|)) |#1|))
                                     T)
                                   '((|retractIfCan|
                                      ((|Union| (|Fraction| (|Integer|)) #2#)
                                       |#1|))
                                     T)
                                   '((|coerce| (|#1| (|Fraction| (|Integer|))))
                                     T)
                                   '((|retract| ((|Integer|) |#1|)) T)
                                   '((|retractIfCan|
                                      ((|Union| (|Integer|) #2#) |#1|))
                                     T)
                                   '((|characteristic|
                                      ((|NonNegativeInteger|)))
                                     T)
                                   '((|coerce| (|#1| (|Integer|))) T)
                                   '((|basis| ((|Vector| |#1|))) T)
                                   '((|coordinates| ((|Vector| |#2|) |#1|)) T)
                                   '((|coordinates|
                                      ((|Matrix| |#2|) (|Vector| |#1|)))
                                     T)
                                   '((|represents| (|#1| (|Vector| |#2|))) T)
                                   '((|convert| ((|Vector| |#2|) |#1|)) T)
                                   '((|convert| (|#1| (|Vector| |#2|))) T)
                                   '((|represents|
                                      (|#1| (|Vector| |#2|) (|Vector| |#1|)))
                                     T)
                                   '((|coordinates|
                                      ((|Matrix| |#2|) (|Vector| |#1|)
                                       (|Vector| |#1|)))
                                     T)
                                   '((|coordinates|
                                      ((|Vector| |#2|) |#1| (|Vector| |#1|)))
                                     T)
                                   '((|rank| ((|PositiveInteger|))) T)
                                   '((* (|#1| |#2| |#1|)) T)
                                   '((* (|#1| |#1| |#2|)) T)
                                   '((|zero?| ((|Boolean|) |#1|)) T)
                                   '((* (|#1| (|NonNegativeInteger|) |#1|)) T)
                                   '((- (|#1| |#1|)) T)
                                   '((- (|#1| |#1| |#1|)) T)
                                   '((* (|#1| (|Integer|) |#1|)) T)
                                   '((* (|#1| |#1| |#1|)) T)
                                   '((* (|#1| (|PositiveInteger|) |#1|)) T)
                                   '((+ (|#1| |#1| |#1|)) T)
                                   '((|coerce| ((|OutputForm|) |#1|)) T)
                                   '((= ((|Boolean|) |#1| |#1|)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 94
                                            '(0 7 8 9 1 6 7 0 13 1 6 7 0 14 1 6
                                              7 0 15 1 6 7 0 16 1 6 7 0 17 1 6
                                              7 0 18 1 6 7 0 19 1 6 7 0 20 1 22
                                              0 21 23 0 6 0 25 0 7 0 26 2 22 7
                                              0 27 28 8 6 0 7 7 7 7 7 7 7 7 29
                                              1 31 0 8 32 1 22 0 8 33 3 22 7 0
                                              27 7 34 1 6 0 22 35 3 31 6 0 27 6
                                              36 0 6 0 37 0 7 0 38 1 7 0 0 41 2
                                              7 0 0 0 45 2 7 0 0 0 46 2 7 48 0
                                              0 49 2 7 0 27 0 54 1 7 0 27 57 1
                                              7 48 0 59 1 6 48 0 64 1 7 65 0 66
                                              1 6 65 0 67 2 65 0 0 0 68 1 69 65
                                              0 70 2 65 0 0 0 71 1 6 7 0 73 1 7
                                              0 0 74 1 6 0 0 75 2 6 0 7 0 76 1
                                              0 0 0 77 1 78 0 69 79 1 7 78 0 80
                                              1 78 0 81 82 1 0 78 0 83 2 7 48 0
                                              0 84 2 0 48 0 0 85 1 7 0 0 86 1 0
                                              7 0 87 1 0 48 0 88 1 6 48 0 89 1
                                              7 90 0 91 1 0 90 0 92 1 0 93 0 94
                                              1 0 48 0 60 1 0 62 0 63 1 0 7 0
                                              61 1 0 0 22 30 1 0 93 0 94 1 0 48
                                              0 88 1 0 90 0 92 0 0 11 12 1 0 7
                                              0 47 2 0 0 43 0 44 1 0 0 0 77 1 0
                                              22 0 24 1 0 78 0 83 1 0 0 0 42 1
                                              0 65 0 72 1 0 0 27 58 1 0 0 7 56
                                              0 0 8 10 0 0 39 40 1 0 7 0 87 2 0
                                              48 0 0 50 2 0 48 0 0 85 1 0 0 0
                                              52 2 0 0 0 0 51 2 0 0 27 0 55 2 0
                                              0 7 0 53)))))
           '|lookupComplete|)) 
