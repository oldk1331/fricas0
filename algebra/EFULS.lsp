
(SDEFUN |EFULS;nthRootUTS|
        ((|uts| (UTS)) (|n| (|Integer|)) (% (|Union| UTS "failed")))
        (COND
         ((OR
           (SPADCALL (SPADCALL |uts| 0 (QREFELT % 15)) (|spadConstant| % 16)
                     (QREFELT % 18))
           (QREFELT % 9))
          (CONS 0
                (SPADCALL |uts|
                          (SPADCALL (SPADCALL |n| (QREFELT % 21))
                                    (QREFELT % 22))
                          (QREFELT % 23))))
         ('T (CONS 1 "failed")))) 

(SDEFUN |EFULS;nthRootIfCan;ULSNniU;2|
        ((|uls| (ULS)) (|nn| (|NonNegativeInteger|))
         (% (|Union| ULS "failed")))
        (SPROG
         ((|n| (|Integer|)) (|deg| (|Integer|)) (|coef| (|Coef|))
          (|k| (|Union| (|Integer|) "failed")) (|uts| (UTS))
          (|root| (|Union| UTS "failed")))
         (SEQ (LETT |n| |nn|)
              (EXIT
               (COND ((< |n| 1) (|error| "nthRootIfCan: n must be positive"))
                     ((EQL |n| 1) (CONS 0 |uls|))
                     (#1='T
                      (SEQ (LETT |deg| (SPADCALL |uls| (QREFELT % 25)))
                           (COND
                            ((SPADCALL
                              (LETT |coef|
                                    (SPADCALL |uls| |deg| (QREFELT % 26)))
                              (QREFELT % 27))
                             (SEQ
                              (LETT |uls| (SPADCALL 1000 |uls| (QREFELT % 28)))
                              (LETT |deg| (SPADCALL |uls| (QREFELT % 25)))
                              (EXIT
                               (COND
                                ((SPADCALL
                                  (LETT |coef|
                                        (SPADCALL |uls| |deg| (QREFELT % 26)))
                                  (QREFELT % 27))
                                 (|error|
                                  "root of series with many leading zero coefficients")))))))
                           (LETT |k| (|exquo_INT| |deg| |n|))
                           (EXIT
                            (COND ((QEQCAR |k| 1) (CONS 1 "failed"))
                                  (#1#
                                   (SEQ
                                    (LETT |uts|
                                          (SPADCALL
                                           (SPADCALL |uls|
                                                     (SPADCALL
                                                      (|spadConstant| % 16)
                                                      (- |deg|) (QREFELT % 29))
                                                     (QREFELT % 30))
                                           (QREFELT % 31)))
                                    (LETT |root|
                                          (|EFULS;nthRootUTS| |uts| |n| %))
                                    (EXIT
                                     (COND
                                      ((QEQCAR |root| 1) (CONS 1 "failed"))
                                      (#1#
                                       (CONS 0
                                             (SPADCALL
                                              (SPADCALL (|spadConstant| % 16)
                                                        (QCDR |k|)
                                                        (QREFELT % 29))
                                              (SPADCALL (QCDR |root|)
                                                        (QREFELT % 32))
                                              (QREFELT % 30))))))))))))))))) 

(SDEFUN |EFULS;^;ULSFULS;3|
        ((|uls| (ULS)) (|r| (|Fraction| (|Integer|))) (% (ULS)))
        (SPROG
         ((|num| (|Integer|)) (|den| (|Integer|)) (|deg| (|Integer|))
          (|coef| (|Coef|)) (|k| (|Union| (|Integer|) "failed")) (|uts| (UTS)))
         (SEQ (LETT |num| (SPADCALL |r| (QREFELT % 35)))
              (LETT |den| (SPADCALL |r| (QREFELT % 36)))
              (EXIT
               (COND ((EQL |den| 1) (SPADCALL |uls| |num| (QREFELT % 37)))
                     (#1='T
                      (SEQ (LETT |deg| (SPADCALL |uls| (QREFELT % 25)))
                           (COND
                            ((SPADCALL
                              (LETT |coef|
                                    (SPADCALL |uls| |deg| (QREFELT % 26)))
                              (QREFELT % 27))
                             (SEQ
                              (LETT |uls| (SPADCALL 1000 |uls| (QREFELT % 28)))
                              (LETT |deg| (SPADCALL |uls| (QREFELT % 25)))
                              (EXIT
                               (COND
                                ((SPADCALL
                                  (LETT |coef|
                                        (SPADCALL |uls| |deg| (QREFELT % 26)))
                                  (QREFELT % 27))
                                 (|error|
                                  "power of series with many leading zero coefficients")))))))
                           (LETT |k| (|exquo_INT| |deg| |den|))
                           (EXIT
                            (COND
                             ((QEQCAR |k| 1)
                              (|error| "^: rational power does not exist"))
                             (#1#
                              (SEQ
                               (LETT |uts|
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL |uls|
                                                 (SPADCALL
                                                  (|spadConstant| % 16)
                                                  (- |deg|) (QREFELT % 29))
                                                 (QREFELT % 30))
                                       (QREFELT % 31))
                                      |r| (QREFELT % 23)))
                               (EXIT
                                (SPADCALL
                                 (SPADCALL (|spadConstant| % 16)
                                           (* (QCDR |k|) |num|) (QREFELT % 29))
                                 (SPADCALL |uts| (QREFELT % 32))
                                 (QREFELT % 30)))))))))))))) 

(SDEFUN |EFULS;applyIfCan|
        ((|fcn| (|Mapping| UTS UTS)) (|uls| (ULS)) (% (|Union| ULS "failed")))
        (SPROG ((|uts| (|Union| UTS "failed")))
               (SEQ (LETT |uts| (SPADCALL |uls| (QREFELT % 40)))
                    (EXIT
                     (COND ((QEQCAR |uts| 1) (CONS 1 "failed"))
                           ('T
                            (CONS 0
                                  (SPADCALL (SPADCALL (QCDR |uts|) |fcn|)
                                            (QREFELT % 32))))))))) 

(SDEFUN |EFULS;expIfCan;ULSU;5| ((|uls| (ULS)) (% (|Union| ULS "failed")))
        (|EFULS;applyIfCan| (ELT % 41) |uls| %)) 

(SDEFUN |EFULS;sinIfCan;ULSU;6| ((|uls| (ULS)) (% (|Union| ULS "failed")))
        (|EFULS;applyIfCan| (ELT % 43) |uls| %)) 

(SDEFUN |EFULS;cosIfCan;ULSU;7| ((|uls| (ULS)) (% (|Union| ULS "failed")))
        (|EFULS;applyIfCan| (ELT % 45) |uls| %)) 

(SDEFUN |EFULS;asinIfCan;ULSU;8| ((|uls| (ULS)) (% (|Union| ULS "failed")))
        (|EFULS;applyIfCan| (ELT % 47) |uls| %)) 

(SDEFUN |EFULS;acosIfCan;ULSU;9| ((|uls| (ULS)) (% (|Union| ULS "failed")))
        (|EFULS;applyIfCan| (ELT % 49) |uls| %)) 

(SDEFUN |EFULS;sinhIfCan;ULSU;10| ((|uls| (ULS)) (% (|Union| ULS "failed")))
        (|EFULS;applyIfCan| (ELT % 51) |uls| %)) 

(SDEFUN |EFULS;coshIfCan;ULSU;11| ((|uls| (ULS)) (% (|Union| ULS "failed")))
        (|EFULS;applyIfCan| (ELT % 53) |uls| %)) 

(SDEFUN |EFULS;asinhIfCan;ULSU;12| ((|uls| (ULS)) (% (|Union| ULS "failed")))
        (|EFULS;applyIfCan| (ELT % 55) |uls| %)) 

(SDEFUN |EFULS;acoshIfCan;ULSU;13| ((|uls| (ULS)) (% (|Union| ULS "failed")))
        (|EFULS;applyIfCan| (ELT % 57) |uls| %)) 

(SDEFUN |EFULS;atanhIfCan;ULSU;14| ((|uls| (ULS)) (% (|Union| ULS "failed")))
        (|EFULS;applyIfCan| (ELT % 59) |uls| %)) 

(SDEFUN |EFULS;acothIfCan;ULSU;15| ((|uls| (ULS)) (% (|Union| ULS "failed")))
        (|EFULS;applyIfCan| (ELT % 61) |uls| %)) 

(SDEFUN |EFULS;logIfCan;ULSU;16| ((|uls| (ULS)) (% (|Union| ULS "failed")))
        (SPROG ((|uts| (|Union| UTS "failed")) (|ts| (UTS)))
               (SEQ (LETT |uts| (SPADCALL |uls| (QREFELT % 40)))
                    (EXIT
                     (COND
                      ((OR (QEQCAR |uts| 1)
                           (SPADCALL
                            (SPADCALL (LETT |ts| (QCDR |uts|)) 0
                                      (QREFELT % 15))
                            (QREFELT % 27)))
                       (CONS 1 "failed"))
                      ('T
                       (CONS 0
                             (SPADCALL (SPADCALL |ts| (QREFELT % 63))
                                       (QREFELT % 32))))))))) 

(SDEFUN |EFULS;tanIfCan;ULSU;17| ((|uls| (ULS)) (% (|Union| ULS "failed")))
        (SPROG
         ((|uts| (|Union| UTS "failed"))
          (|sc|
           (|Record| (|:| |sin| (|Stream| |Coef|))
                     (|:| |cos| (|Stream| |Coef|))))
          (|cosInv| (|Union| ULS "failed")))
         (SEQ (LETT |uts| (SPADCALL |uls| (QREFELT % 40)))
              (EXIT
               (COND ((QEQCAR |uts| 1) (CONS 1 "failed"))
                     (#1='T
                      (SEQ
                       (LETT |sc|
                             (SPADCALL (SPADCALL (QCDR |uts|) (QREFELT % 66))
                                       (QREFELT % 69)))
                       (LETT |cosInv|
                             (SPADCALL
                              (SPADCALL (SPADCALL (QCDR |sc|) (QREFELT % 70))
                                        (QREFELT % 32))
                              (QREFELT % 72)))
                       (EXIT
                        (COND ((QEQCAR |cosInv| 1) (CONS 1 "failed"))
                              (#1#
                               (CONS 0
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL (QCAR |sc|) (QREFELT % 70))
                                       (QREFELT % 32))
                                      (QCDR |cosInv|) (QREFELT % 30))))))))))))) 

(SDEFUN |EFULS;cotIfCan;ULSU;18| ((|uls| (ULS)) (% (|Union| ULS "failed")))
        (SPROG
         ((|uts| (|Union| UTS "failed"))
          (|sc|
           (|Record| (|:| |sin| (|Stream| |Coef|))
                     (|:| |cos| (|Stream| |Coef|))))
          (|sinInv| (|Union| ULS "failed")))
         (SEQ (LETT |uts| (SPADCALL |uls| (QREFELT % 40)))
              (EXIT
               (COND ((QEQCAR |uts| 1) (CONS 1 "failed"))
                     (#1='T
                      (SEQ
                       (LETT |sc|
                             (SPADCALL (SPADCALL (QCDR |uts|) (QREFELT % 66))
                                       (QREFELT % 69)))
                       (LETT |sinInv|
                             (SPADCALL
                              (SPADCALL (SPADCALL (QCAR |sc|) (QREFELT % 70))
                                        (QREFELT % 32))
                              (QREFELT % 72)))
                       (EXIT
                        (COND ((QEQCAR |sinInv| 1) (CONS 1 "failed"))
                              (#1#
                               (CONS 0
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL (QCDR |sc|) (QREFELT % 70))
                                       (QREFELT % 32))
                                      (QCDR |sinInv|) (QREFELT % 30))))))))))))) 

(SDEFUN |EFULS;secIfCan;ULSU;19| ((|uls| (ULS)) (% (|Union| ULS #1="failed")))
        (SPROG ((|cos| (|Union| ULS #1#)) (|cosInv| (|Union| ULS "failed")))
               (SEQ (LETT |cos| (SPADCALL |uls| (QREFELT % 46)))
                    (EXIT
                     (COND ((QEQCAR |cos| 1) (CONS 1 "failed"))
                           (#2='T
                            (SEQ
                             (LETT |cosInv|
                                   (SPADCALL (QCDR |cos|) (QREFELT % 72)))
                             (EXIT
                              (COND ((QEQCAR |cosInv| 1) (CONS 1 "failed"))
                                    (#2# (CONS 0 (QCDR |cosInv|)))))))))))) 

(SDEFUN |EFULS;cscIfCan;ULSU;20| ((|uls| (ULS)) (% (|Union| ULS #1="failed")))
        (SPROG ((|sin| (|Union| ULS #1#)) (|sinInv| (|Union| ULS "failed")))
               (SEQ (LETT |sin| (SPADCALL |uls| (QREFELT % 44)))
                    (EXIT
                     (COND ((QEQCAR |sin| 1) (CONS 1 "failed"))
                           (#2='T
                            (SEQ
                             (LETT |sinInv|
                                   (SPADCALL (QCDR |sin|) (QREFELT % 72)))
                             (EXIT
                              (COND ((QEQCAR |sinInv| 1) (CONS 1 "failed"))
                                    (#2# (CONS 0 (QCDR |sinInv|)))))))))))) 

(SDEFUN |EFULS;atanIfCan;ULSU;21| ((|uls| (ULS)) (% (|Union| ULS "failed")))
        (SPROG
         ((|coef| (|Coef|)) (|ord| (|Integer|)) (#1=#:G172 NIL) (|lc| (|Coef|))
          (|rat| (|Union| (|Fraction| (|Integer|)) "failed")) (#2=#:G173 NIL)
          (|cc| (|Coef|)) (|z| (|Union| ULS "failed")))
         (SEQ
          (EXIT
           (SEQ
            (EXIT
             (SEQ (LETT |coef| (SPADCALL |uls| 0 (QREFELT % 26)))
                  (SEQ (LETT |ord| (SPADCALL |uls| 0 (QREFELT % 77)))
                       (EXIT
                        (COND
                         ((EQL |ord| 0)
                          (COND
                           ((SPADCALL (SPADCALL |coef| |coef| (QREFELT % 78))
                                      (SPADCALL (|spadConstant| % 16)
                                                (QREFELT % 79))
                                      (QREFELT % 18))
                            (PROGN
                             (LETT #1# (CONS 1 "failed"))
                             (GO #3=#:G170))))))))
                  (LETT |cc|
                        (COND
                         ((< |ord| 0)
                          (COND
                           ((QREFELT % 10)
                            (COND
                             ((QREFELT % 11)
                              (SEQ
                               (LETT |lc|
                                     (SPADCALL |uls| |ord| (QREFELT % 26)))
                               (LETT |rat| (SPADCALL |lc| (QREFELT % 81)))
                               (EXIT
                                (COND
                                 ((OR (QEQCAR |rat| 1)
                                      (SPADCALL (QCDR |rat|)
                                                (|spadConstant| % 85)
                                                (QREFELT % 86)))
                                  (SPADCALL (SPADCALL 1 2 (QREFELT % 82))
                                            (SPADCALL (QREFELT % 83))
                                            (QREFELT % 84)))
                                 ('T
                                  (SPADCALL
                                   (SPADCALL (SPADCALL 1 2 (QREFELT % 82))
                                             (QREFELT % 88))
                                   (SPADCALL (QREFELT % 83))
                                   (QREFELT % 84)))))))
                             (#4='T
                              (SPADCALL (SPADCALL 1 2 (QREFELT % 82))
                                        (SPADCALL (QREFELT % 83))
                                        (QREFELT % 84)))))
                           (#4#
                            (PROGN
                             (LETT #2# (CONS 1 "failed"))
                             (GO #5=#:G171)))))
                         ((SPADCALL |coef| (|spadConstant| % 12)
                                    (QREFELT % 18))
                          (|spadConstant| % 12))
                         ((QREFELT % 10) (SPADCALL |coef| (QREFELT % 89)))
                         (#4# (PROGN (LETT #2# (CONS 1 "failed")) (GO #5#)))))
                  (LETT |z|
                        (SPADCALL
                         (SPADCALL (|spadConstant| % 87)
                                   (SPADCALL |uls| |uls| (QREFELT % 30))
                                   (QREFELT % 90))
                         (QREFELT % 72)))
                  (EXIT
                   (COND ((QEQCAR |z| 1) (CONS 1 "failed"))
                         (#4#
                          (CONS 0
                                (SPADCALL (SPADCALL |cc| (QREFELT % 91))
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |uls| (QREFELT % 92))
                                            (QCDR |z|) (QREFELT % 30))
                                           (QREFELT % 93))
                                          (QREFELT % 90))))))))
            #3# (EXIT #1#)))
          #5# (EXIT #2#)))) 

(SDEFUN |EFULS;acotIfCan;ULSU;22| ((|uls| (ULS)) (% (|Union| ULS "failed")))
        (SPROG
         ((|coef| (|Coef|)) (|ord| (|Integer|)) (#1=#:G186 NIL) (|lc| (|Coef|))
          (|rat| (|Union| (|Fraction| (|Integer|)) "failed")) (#2=#:G187 NIL)
          (|cc| (|Coef|)) (|z| (|Union| ULS "failed")))
         (SEQ
          (EXIT
           (SEQ
            (EXIT
             (SEQ (LETT |coef| (SPADCALL |uls| 0 (QREFELT % 26)))
                  (SEQ (LETT |ord| (SPADCALL |uls| 0 (QREFELT % 77)))
                       (EXIT
                        (COND
                         ((EQL |ord| 0)
                          (COND
                           ((SPADCALL (SPADCALL |coef| |coef| (QREFELT % 78))
                                      (SPADCALL (|spadConstant| % 16)
                                                (QREFELT % 79))
                                      (QREFELT % 18))
                            (PROGN
                             (LETT #1# (CONS 1 "failed"))
                             (GO #3=#:G184))))))))
                  (LETT |cc|
                        (COND
                         ((< |ord| 0)
                          (COND
                           ((QREFELT % 11)
                            (SEQ
                             (LETT |lc| (SPADCALL |uls| |ord| (QREFELT % 26)))
                             (LETT |rat| (SPADCALL |lc| (QREFELT % 81)))
                             (EXIT
                              (COND
                               ((OR (QEQCAR |rat| 1)
                                    (SPADCALL (QCDR |rat|)
                                              (|spadConstant| % 85)
                                              (QREFELT % 86)))
                                (|spadConstant| % 12))
                               ((QREFELT % 10) (SPADCALL (QREFELT % 83)))
                               (#4='T
                                (PROGN
                                 (LETT #2# (CONS 1 "failed"))
                                 (GO #5=#:G185)))))))
                           (#4# (|spadConstant| % 12))))
                         ((QREFELT % 10) (SPADCALL |coef| (QREFELT % 95)))
                         (#4# (PROGN (LETT #2# (CONS 1 "failed")) (GO #5#)))))
                  (LETT |z|
                        (SPADCALL
                         (SPADCALL (|spadConstant| % 87)
                                   (SPADCALL |uls| |uls| (QREFELT % 30))
                                   (QREFELT % 90))
                         (QREFELT % 72)))
                  (EXIT
                   (COND ((QEQCAR |z| 1) (CONS 1 "failed"))
                         (#4#
                          (CONS 0
                                (SPADCALL (SPADCALL |cc| (QREFELT % 91))
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |uls| (QREFELT % 92))
                                            (QCDR |z|) (QREFELT % 30))
                                           (QREFELT % 93))
                                          (QREFELT % 96))))))))
            #3# (EXIT #1#)))
          #5# (EXIT #2#)))) 

(SDEFUN |EFULS;tanhIfCan;ULSU;23| ((|uls| (ULS)) (% (|Union| ULS "failed")))
        (SPROG
         ((|uts| (|Union| UTS "failed"))
          (|sc|
           (|Record| (|:| |sinh| (|Stream| |Coef|))
                     (|:| |cosh| (|Stream| |Coef|))))
          (|coshInv| (|Union| ULS "failed")))
         (SEQ (LETT |uts| (SPADCALL |uls| (QREFELT % 40)))
              (EXIT
               (COND ((QEQCAR |uts| 1) (CONS 1 "failed"))
                     (#1='T
                      (SEQ
                       (LETT |sc|
                             (SPADCALL (SPADCALL (QCDR |uts|) (QREFELT % 66))
                                       (QREFELT % 99)))
                       (LETT |coshInv|
                             (SPADCALL
                              (SPADCALL (SPADCALL (QCDR |sc|) (QREFELT % 70))
                                        (QREFELT % 32))
                              (QREFELT % 72)))
                       (EXIT
                        (COND ((QEQCAR |coshInv| 1) (CONS 1 "failed"))
                              (#1#
                               (CONS 0
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL (QCAR |sc|) (QREFELT % 70))
                                       (QREFELT % 32))
                                      (QCDR |coshInv|)
                                      (QREFELT % 30))))))))))))) 

(SDEFUN |EFULS;cothIfCan;ULSU;24| ((|uls| (ULS)) (% (|Union| ULS "failed")))
        (SPROG
         ((|uts| (|Union| UTS "failed"))
          (|sc|
           (|Record| (|:| |sinh| (|Stream| |Coef|))
                     (|:| |cosh| (|Stream| |Coef|))))
          (|sinhInv| (|Union| ULS "failed")))
         (SEQ (LETT |uts| (SPADCALL |uls| (QREFELT % 40)))
              (EXIT
               (COND ((QEQCAR |uts| 1) (CONS 1 "failed"))
                     (#1='T
                      (SEQ
                       (LETT |sc|
                             (SPADCALL (SPADCALL (QCDR |uts|) (QREFELT % 66))
                                       (QREFELT % 99)))
                       (LETT |sinhInv|
                             (SPADCALL
                              (SPADCALL (SPADCALL (QCAR |sc|) (QREFELT % 70))
                                        (QREFELT % 32))
                              (QREFELT % 72)))
                       (EXIT
                        (COND ((QEQCAR |sinhInv| 1) (CONS 1 "failed"))
                              (#1#
                               (CONS 0
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL (QCDR |sc|) (QREFELT % 70))
                                       (QREFELT % 32))
                                      (QCDR |sinhInv|)
                                      (QREFELT % 30))))))))))))) 

(SDEFUN |EFULS;sechIfCan;ULSU;25| ((|uls| (ULS)) (% (|Union| ULS #1="failed")))
        (SPROG ((|cosh| (|Union| ULS #1#)) (|coshInv| (|Union| ULS "failed")))
               (SEQ (LETT |cosh| (SPADCALL |uls| (QREFELT % 54)))
                    (EXIT
                     (COND ((QEQCAR |cosh| 1) (CONS 1 "failed"))
                           (#2='T
                            (SEQ
                             (LETT |coshInv|
                                   (SPADCALL (QCDR |cosh|) (QREFELT % 72)))
                             (EXIT
                              (COND ((QEQCAR |coshInv| 1) (CONS 1 "failed"))
                                    (#2# (CONS 0 (QCDR |coshInv|)))))))))))) 

(SDEFUN |EFULS;cschIfCan;ULSU;26| ((|uls| (ULS)) (% (|Union| ULS #1="failed")))
        (SPROG ((|sinh| (|Union| ULS #1#)) (|sinhInv| (|Union| ULS "failed")))
               (SEQ (LETT |sinh| (SPADCALL |uls| (QREFELT % 52)))
                    (EXIT
                     (COND ((QEQCAR |sinh| 1) (CONS 1 "failed"))
                           (#2='T
                            (SEQ
                             (LETT |sinhInv|
                                   (SPADCALL (QCDR |sinh|) (QREFELT % 72)))
                             (EXIT
                              (COND ((QEQCAR |sinhInv| 1) (CONS 1 "failed"))
                                    (#2# (CONS 0 (QCDR |sinhInv|)))))))))))) 

(SDEFUN |EFULS;acscIfCan;ULSU;27| ((|uls| (ULS)) (% (|Union| ULS #1="failed")))
        (SPROG ((|ord| (|Integer|)) (#2=#:G222 NIL))
               (SEQ (LETT |ord| (SPADCALL |uls| 1 (QREFELT % 77)))
                    (EXIT
                     (COND ((> |ord| 0) (CONS 1 "failed"))
                           ('T
                            (SPADCALL
                             (PROG2 (LETT #2# (SPADCALL |uls| (QREFELT % 72)))
                                 (QCDR #2#)
                               (|check_union2| (QEQCAR #2# 0) (QREFELT % 8)
                                               (|Union| (QREFELT % 8) #1#)
                                               #2#))
                             (QREFELT % 48)))))))) 

(SDEFUN |EFULS;acschIfCan;ULSU;28|
        ((|uls| (ULS)) (% (|Union| ULS #1="failed")))
        (SPROG ((|ord| (|Integer|)) (#2=#:G227 NIL))
               (SEQ (LETT |ord| (SPADCALL |uls| 1 (QREFELT % 77)))
                    (EXIT
                     (COND ((> |ord| 0) (CONS 1 "failed"))
                           ('T
                            (SPADCALL
                             (PROG2 (LETT #2# (SPADCALL |uls| (QREFELT % 72)))
                                 (QCDR #2#)
                               (|check_union2| (QEQCAR #2# 0) (QREFELT % 8)
                                               (|Union| (QREFELT % 8) #1#)
                                               #2#))
                             (QREFELT % 56)))))))) 

(SDEFUN |EFULS;asecIfCan;ULSU;29| ((|uls| (ULS)) (% (|Union| ULS #1="failed")))
        (SPROG ((|ord| (|Integer|)) (#2=#:G232 NIL))
               (SEQ (LETT |ord| (SPADCALL |uls| 1 (QREFELT % 77)))
                    (EXIT
                     (COND ((> |ord| 0) (CONS 1 "failed"))
                           ('T
                            (SPADCALL
                             (PROG2 (LETT #2# (SPADCALL |uls| (QREFELT % 72)))
                                 (QCDR #2#)
                               (|check_union2| (QEQCAR #2# 0) (QREFELT % 8)
                                               (|Union| (QREFELT % 8) #1#)
                                               #2#))
                             (QREFELT % 50)))))))) 

(SDEFUN |EFULS;asechIfCan;ULSU;30|
        ((|uls| (ULS)) (% (|Union| ULS #1="failed")))
        (SPROG ((|ord| (|Integer|)) (#2=#:G237 NIL))
               (SEQ (LETT |ord| (SPADCALL |uls| 1 (QREFELT % 77)))
                    (EXIT
                     (COND ((> |ord| 0) (CONS 1 "failed"))
                           ('T
                            (SPADCALL
                             (PROG2 (LETT #2# (SPADCALL |uls| (QREFELT % 72)))
                                 (QCDR #2#)
                               (|check_union2| (QEQCAR #2# 0) (QREFELT % 8)
                                               (|Union| (QREFELT % 8) #1#)
                                               #2#))
                             (QREFELT % 58)))))))) 

(SDEFUN |EFULS;applyOrError|
        ((|fcn| (|Mapping| #1=(|Union| ULS "failed") ULS)) (|name| (|String|))
         (|uls| (ULS)) (% (ULS)))
        (SPROG ((|ans| #1#))
               (SEQ (LETT |ans| (SPADCALL |uls| |fcn|))
                    (EXIT
                     (COND
                      ((QEQCAR |ans| 1)
                       (|error|
                        (STRCONC |name| " of function with singularity")))
                      ('T (QCDR |ans|))))))) 

(SDEFUN |EFULS;exp;2ULS;32| ((|uls| (ULS)) (% (ULS)))
        (|EFULS;applyOrError| (ELT % 42) "exp" |uls| %)) 

(SDEFUN |EFULS;log;2ULS;33| ((|uls| (ULS)) (% (ULS)))
        (|EFULS;applyOrError| (ELT % 64) "log" |uls| %)) 

(SDEFUN |EFULS;sin;2ULS;34| ((|uls| (ULS)) (% (ULS)))
        (|EFULS;applyOrError| (ELT % 44) "sin" |uls| %)) 

(SDEFUN |EFULS;cos;2ULS;35| ((|uls| (ULS)) (% (ULS)))
        (|EFULS;applyOrError| (ELT % 46) "cos" |uls| %)) 

(SDEFUN |EFULS;tan;2ULS;36| ((|uls| (ULS)) (% (ULS)))
        (|EFULS;applyOrError| (ELT % 73) "tan" |uls| %)) 

(SDEFUN |EFULS;cot;2ULS;37| ((|uls| (ULS)) (% (ULS)))
        (|EFULS;applyOrError| (ELT % 74) "cot" |uls| %)) 

(SDEFUN |EFULS;sec;2ULS;38| ((|uls| (ULS)) (% (ULS)))
        (|EFULS;applyOrError| (ELT % 75) "sec" |uls| %)) 

(SDEFUN |EFULS;csc;2ULS;39| ((|uls| (ULS)) (% (ULS)))
        (|EFULS;applyOrError| (ELT % 76) "csc" |uls| %)) 

(SDEFUN |EFULS;asin;2ULS;40| ((|uls| (ULS)) (% (ULS)))
        (|EFULS;applyOrError| (ELT % 48) "asin" |uls| %)) 

(SDEFUN |EFULS;acos;2ULS;41| ((|uls| (ULS)) (% (ULS)))
        (|EFULS;applyOrError| (ELT % 50) "acos" |uls| %)) 

(SDEFUN |EFULS;asec;2ULS;42| ((|uls| (ULS)) (% (ULS)))
        (|EFULS;applyOrError| (ELT % 106) "asec" |uls| %)) 

(SDEFUN |EFULS;acsc;2ULS;43| ((|uls| (ULS)) (% (ULS)))
        (|EFULS;applyOrError| (ELT % 104) "acsc" |uls| %)) 

(SDEFUN |EFULS;sinh;2ULS;44| ((|uls| (ULS)) (% (ULS)))
        (|EFULS;applyOrError| (ELT % 52) "sinh" |uls| %)) 

(SDEFUN |EFULS;cosh;2ULS;45| ((|uls| (ULS)) (% (ULS)))
        (|EFULS;applyOrError| (ELT % 54) "cosh" |uls| %)) 

(SDEFUN |EFULS;tanh;2ULS;46| ((|uls| (ULS)) (% (ULS)))
        (|EFULS;applyOrError| (ELT % 100) "tanh" |uls| %)) 

(SDEFUN |EFULS;coth;2ULS;47| ((|uls| (ULS)) (% (ULS)))
        (|EFULS;applyOrError| (ELT % 101) "coth" |uls| %)) 

(SDEFUN |EFULS;sech;2ULS;48| ((|uls| (ULS)) (% (ULS)))
        (|EFULS;applyOrError| (ELT % 102) "sech" |uls| %)) 

(SDEFUN |EFULS;csch;2ULS;49| ((|uls| (ULS)) (% (ULS)))
        (|EFULS;applyOrError| (ELT % 103) "csch" |uls| %)) 

(SDEFUN |EFULS;asinh;2ULS;50| ((|uls| (ULS)) (% (ULS)))
        (|EFULS;applyOrError| (ELT % 56) "asinh" |uls| %)) 

(SDEFUN |EFULS;acosh;2ULS;51| ((|uls| (ULS)) (% (ULS)))
        (|EFULS;applyOrError| (ELT % 58) "acosh" |uls| %)) 

(SDEFUN |EFULS;atanh;2ULS;52| ((|uls| (ULS)) (% (ULS)))
        (|EFULS;applyOrError| (ELT % 60) "atanh" |uls| %)) 

(SDEFUN |EFULS;acoth;2ULS;53| ((|uls| (ULS)) (% (ULS)))
        (|EFULS;applyOrError| (ELT % 62) "acoth" |uls| %)) 

(SDEFUN |EFULS;asech;2ULS;54| ((|uls| (ULS)) (% (ULS)))
        (|EFULS;applyOrError| (ELT % 107) "asech" |uls| %)) 

(SDEFUN |EFULS;acsch;2ULS;55| ((|uls| (ULS)) (% (ULS)))
        (|EFULS;applyOrError| (ELT % 105) "acsch" |uls| %)) 

(SDEFUN |EFULS;atan;2ULS;56| ((|uls| (ULS)) (% (ULS)))
        (SPROG
         ((|coef| (|Coef|)) (|ord| (|Integer|)) (#1=#:G379 NIL) (|lc| (|Coef|))
          (|rat| (|Union| (|Fraction| (|Integer|)) "failed")) (|cc| (|Coef|))
          (|z| (|Union| ULS "failed")))
         (SEQ
          (EXIT
           (SEQ (LETT |coef| (SPADCALL |uls| 0 (QREFELT % 26)))
                (SEQ (LETT |ord| (SPADCALL |uls| 0 (QREFELT % 77)))
                     (EXIT
                      (COND
                       ((EQL |ord| 0)
                        (COND
                         ((SPADCALL (SPADCALL |coef| |coef| (QREFELT % 78))
                                    (SPADCALL (|spadConstant| % 16)
                                              (QREFELT % 79))
                                    (QREFELT % 18))
                          (PROGN
                           (LETT #1#
                                 (|error|
                                  "atan: series expansion has logarithmic term"))
                           (GO #2=#:G377))))))))
                (LETT |cc|
                      (COND
                       ((< |ord| 0)
                        (COND
                         ((QREFELT % 10)
                          (COND
                           ((QREFELT % 11)
                            (SEQ
                             (LETT |lc| (SPADCALL |uls| |ord| (QREFELT % 26)))
                             (LETT |rat| (SPADCALL |lc| (QREFELT % 81)))
                             (EXIT
                              (COND
                               ((OR (QEQCAR |rat| 1)
                                    (SPADCALL (QCDR |rat|)
                                              (|spadConstant| % 85)
                                              (QREFELT % 86)))
                                (SPADCALL (SPADCALL 1 2 (QREFELT % 82))
                                          (SPADCALL (QREFELT % 83))
                                          (QREFELT % 84)))
                               ('T
                                (SPADCALL
                                 (SPADCALL (SPADCALL 1 2 (QREFELT % 82))
                                           (QREFELT % 88))
                                 (SPADCALL (QREFELT % 83)) (QREFELT % 84)))))))
                           (#3='T
                            (SPADCALL (SPADCALL 1 2 (QREFELT % 82))
                                      (SPADCALL (QREFELT % 83))
                                      (QREFELT % 84)))))
                         (#3#
                          (|error|
                           "atan: series expansion involves transcendental constants"))))
                       ((SPADCALL |coef| (|spadConstant| % 12) (QREFELT % 18))
                        (|spadConstant| % 12))
                       ((QREFELT % 10) (SPADCALL |coef| (QREFELT % 89)))
                       (#3#
                        (|error|
                         "atan: series expansion involves transcendental constants"))))
                (LETT |z|
                      (SPADCALL
                       (SPADCALL (|spadConstant| % 87)
                                 (SPADCALL |uls| |uls| (QREFELT % 30))
                                 (QREFELT % 90))
                       (QREFELT % 72)))
                (EXIT
                 (COND
                  ((QEQCAR |z| 1)
                   (|error| "atan: leading coefficient not invertible"))
                  (#3#
                   (SPADCALL (SPADCALL |cc| (QREFELT % 91))
                             (SPADCALL
                              (SPADCALL (SPADCALL |uls| (QREFELT % 92))
                                        (QCDR |z|) (QREFELT % 30))
                              (QREFELT % 93))
                             (QREFELT % 90)))))))
          #2# (EXIT #1#)))) 

(SDEFUN |EFULS;acot;2ULS;57| ((|uls| (ULS)) (% (ULS)))
        (SPROG
         ((|coef| (|Coef|)) (|ord| (|Integer|)) (#1=#:G392 NIL) (|lc| (|Coef|))
          (|rat| (|Union| (|Fraction| (|Integer|)) "failed")) (|cc| (|Coef|))
          (|z| (|Union| ULS "failed")))
         (SEQ
          (EXIT
           (SEQ (LETT |coef| (SPADCALL |uls| 0 (QREFELT % 26)))
                (SEQ (LETT |ord| (SPADCALL |uls| 0 (QREFELT % 77)))
                     (EXIT
                      (COND
                       ((EQL |ord| 0)
                        (COND
                         ((SPADCALL (SPADCALL |coef| |coef| (QREFELT % 78))
                                    (SPADCALL (|spadConstant| % 16)
                                              (QREFELT % 79))
                                    (QREFELT % 18))
                          (PROGN
                           (LETT #1#
                                 (|error|
                                  "acot: series expansion has logarithmic term"))
                           (GO #2=#:G390))))))))
                (LETT |cc|
                      (COND
                       ((< |ord| 0)
                        (COND
                         ((QREFELT % 11)
                          (SEQ
                           (LETT |lc| (SPADCALL |uls| |ord| (QREFELT % 26)))
                           (LETT |rat| (SPADCALL |lc| (QREFELT % 81)))
                           (EXIT
                            (COND
                             ((OR (QEQCAR |rat| 1)
                                  (SPADCALL (QCDR |rat|) (|spadConstant| % 85)
                                            (QREFELT % 86)))
                              (|spadConstant| % 12))
                             ((QREFELT % 10) (SPADCALL (QREFELT % 83)))
                             (#3='T
                              (|error|
                               "acot: series expansion involves transcendental constants"))))))
                         (#3# (|spadConstant| % 12))))
                       ((QREFELT % 10) (SPADCALL |coef| (QREFELT % 95)))
                       (#3#
                        (|error|
                         "acot: series expansion involves transcendental constants"))))
                (LETT |z|
                      (SPADCALL
                       (SPADCALL (|spadConstant| % 87)
                                 (SPADCALL |uls| |uls| (QREFELT % 30))
                                 (QREFELT % 90))
                       (QREFELT % 72)))
                (EXIT
                 (COND
                  ((QEQCAR |z| 1)
                   (|error| "acot: leading coefficient not invertible"))
                  (#3#
                   (SPADCALL (SPADCALL |cc| (QREFELT % 91))
                             (SPADCALL
                              (SPADCALL (SPADCALL |uls| (QREFELT % 92))
                                        (QCDR |z|) (QREFELT % 30))
                              (QREFELT % 93))
                             (QREFELT % 96)))))))
          #2# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |ElementaryFunctionsUnivariateLaurentSeries;|)) 

(DEFUN |ElementaryFunctionsUnivariateLaurentSeries;| (|#1| |#2| |#3|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT DV$3 (|devaluate| |#3|))
          (LETT |dv$|
                (LIST '|ElementaryFunctionsUnivariateLaurentSeries| DV$1 DV$2
                      DV$3))
          (LETT % (GETREFV 134))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|Field|))))))
          (|haddProp| |$ConstructorCache|
                      '|ElementaryFunctionsUnivariateLaurentSeries|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (QSETREFV % 8 |#3|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 9
                    (|HasSignature| |#1|
                                    (LIST '^
                                          (LIST (|devaluate| |#1|)
                                                (|devaluate| |#1|)
                                                '(|Fraction| (|Integer|))))))
          (QSETREFV % 10
                    (|HasCategory| |#1| '(|TranscendentalFunctionCategory|)))
          (QSETREFV % 11
                    (|HasSignature| |#1|
                                    (LIST '|retractIfCan|
                                          (LIST
                                           (LIST '|Union|
                                                 '(|Fraction| (|Integer|))
                                                 (|devaluate| "failed"))
                                           (|devaluate| |#1|)))))
          (COND
           ((|testBitVector| |pv$| 1)
            (QSETREFV % 38 (CONS (|dispatchFunction| |EFULS;^;ULSFULS;3|) %))))
          %))) 

(DEFUN |ElementaryFunctionsUnivariateLaurentSeries| (&REST #1=#:G393)
  (SPROG NIL
         (PROG (#2=#:G394)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ElementaryFunctionsUnivariateLaurentSeries|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function|
                        |ElementaryFunctionsUnivariateLaurentSeries;|)
                       #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|ElementaryFunctionsUnivariateLaurentSeries|)))))))))) 

(MAKEPROP '|ElementaryFunctionsUnivariateLaurentSeries| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) 'RATPOWERS 'TRANSFCN 'RATS (0 . |0|) (4 . |0|)
              (|NonNegativeInteger|) (8 . |coefficient|) (14 . |1|) (|Boolean|)
              (18 . =) (|Integer|) (|Fraction| 19) (24 . |coerce|) (29 . |inv|)
              (34 . ^) (40 . |1|) (44 . |degree|) (49 . |coefficient|)
              (55 . |zero?|) (60 . |removeZeroes|) (66 . |monomial|) (72 . *)
              (78 . |taylor|) (83 . |coerce|) (|Union| 8 '"failed")
              |EFULS;nthRootIfCan;ULSNniU;2| (88 . |numer|) (93 . |denom|)
              (98 . ^) (104 . ^) (|Union| 7 '"failed") (110 . |taylorIfCan|)
              (115 . |exp|) |EFULS;expIfCan;ULSU;5| (120 . |sin|)
              |EFULS;sinIfCan;ULSU;6| (125 . |cos|) |EFULS;cosIfCan;ULSU;7|
              (130 . |asin|) |EFULS;asinIfCan;ULSU;8| (135 . |acos|)
              |EFULS;acosIfCan;ULSU;9| (140 . |sinh|) |EFULS;sinhIfCan;ULSU;10|
              (145 . |cosh|) |EFULS;coshIfCan;ULSU;11| (150 . |asinh|)
              |EFULS;asinhIfCan;ULSU;12| (155 . |acosh|)
              |EFULS;acoshIfCan;ULSU;13| (160 . |atanh|)
              |EFULS;atanhIfCan;ULSU;14| (165 . |acoth|)
              |EFULS;acothIfCan;ULSU;15| (170 . |log|) |EFULS;logIfCan;ULSU;16|
              (|Stream| 6) (175 . |coefficients|)
              (|Record| (|:| |sin| 65) (|:| |cos| 65))
              (|StreamTranscendentalFunctions| 6) (180 . |sincos|)
              (185 . |series|) (|Union| % '"failed") (190 . |recip|)
              |EFULS;tanIfCan;ULSU;17| |EFULS;cotIfCan;ULSU;18|
              |EFULS;secIfCan;ULSU;19| |EFULS;cscIfCan;ULSU;20| (195 . |order|)
              (201 . *) (207 . -) (|Union| 20 '"failed") (212 . |retractIfCan|)
              (217 . /) (223 . |pi|) (227 . *) (233 . |0|) (237 . >)
              (243 . |1|) (247 . -) (252 . |atan|) (257 . +) (263 . |coerce|)
              (268 . |differentiate|) (273 . |integrate|)
              |EFULS;atanIfCan;ULSU;21| (278 . |acot|) (283 . -)
              |EFULS;acotIfCan;ULSU;22|
              (|Record| (|:| |sinh| 65) (|:| |cosh| 65)) (289 . |sinhcosh|)
              |EFULS;tanhIfCan;ULSU;23| |EFULS;cothIfCan;ULSU;24|
              |EFULS;sechIfCan;ULSU;25| |EFULS;cschIfCan;ULSU;26|
              |EFULS;acscIfCan;ULSU;27| |EFULS;acschIfCan;ULSU;28|
              |EFULS;asecIfCan;ULSU;29| |EFULS;asechIfCan;ULSU;30|
              |EFULS;exp;2ULS;32| |EFULS;log;2ULS;33| |EFULS;sin;2ULS;34|
              |EFULS;cos;2ULS;35| |EFULS;tan;2ULS;36| |EFULS;cot;2ULS;37|
              |EFULS;sec;2ULS;38| |EFULS;csc;2ULS;39| |EFULS;asin;2ULS;40|
              |EFULS;acos;2ULS;41| |EFULS;asec;2ULS;42| |EFULS;acsc;2ULS;43|
              |EFULS;sinh;2ULS;44| |EFULS;cosh;2ULS;45| |EFULS;tanh;2ULS;46|
              |EFULS;coth;2ULS;47| |EFULS;sech;2ULS;48| |EFULS;csch;2ULS;49|
              |EFULS;asinh;2ULS;50| |EFULS;acosh;2ULS;51| |EFULS;atanh;2ULS;52|
              |EFULS;acoth;2ULS;53| |EFULS;asech;2ULS;54| |EFULS;acsch;2ULS;55|
              |EFULS;atan;2ULS;56| |EFULS;acot;2ULS;57|)
           '#(|tanhIfCan| 294 |tanh| 299 |tanIfCan| 304 |tan| 309 |sinhIfCan|
              314 |sinh| 319 |sinIfCan| 324 |sin| 329 |sechIfCan| 334 |sech|
              339 |secIfCan| 344 |sec| 349 |nthRootIfCan| 354 |logIfCan| 360
              |log| 365 |expIfCan| 370 |exp| 375 |cschIfCan| 380 |csch| 385
              |cscIfCan| 390 |csc| 395 |cothIfCan| 400 |coth| 405 |cotIfCan|
              410 |cot| 415 |coshIfCan| 420 |cosh| 425 |cosIfCan| 430 |cos| 435
              |atanhIfCan| 440 |atanh| 445 |atanIfCan| 450 |atan| 455
              |asinhIfCan| 460 |asinh| 465 |asinIfCan| 470 |asin| 475
              |asechIfCan| 480 |asech| 485 |asecIfCan| 490 |asec| 495
              |acschIfCan| 500 |acsch| 505 |acscIfCan| 510 |acsc| 515
              |acothIfCan| 520 |acoth| 525 |acotIfCan| 530 |acot| 535
              |acoshIfCan| 540 |acosh| 545 |acosIfCan| 550 |acos| 555 ^ 560)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS '#((|PartialTranscendentalFunctions| 8))
                             (|makeByteWordVec2| 133
                                                 '(0 6 0 12 0 7 0 13 2 7 6 0 14
                                                   15 0 6 0 16 2 6 17 0 0 18 1
                                                   20 0 19 21 1 20 0 0 22 2 7 0
                                                   0 20 23 0 7 0 24 1 8 19 0 25
                                                   2 8 6 0 19 26 1 6 17 0 27 2
                                                   8 0 19 0 28 2 8 0 6 19 29 2
                                                   8 0 0 0 30 1 8 7 0 31 1 8 0
                                                   7 32 1 20 19 0 35 1 20 19 0
                                                   36 2 8 0 0 19 37 2 0 8 8 20
                                                   38 1 8 39 0 40 1 7 0 0 41 1
                                                   7 0 0 43 1 7 0 0 45 1 7 0 0
                                                   47 1 7 0 0 49 1 7 0 0 51 1 7
                                                   0 0 53 1 7 0 0 55 1 7 0 0 57
                                                   1 7 0 0 59 1 7 0 0 61 1 7 0
                                                   0 63 1 7 65 0 66 1 68 67 65
                                                   69 1 7 0 65 70 1 8 71 0 72 2
                                                   8 19 0 19 77 2 6 0 0 0 78 1
                                                   6 0 0 79 1 6 80 0 81 2 20 0
                                                   19 19 82 0 6 0 83 2 6 0 20 0
                                                   84 0 20 0 85 2 20 17 0 0 86
                                                   0 8 0 87 1 20 0 0 88 1 6 0 0
                                                   89 2 8 0 0 0 90 1 8 0 6 91 1
                                                   8 0 0 92 1 8 0 0 93 1 6 0 0
                                                   95 2 8 0 0 0 96 1 68 98 65
                                                   99 1 0 33 8 100 1 0 8 8 122
                                                   1 0 33 8 73 1 0 8 8 112 1 0
                                                   33 8 52 1 0 8 8 120 1 0 33 8
                                                   44 1 0 8 8 110 1 0 33 8 102
                                                   1 0 8 8 124 1 0 33 8 75 1 0
                                                   8 8 114 2 0 33 8 14 34 1 0
                                                   33 8 64 1 0 8 8 109 1 0 33 8
                                                   42 1 0 8 8 108 1 0 33 8 103
                                                   1 0 8 8 125 1 0 33 8 76 1 0
                                                   8 8 115 1 0 33 8 101 1 0 8 8
                                                   123 1 0 33 8 74 1 0 8 8 113
                                                   1 0 33 8 54 1 0 8 8 121 1 0
                                                   33 8 46 1 0 8 8 111 1 0 33 8
                                                   60 1 0 8 8 128 1 0 33 8 94 1
                                                   0 8 8 132 1 0 33 8 56 1 0 8
                                                   8 126 1 0 33 8 48 1 0 8 8
                                                   116 1 0 33 8 107 1 0 8 8 130
                                                   1 0 33 8 106 1 0 8 8 118 1 0
                                                   33 8 105 1 0 8 8 131 1 0 33
                                                   8 104 1 0 8 8 119 1 0 33 8
                                                   62 1 0 8 8 129 1 0 33 8 97 1
                                                   0 8 8 133 1 0 33 8 58 1 0 8
                                                   8 127 1 0 33 8 50 1 0 8 8
                                                   117 2 1 8 8 20 38)))))
           '|lookupComplete|)) 
