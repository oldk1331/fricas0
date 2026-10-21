
(SDEFUN |FFCAT-;Q2RF| ((|q| (|Fraction| F)) (% (|Fraction| UP)))
        (SPADCALL (SPADCALL (SPADCALL |q| (QREFELT % 11)) (QREFELT % 12))
                  (SPADCALL (SPADCALL |q| (QREFELT % 13)) (QREFELT % 12))
                  (QREFELT % 15))) 

(SDEFUN |FFCAT-;infOrder| ((|f| (|Fraction| UP)) (% (|Integer|)))
        (- (SPADCALL (SPADCALL |f| (QREFELT % 16)) (QREFELT % 18))
           (SPADCALL (SPADCALL |f| (QREFELT % 19)) (QREFELT % 18)))) 

(SDEFUN |FFCAT-;integral?;SB;3| ((|f| (S)) (% (|Boolean|)))
        (SPADCALL (QCDR (SPADCALL |f| (QREFELT % 21))) (QREFELT % 23))) 

(SDEFUN |FFCAT-;integral?;SFB;4| ((|f| (S)) (|a| (F)) (% (|Boolean|)))
        (SPADCALL
         (SPADCALL (QCDR (SPADCALL |f| (QREFELT % 21))) |a| (QREFELT % 25))
         (|spadConstant| % 26) (QREFELT % 27))) 

(SDEFUN |FFCAT-;absolutelyIrreducible?;B;5| ((% (|Boolean|)))
        (EQL (SPADCALL (QREFELT % 29)) 1)) 

(SDEFUN |FFCAT-;yCoordinates;SR;6|
        ((|f| (S)) (% (|Record| (|:| |num| (|Vector| UP)) (|:| |den| UP))))
        (SPADCALL (SPADCALL |f| (QREFELT % 32)) (QREFELT % 34))) 

(SDEFUN |FFCAT-;hyperelliptic;U;7| ((% (|Union| UP "failed")))
        (SPROG
         ((|f| (UPUP)) (|u| (|Union| (|Fraction| UP) "failed"))
          (|v| (|Union| UP "failed")) (|p| (UP)))
         (SEQ
          (COND
           ((SPADCALL
             (SPADCALL (LETT |f| (SPADCALL (QREFELT % 36))) (QREFELT % 37)) 2
             (QREFELT % 38))
            (CONS 1 "failed"))
           (#1='T
            (SEQ
             (LETT |u| (SPADCALL (SPADCALL |f| (QREFELT % 39)) (QREFELT % 41)))
             (EXIT
              (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                    (#1#
                     (SEQ
                      (LETT |v|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (QCDR |u|)
                                        (SPADCALL |f| (QREFELT % 42))
                                        (QREFELT % 43))
                              (QREFELT % 44))
                             (QREFELT % 46)))
                      (EXIT
                       (COND
                        ((OR (QEQCAR |v| 1)
                             (NULL
                              (ODDP
                               (SPADCALL (LETT |p| (QCDR |v|))
                                         (QREFELT % 18)))))
                         (CONS 1 "failed"))
                        ('T (CONS 0 |p|)))))))))))))) 

(SDEFUN |FFCAT-;algSplitSimple;SMR;8|
        ((|f| (S)) (|derivation| (|Mapping| UP UP))
         (%
          (|Record| (|:| |num| S) (|:| |den| UP) (|:| |derivden| UP)
                    (|:| |gd| UP))))
        (SPROG
         ((|cd| (|Record| (|:| |num| UPUP) (|:| |den| UP))) (|g| (UP))
          (#1=#:G57 NIL) (|dd| (UP)))
         (SEQ
          (LETT |cd| (SPADCALL (SPADCALL |f| (QREFELT % 48)) (QREFELT % 51)))
          (LETT |dd|
                (PROG2
                    (LETT #1#
                          (SPADCALL (QCDR |cd|)
                                    (LETT |g|
                                          (SPADCALL (QCDR |cd|)
                                                    (SPADCALL (QCDR |cd|)
                                                              |derivation|)
                                                    (QREFELT % 52)))
                                    (QREFELT % 54)))
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0) (QREFELT % 8)
                                  (|Union| (QREFELT % 8) "failed") #1#)))
          (EXIT
           (VECTOR
            (SPADCALL
             (SPADCALL (SPADCALL (SPADCALL |g| (QREFELT % 55)) (QREFELT % 56))
                       (QCAR |cd|) (QREFELT % 57))
             (QREFELT % 58))
            |dd| (SPADCALL |dd| |derivation|)
            (SPADCALL |dd| (SPADCALL (SPADCALL (QREFELT % 59)) (QREFELT % 60))
                      (QREFELT % 52))))))) 

(SDEFUN |FFCAT-;elliptic;U;9| ((% (|Union| UP "failed")))
        (SPROG ((|u| (|Union| UP "failed")) (|p| (UP)))
               (SEQ (LETT |u| (SPADCALL (QREFELT % 64)))
                    (EXIT
                     (COND
                      ((OR (QEQCAR |u| 1)
                           (NULL
                            (EQL
                             (SPADCALL (LETT |p| (QCDR |u|)) (QREFELT % 18))
                             3)))
                       (CONS 1 "failed"))
                      ('T (CONS 0 |p|))))))) 

(SDEFUN |FFCAT-;rationalPoint?;2FB;10| ((|x| (F)) (|y| (F)) (% (|Boolean|)))
        (SPADCALL
         (SPADCALL
          (SPADCALL (SPADCALL (QREFELT % 36))
                    (SPADCALL (SPADCALL |y| (QREFELT % 12)) (QREFELT % 55))
                    (QREFELT % 66))
          (SPADCALL (SPADCALL |x| (QREFELT % 12)) (QREFELT % 55))
          (QREFELT % 68))
         (QREFELT % 69))) 

(SDEFUN |FFCAT-;UP2P| ((|p| (UP)) (|x| (|Polynomial| F)) (% (|Polynomial| F)))
        (SPADCALL (SPADCALL (ELT % 72) |p| (QREFELT % 76)) |x| (QREFELT % 77))) 

(SDEFUN |FFCAT-;UPUP2P|
        ((|p| (UPUP)) (|x| (|Polynomial| F)) (|y| (|Polynomial| F))
         (% (|Polynomial| F)))
        (SPROG NIL
               (SPADCALL
                (SPADCALL (CONS #'|FFCAT-;UPUP2P!0| (VECTOR |x| %)) |p|
                          (QREFELT % 80))
                |y| (QREFELT % 77)))) 

(SDEFUN |FFCAT-;UPUP2P!0| ((|s| NIL) ($$ NIL))
        (PROG (% |x|)
          (LETT % (QREFELT $$ 1))
          (LETT |x| (QREFELT $$ 0))
          (RETURN (PROGN (|FFCAT-;UP2P| (SPADCALL |s| (QREFELT % 60)) |x| %))))) 

(SDEFUN |FFCAT-;nonSingularModel;SL;13|
        ((|u| (|Symbol|)) (% (|List| (|Polynomial| F))))
        (SPROG
         ((|w| (|Vector| S)) (|d| (|Fraction| UP)) (#1=#:G86 NIL)
          (|n| (|Integer|)) (#2=#:G87 NIL) (|vars| (|List| (|Symbol|)))
          (|x| (|Symbol|)) (|y| (|Symbol|)) (#3=#:G88 NIL) (|i| NIL)
          (#4=#:G90 NIL) (|v| NIL) (#5=#:G89 NIL))
         (SEQ
          (LETT |d|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (LETT |w| (SPADCALL (QREFELT % 82)))
                            (QREFELT % 84))
                  (QREFELT % 86))
                 (QREFELT % 55)))
          (LETT |vars|
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |i| 1) (LETT #2# (LETT |n| (QVSIZE |w|))) G190
                      (COND ((|greater_SI| |i| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS
                               (SPADCALL
                                (STRCONC (SPADCALL |u| (QREFELT % 89))
                                         (STRINGIMAGE |i|))
                                (QREFELT % 90))
                               #1#))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                      (EXIT (NREVERSE #1#)))))
          (LETT |x| '|%%dummy1|) (LETT |y| '|%%dummy2|)
          (EXIT
           (SPADCALL
            (CONS #'|FFCAT-;nonSingularModel;SL;13!0| (VECTOR |y| % |x|))
            (SPADCALL
             (PROGN
              (LETT #3# NIL)
              (SEQ (LETT |i| 1) (LETT #4# |n|) (LETT |v| NIL) (LETT #5# |vars|)
                   G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |v| (CAR #5#)) NIL)
                         (|greater_SI| |i| #4#))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT #3#
                           (CONS
                            (SPADCALL (SPADCALL |v| (QREFELT % 93))
                                      (|FFCAT-;UPUP2P|
                                       (SPADCALL
                                        (SPADCALL |d|
                                                  (SPADCALL |w| |i|
                                                            (QREFELT % 96))
                                                  (QREFELT % 97))
                                        (QREFELT % 48))
                                       (SPADCALL |x| (QREFELT % 93))
                                       (SPADCALL |y| (QREFELT % 93)) %)
                                      (QREFELT % 98))
                            #3#))))
                   (LETT #5# (PROG1 (CDR #5#) (LETT |i| (|inc_SI| |i|))))
                   (GO G190) G191 (EXIT (NREVERSE #3#))))
             (SPADCALL (LIST |x| |y|) |vars| (QREFELT % 100)) (QREFELT % 103))
            (QREFELT % 105)))))) 

(SDEFUN |FFCAT-;nonSingularModel;SL;13!0| ((|s| NIL) ($$ NIL))
        (PROG (|x| % |y|)
          (LETT |x| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |y| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (COND
             ((SPADCALL (SPADCALL |s| |x| (QREFELT % 91)) (QREFELT % 92))
              (SPADCALL (SPADCALL |s| |y| (QREFELT % 91)) (QREFELT % 92)))
             ('T NIL)))))) 

(SDEFUN |FFCAT-;ispoint| ((|p| (UPUP)) (|x| (F)) (|y| (F)) (% (|List| F)))
        (SPROG ((|jhd| (|Fraction| UP)))
               (SEQ
                (LETT |jhd|
                      (SPADCALL |p|
                                (SPADCALL (SPADCALL |y| (QREFELT % 12))
                                          (QREFELT % 55))
                                (QREFELT % 66)))
                (EXIT
                 (COND
                  ((SPADCALL
                    (SPADCALL |jhd|
                              (SPADCALL (SPADCALL |x| (QREFELT % 12))
                                        (QREFELT % 55))
                              (QREFELT % 68))
                    (QREFELT % 69))
                   (LIST |x| |y|))
                  ('T NIL)))))) 

(SDEFUN |FFCAT-;rationalPoints;L;15| ((% (|List| (|List| F))))
        (SPROG
         ((|p| (UPUP)) (#1=#:G104 NIL) (|x| NIL) (#2=#:G105 NIL)
          (#3=#:G106 NIL) (|y| NIL) (#4=#:G107 NIL) (#5=#:G96 NIL)
          (#6=#:G98 NIL) (|pt| (|List| F)))
         (SEQ (LETT |p| (SPADCALL (QREFELT % 36)))
              (EXIT
               (SPADCALL
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |x| 1) (LETT #2# (SPADCALL (QREFELT % 107))) G190
                      (COND ((|greater_SI| |x| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS
                               (PROGN
                                (LETT #3# NIL)
                                (SEQ (LETT |y| 1)
                                     (LETT #4# (SPADCALL (QREFELT % 107))) G190
                                     (COND ((|greater_SI| |y| #4#) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (COND
                                        ((NULL
                                          (NULL
                                           (LETT |pt|
                                                 (|FFCAT-;ispoint| |p|
                                                  (SPADCALL
                                                   (PROG1 (LETT #5# |x|)
                                                     (|check_subtype2|
                                                      (> #5# 0)
                                                      '(|PositiveInteger|)
                                                      '(|NonNegativeInteger|)
                                                      #5#))
                                                   (QREFELT % 109))
                                                  (SPADCALL
                                                   (PROG1 (LETT #6# |y|)
                                                     (|check_subtype2|
                                                      (> #6# 0)
                                                      '(|PositiveInteger|)
                                                      '(|NonNegativeInteger|)
                                                      #6#))
                                                   (QREFELT % 109))
                                                  %))))
                                         (LETT #3# (CONS |pt| #3#))))))
                                     (LETT |y| (|inc_SI| |y|)) (GO G190) G191
                                     (EXIT (NREVERSE #3#))))
                               #1#))))
                      (LETT |x| (|inc_SI| |x|)) (GO G190) G191
                      (EXIT (NREVERSE #1#))))
                (QREFELT % 112)))))) 

(SDEFUN |FFCAT-;intvalue| ((|v| (|Vector| UP)) (|x| (F)) (|y| (F)) (% (F)))
        (SPROG
         ((|w| (|Vector| S)) (|mini| (|Integer|)) (#1=#:G124 NIL)
          (#2=#:G110 (S)) (#3=#:G108 (S)) (#4=#:G109 NIL)
          (|rec| (|Record| (|:| |num| (|Vector| UP)) (|:| |den| UP))) (|i| NIL)
          (#5=#:G125 NIL) (#6=#:G116 NIL) (#7=#:G114 (F)) (#8=#:G112 (F))
          (#9=#:G113 NIL) (|n| (F)) (|d| (F)) (#10=#:G119 NIL))
         (SEQ
          (COND ((SPADCALL |x| (QREFELT % 114)) (|error| "Point is singular"))
                (#11='T
                 (SEQ
                  (LETT |mini|
                        (SPADCALL (LETT |w| (SPADCALL (QREFELT % 82)))
                                  (QREFELT % 115)))
                  (LETT |rec|
                        (SPADCALL
                         (PROGN
                          (LETT #4# NIL)
                          (SEQ (LETT |i| |mini|) (LETT #1# (QVSIZE |w|)) G190
                               (COND ((> |i| #1#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (PROGN
                                  (LETT #2#
                                        (SPADCALL
                                         (SPADCALL (QAREF1O |v| |i| 1)
                                                   (QREFELT % 55))
                                         (QAREF1O |w| |i| 1) (QREFELT % 97)))
                                  (COND
                                   (#4#
                                    (LETT #3#
                                          (SPADCALL #3# #2# (QREFELT % 116))))
                                   ('T
                                    (PROGN (LETT #3# #2#) (LETT #4# 'T)))))))
                               (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                          (COND (#4# #3#) (#11# (|spadConstant| % 117))))
                         (QREFELT % 118)))
                  (LETT |n|
                        (PROGN
                         (LETT #9# NIL)
                         (SEQ (LETT |i| |mini|) (LETT #5# (QVSIZE |w|)) G190
                              (COND ((> |i| #5#) (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #7#
                                       (SPADCALL
                                        (SPADCALL (QAREF1O (QCAR |rec|) |i| 1)
                                                  |x| (QREFELT % 25))
                                        (SPADCALL |y|
                                                  (PROG1
                                                      (LETT #6# (- |i| |mini|))
                                                    (|check_subtype2|
                                                     (>= #6# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #6#))
                                                  (QREFELT % 119))
                                        (QREFELT % 120)))
                                 (COND
                                  (#9#
                                   (LETT #8#
                                         (SPADCALL #8# #7# (QREFELT % 121))))
                                  ('T (PROGN (LETT #8# #7#) (LETT #9# 'T)))))))
                              (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                         (COND (#9# #8#) (#11# (|spadConstant| % 26)))))
                  (EXIT
                   (COND
                    ((SPADCALL
                      (LETT |d| (SPADCALL (QCDR |rec|) |x| (QREFELT % 25)))
                      (QREFELT % 122))
                     (COND
                      ((SPADCALL |n| (QREFELT % 122))
                       (|error| "0/0 -- cannot compute value yet"))
                      (#11# (|error| "Shouldn't happen"))))
                    (#11#
                     (PROG2 (LETT #10# (SPADCALL |n| |d| (QREFELT % 123)))
                         (QCDR #10#)
                       (|check_union2| (QEQCAR #10# 0) (QREFELT % 7)
                                       (|Union| (QREFELT % 7) "failed")
                                       #10#))))))))))) 

(SDEFUN |FFCAT-;elt;S3F;17| ((|f| (S)) (|x| (F)) (|y| (F)) (% (F)))
        (SPROG
         ((|rec| (|Record| (|:| |num| (|Vector| UP)) (|:| |den| UP))) (|n| (F))
          (|d| (F)) (#1=#:G129 NIL))
         (SEQ (LETT |rec| (SPADCALL |f| (QREFELT % 21)))
              (LETT |n| (|FFCAT-;intvalue| (QCAR |rec|) |x| |y| %))
              (EXIT
               (COND
                ((SPADCALL
                  (LETT |d| (SPADCALL (QCDR |rec|) |x| (QREFELT % 25)))
                  (QREFELT % 122))
                 (COND
                  ((SPADCALL |n| (QREFELT % 122))
                   (|error| "0/0 -- cannot compute value yet"))
                  (#2='T (|error| "Function has a pole at the given point"))))
                (#2#
                 (PROG2 (LETT #1# (SPADCALL |n| |d| (QREFELT % 123)))
                     (QCDR #1#)
                   (|check_union2| (QEQCAR #1# 0) (QREFELT % 7)
                                   (|Union| (QREFELT % 7) "failed") #1#)))))))) 

(SDEFUN |FFCAT-;primitivePart;2S;18| ((|f| (S)) (% (S)))
        (SPROG
         ((|cd| (|Record| (|:| |num| (|Vector| UP)) (|:| |den| UP)))
          (#1=#:G142 NIL) (#2=#:G143 NIL) (|d| (UP)) (#3=#:G145 NIL) (|i| NIL)
          (#4=#:G146 NIL) (#5=#:G144 NIL))
         (SEQ (LETT |cd| (SPADCALL |f| (QREFELT % 118)))
              (LETT |d|
                    (SPADCALL
                     (SPADCALL
                      (PROGN
                       (LETT #1# NIL)
                       (SEQ (LETT |i| (SPADCALL (QCAR |cd|) (QREFELT % 126)))
                            (LETT #2# (QVSIZE (QCAR |cd|))) G190
                            (COND ((> |i| #2#) (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #1#
                                    (CONS
                                     (SPADCALL (QAREF1O (QCAR |cd|) |i| 1)
                                               (QREFELT % 127))
                                     #1#))))
                            (LETT |i| (+ |i| 1)) (GO G190) G191
                            (EXIT (NREVERSE #1#))))
                      (QREFELT % 128))
                     (SPADCALL (QCDR |cd|) (QREFELT % 129)) (QREFELT % 130)))
              (EXIT
               (SPADCALL
                (PROGN
                 (LETT #3#
                       (GETREFV
                        (|inc_SI|
                         (- #6=(QVSIZE (QCAR |cd|))
                            #7=(SPADCALL (QCAR |cd|) (QREFELT % 126))))))
                 (SEQ (LETT |i| #7#) (LETT #4# #6#) (LETT #5# 0) G190
                      (COND ((> |i| #4#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #3# #5#
                                (SPADCALL (QAREF1O (QCAR |cd|) |i| 1) |d|
                                          (QREFELT % 15)))))
                      (LETT #5# (PROG1 (|inc_SI| #5#) (LETT |i| (+ |i| 1))))
                      (GO G190) G191 (EXIT NIL))
                 #3#)
                (QREFELT % 131)))))) 

(SDEFUN |FFCAT-;reduceBasisAtInfinity;2V;19|
        ((|b| (|Vector| S)) (% (|Vector| S)))
        (SPROG
         ((|x| (|Fraction| UP)) (#1=#:G153 NIL) (|i| NIL) (#2=#:G154 NIL)
          (#3=#:G155 NIL) (|j| NIL) (|f| (S)))
         (SEQ
          (LETT |x|
                (SPADCALL (SPADCALL (|spadConstant| % 134) 1 (QREFELT % 135))
                          (QREFELT % 55)))
          (EXIT
           (SPADCALL
            (PROGN
             (LETT #1# NIL)
             (SEQ (LETT |i| (SPADCALL |b| (QREFELT % 115)))
                  (LETT #2# (QVSIZE |b|)) G190 (COND ((> |i| #2#) (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #1#
                          (CONS
                           (LIST2VEC
                            (PROGN
                             (LETT #3# NIL)
                             (SEQ (LETT |j| 0) G190
                                  (COND
                                   ((NULL
                                     (SPADCALL
                                      (LETT |f|
                                            (SPADCALL
                                             (SPADCALL |x| |j| (QREFELT % 136))
                                             (QAREF1O |b| |i| 1)
                                             (QREFELT % 97)))
                                      (QREFELT % 137)))
                                    (GO G191)))
                                  (SEQ (EXIT (LETT #3# (CONS |f| #3#))))
                                  (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                  (EXIT (NREVERSE #3#)))))
                           #1#))))
                  (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT (NREVERSE #1#))))
            (QREFELT % 138)))))) 

(SDEFUN |FFCAT-;complementaryBasis;2V;20| ((|b| (|Vector| S)) (% (|Vector| S)))
        (SPROG
         ((#1=#:G157 NIL) (|m| (|Matrix| (|Fraction| UP))) (#2=#:G164 NIL)
          (|i| NIL) (#3=#:G165 NIL) (#4=#:G163 NIL))
         (SEQ
          (LETT |m|
                (PROG2
                    (LETT #1#
                          (SPADCALL (SPADCALL |b| (QREFELT % 140))
                                    (QREFELT % 141)))
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0)
                                  (|Matrix| (|Fraction| (QREFELT % 8)))
                                  (|Union|
                                   (|Matrix| (|Fraction| (QREFELT % 8)))
                                   "failed")
                                  #1#)))
          (EXIT
           (PROGN
            (LETT #2#
                  (GETREFV
                   (|inc_SI|
                    (- #5=(SPADCALL |m| (QREFELT % 142)) #6=(PROGN |m| 1)))))
            (SEQ (LETT |i| #6#) (LETT #3# #5#) (LETT #4# 0) G190
                 (COND ((> |i| #3#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SETELT #2# #4#
                           (SPADCALL (SPADCALL |m| |i| (QREFELT % 143))
                                     (QREFELT % 131)))))
                 (LETT #4# (PROG1 (|inc_SI| #4#) (LETT |i| (+ |i| 1))))
                 (GO G190) G191 (EXIT NIL))
            #2#))))) 

(SDEFUN |FFCAT-;integralAtInfinity?;SB;21| ((|f| (S)) (% (|Boolean|)))
        (NULL
         (SPADCALL (CONS #'|FFCAT-;integralAtInfinity?;SB;21!0| %)
                   (SPADCALL (SPADCALL |f| (QREFELT % 32))
                             (SPADCALL (QREFELT % 147)) (QREFELT % 148))
                   (QREFELT % 150)))) 

(SDEFUN |FFCAT-;integralAtInfinity?;SB;21!0| ((|s| NIL) (% NIL))
        (SPADCALL (|FFCAT-;infOrder| |s| %) (|spadConstant| % 145)
                  (QREFELT % 146))) 

(SDEFUN |FFCAT-;pol_order_at_p| ((|f| (UP)) (|p| (UP)) (% (|Integer|)))
        (SPROG
         ((|qu| (|Union| UP #1="failed")) (#2=#:G173 NIL) (|k| (|Integer|))
          (#3=#:G182 NIL) (|k1| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ (LETT |k| 0) (LETT |k1| (SPADCALL |p| (QREFELT % 18)))
                (SEQ G190 (COND ((NULL (> |k1| 0)) (GO G191)))
                     (SEQ
                      (SEQ G190
                           (COND
                            ((NULL
                              (QEQCAR
                               (LETT |qu| (SPADCALL |f| |p| (QREFELT % 54)))
                               0))
                             (GO G191)))
                           (SEQ
                            (LETT |f|
                                  (PROG2 (LETT #2# |qu|)
                                      (QCDR #2#)
                                    (|check_union2| (QEQCAR #2# 0)
                                                    (QREFELT % 8)
                                                    (|Union| (QREFELT % 8) #1#)
                                                    #2#)))
                            (EXIT (LETT |k| (+ |k| |k1|))))
                           NIL (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (COND
                        ((EQL |k1| 1) (PROGN (LETT #3# |k|) (GO #4=#:G181)))
                        ('T
                         (SEQ (LETT |p| (SPADCALL |f| |p| (QREFELT % 52)))
                              (EXIT
                               (LETT |k1| (SPADCALL |p| (QREFELT % 18)))))))))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT |k|)))
          #4# (EXIT #3#)))) 

(SDEFUN |FFCAT-;rf_order_at_p|
        ((|f| (|Fraction| UP)) (|p| (UP)) (% (|Integer|)))
        (- (|FFCAT-;pol_order_at_p| (SPADCALL |f| (QREFELT % 19)) |p| %)
           (|FFCAT-;pol_order_at_p| (SPADCALL |f| (QREFELT % 16)) |p| %))) 

(SDEFUN |FFCAT-;special_order;SLI;24|
        ((|f| (S)) (|lp| (|List| UP)) (% (|Integer|)))
        (SPROG
         ((|nf| (|Fraction| UP)) (|p| NIL) (#1=#:G188 NIL) (|k| (|Integer|)))
         (SEQ (LETT |nf| (SPADCALL |f| (QREFELT % 152))) (LETT |k| 0)
              (SEQ (LETT |p| NIL) (LETT #1# |lp|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |k| (+ |k| (|FFCAT-;rf_order_at_p| |nf| |p| %)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (+ |k| (|FFCAT-;infOrder| |nf| %)))))) 

(SDEFUN |FFCAT-;numberOfComponents;Nni;25| ((% (|NonNegativeInteger|)))
        (SPADCALL (ELT % 137) (SPADCALL (QREFELT % 82)) (QREFELT % 156))) 

(SDEFUN |FFCAT-;represents;VUPS;26| ((|v| (|Vector| UP)) (|d| (UP)) (% (S)))
        (SPROG ((#1=#:G196 NIL) (|i| NIL) (#2=#:G197 NIL) (#3=#:G195 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #1#
                        (GETREFV
                         (|inc_SI|
                          (- #4=(QVSIZE |v|)
                             #5=(SPADCALL |v| (QREFELT % 126))))))
                  (SEQ (LETT |i| #5#) (LETT #2# #4#) (LETT #3# 0) G190
                       (COND ((> |i| #2#) (GO G191)))
                       (SEQ
                        (EXIT
                         (SETELT #1# #3#
                                 (SPADCALL (QAREF1O |v| |i| 1) |d|
                                           (QREFELT % 15)))))
                       (LETT #3# (PROG1 (|inc_SI| #3#) (LETT |i| (+ |i| 1))))
                       (GO G190) G191 (EXIT NIL))
                  #1#)
                 (QREFELT % 131))))) 

(SDEFUN |FFCAT-;genus;Nni;27| ((% (|NonNegativeInteger|)))
        (SPROG
         ((|ds| (|Fraction| UP)) (|d| (|Integer|)) (#1=#:G199 NIL)
          (|dd| (|Integer|)) (#2=#:G201 NIL))
         (SEQ (LETT |ds| (SPADCALL (QREFELT % 59)))
              (LETT |d|
                    (+ (SPADCALL (SPADCALL |ds| (QREFELT % 60)) (QREFELT % 18))
                       (|FFCAT-;infOrder|
                        (SPADCALL |ds|
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL (SPADCALL (QREFELT % 159))
                                              (SPADCALL (QREFELT % 160))
                                              (QREFELT % 161))
                                    (QREFELT % 162))
                                   2 (QREFELT % 163))
                                  (QREFELT % 164))
                        %)))
              (LETT |dd|
                    (PROG2
                        (LETT #1#
                              (|exquo_INT|
                               (-
                                (PROG2 (LETT #1# (|exquo_INT| |d| 2))
                                    (QCDR #1#)
                                  (|check_union2| (QEQCAR #1# 0) (|Integer|)
                                                  (|Union| (|Integer|)
                                                           #3="failed")
                                                  #1#))
                                (SPADCALL (QREFELT % 165)))
                               (SPADCALL (QREFELT % 29))))
                        (QCDR #1#)
                      (|check_union2| (QEQCAR #1# 0) (|Integer|)
                                      (|Union| (|Integer|) #3#) #1#)))
              (EXIT
               (PROG1 (LETT #2# (+ |dd| 1))
                 (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                   '(|Integer|) #2#)))))) 

(SDEFUN |FFCAT-;repOrder|
        ((|m| (|Matrix| (|Fraction| UP))) (|i| (|Integer|)) (% (|Integer|)))
        (SPROG
         ((|r| (|Vector| (|Fraction| UP))) (|j| NIL) (#1=#:G209 NIL)
          (|nostart| (|Boolean|)) (|ans| (|Integer|)))
         (SEQ (LETT |nostart| 'T) (LETT |ans| 0)
              (LETT |r| (SPADCALL |m| |i| (QREFELT % 143)))
              (SEQ (LETT |j| (SPADCALL |r| (QREFELT % 167)))
                   (LETT #1# (QVSIZE |r|)) G190 (COND ((> |j| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (QAREF1O |r| |j| 1) (|spadConstant| % 168)
                                 (QREFELT % 169))
                       (LETT |ans|
                             (COND
                              (|nostart|
                               (SEQ (LETT |nostart| NIL)
                                    (EXIT
                                     (|FFCAT-;infOrder| (QAREF1O |r| |j| 1)
                                      %))))
                              ('T
                               (MIN |ans|
                                    (|FFCAT-;infOrder| (QAREF1O |r| |j| 1)
                                     %)))))))))
                   (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))
              (EXIT (COND (|nostart| (|error| "Null row")) ('T |ans|)))))) 

(SDEFUN |FFCAT-;infValue| ((|f| (|Fraction| UP)) (% (|Fraction| F)))
        (SPROG ((|n| (|Integer|)))
               (SEQ
                (COND ((SPADCALL |f| (QREFELT % 69)) (|spadConstant| % 170))
                      (#1='T
                       (SEQ (LETT |n| (|FFCAT-;infOrder| |f| %))
                            (EXIT
                             (COND ((> |n| 0) (|spadConstant| % 170))
                                   ((ZEROP |n|)
                                    (SPADCALL
                                     (SPADCALL (SPADCALL |f| (QREFELT % 19))
                                               (QREFELT % 171))
                                     (SPADCALL (SPADCALL |f| (QREFELT % 16))
                                               (QREFELT % 171))
                                     (QREFELT % 172)))
                                   (#1#
                                    (|error|
                                     "f not locally integral at infinity")))))))))) 

(SDEFUN |FFCAT-;rfmonom| ((|n| (|Integer|)) (% (|Fraction| UP)))
        (SPROG ((#1=#:G214 NIL) (#2=#:G215 NIL))
               (COND
                ((< |n| 0)
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (|spadConstant| % 134)
                             (PROG1 (LETT #1# (- |n|))
                               (|check_subtype2| (>= #1# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #1#))
                             (QREFELT % 135))
                   (QREFELT % 55))
                  (QREFELT % 56)))
                ('T
                 (SPADCALL
                  (SPADCALL (|spadConstant| % 134)
                            (PROG1 (LETT #2# |n|)
                              (|check_subtype2| (>= #2# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #2#))
                            (QREFELT % 135))
                  (QREFELT % 55)))))) 

(SDEFUN |FFCAT-;kmin|
        ((|m| (|Matrix| (|Fraction| UP))) (|v| (|Vector| (|Fraction| F)))
         (% (|Record| (|:| |pos| (|Integer|)) (|:| |km| (|Integer|)))))
        (SPROG
         ((|ii| (|Integer|)) (|i| NIL) (#1=#:G225 NIL) (|nk| (|Integer|))
          (|nostart| (|Boolean|)) (|k| (|Integer|)) (|i0| (|Integer|)))
         (SEQ (LETT |nostart| 'T) (LETT |k| 0)
              (LETT |ii|
                    (- (PROGN |m| 1)
                       (LETT |i0| (SPADCALL |v| (QREFELT % 174)))))
              (SEQ (LETT |i| (SPADCALL |v| (QREFELT % 174)))
                   (LETT #1# (QVSIZE |v|)) G190 (COND ((> |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (QAREF1O |v| |i| 1) (|spadConstant| % 170)
                                 (QREFELT % 175))
                       (SEQ (LETT |nk| (|FFCAT-;repOrder| |m| (+ |i| |ii|) %))
                            (EXIT
                             (COND
                              (|nostart|
                               (SEQ (LETT |nostart| NIL) (LETT |k| |nk|)
                                    (EXIT (LETT |i0| |i|))))
                              ((< |nk| |k|)
                               (SEQ (LETT |k| |nk|)
                                    (EXIT (LETT |i0| |i|)))))))))))
                   (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND (|nostart| (|error| "vector v has only zero entries"))
                     ('T (CONS |i0| |k|))))))) 

(SDEFUN |FFCAT-;normalizeAtInfinity;2V;32|
        ((|w| (|Vector| S)) (% (|Vector| S)))
        (SPROG
         ((|ans| (|Vector| S)) (|infm| (|Matrix| (|Fraction| UP)))
          (|mhat| (|Matrix| (|Fraction| UP))) (|ii| (|Integer|))
          (|m| (|Matrix| (|Fraction| UP))) (#1=#:G246 NIL) (#2=#:G247 NIL)
          (#3=#:G245 NIL) (|r| (|Vector| (|Fraction| UP))) (#4=#:G248 NIL)
          (|j| NIL) (#5=#:G249 NIL)
          (|solList| (|List| (|Vector| (|Fraction| F)))) (#6=#:G244 NIL)
          (|sol| (|Vector| (|Fraction| F)))
          (|pr| (|Record| (|:| |pos| (|Integer|)) (|:| |km| (|Integer|))))
          (|i| NIL) (#7=#:G250 NIL) (#8=#:G238 (S)) (#9=#:G236 (S))
          (#10=#:G237 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |ans| (SPADCALL |w| (QREFELT % 176)))
                (LETT |infm| (SPADCALL (QREFELT % 147)))
                (LETT |mhat|
                      (SPADCALL (SPADCALL (QREFELT % 165))
                                (SPADCALL (QREFELT % 165)) (QREFELT % 177)))
                (LETT |ii| (- (SPADCALL |w| (QREFELT % 115)) (PROGN |mhat| 1)))
                (EXIT
                 (SEQ G190 NIL
                      (SEQ
                       (LETT |m|
                             (SPADCALL (SPADCALL |ans| (QREFELT % 84)) |infm|
                                       (QREFELT % 161)))
                       (LETT |r|
                             (PROGN
                              (LETT #1#
                                    (GETREFV
                                     (|inc_SI|
                                      (- #11=(SPADCALL |m| (QREFELT % 142))
                                         #12=(PROGN |m| 1)))))
                              (SEQ (LETT |i| #12#) (LETT #2# #11#) (LETT #3# 0)
                                   G190 (COND ((> |i| #2#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (SETELT #1# #3#
                                             (|FFCAT-;rfmonom|
                                              (|FFCAT-;repOrder| |m| |i| %)
                                              %))))
                                   (LETT #3#
                                         (PROG1 (|inc_SI| #3#)
                                           (LETT |i| (+ |i| 1))))
                                   (GO G190) G191 (EXIT NIL))
                              #1#))
                       (SEQ (LETT |i| (PROGN |m| 1))
                            (LETT #4# (SPADCALL |m| (QREFELT % 142))) G190
                            (COND ((> |i| #4#) (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ (LETT |j| (PROGN |m| 1))
                                   (LETT #5# (SPADCALL |m| (QREFELT % 178)))
                                   G190 (COND ((> |j| #5#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (QSETAREF2O |mhat| |i| |j|
                                                 (SPADCALL
                                                  (QAREF1O |r| (+ |i| |ii|) 1)
                                                  (QAREF2O |m| |i| |j| 1 1)
                                                  (QREFELT % 164))
                                                 1 1)))
                                   (LETT |j| (+ |j| 1)) (GO G190) G191
                                   (EXIT NIL))))
                            (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                       (LETT |solList|
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL
                                (CONS (|function| |FFCAT-;infValue|) %) |mhat|
                                (QREFELT % 182))
                               (QREFELT % 183))
                              (QREFELT % 185)))
                       (EXIT
                        (COND
                         ((NULL |solList|)
                          (PROGN (LETT #6# |ans|) (GO #13=#:G243)))
                         ('T
                          (SEQ (LETT |sol| (|SPADfirst| |solList|))
                               (LETT |pr| (|FFCAT-;kmin| |m| |sol| %))
                               (EXIT
                                (QSETAREF1O |ans| (QCAR |pr|)
                                            (PROGN
                                             (LETT #10# NIL)
                                             (SEQ
                                              (LETT |i|
                                                    (SPADCALL |sol|
                                                              (QREFELT % 174)))
                                              (LETT #7# (QVSIZE |sol|)) G190
                                              (COND ((> |i| #7#) (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (PROGN
                                                 (LETT #8#
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (|FFCAT-;Q2RF|
                                                          (QAREF1O |sol| |i| 1)
                                                          %)
                                                         (|FFCAT-;rfmonom|
                                                          (-
                                                           (|FFCAT-;repOrder|
                                                            |m| (- |i| |ii|) %)
                                                           (QCDR |pr|))
                                                          %)
                                                         (QREFELT % 164))
                                                        (QAREF1O |ans| |i| 1)
                                                        (QREFELT % 97)))
                                                 (COND
                                                  (#10#
                                                   (LETT #9#
                                                         (SPADCALL #9# #8#
                                                                   (QREFELT %
                                                                            116))))
                                                  ('T
                                                   (PROGN
                                                    (LETT #9# #8#)
                                                    (LETT #10# 'T)))))))
                                              (LETT |i| (+ |i| 1)) (GO G190)
                                              G191 (EXIT NIL))
                                             (COND (#10# #9#)
                                                   ('T
                                                    (|spadConstant| % 117))))
                                            1)))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #13# (EXIT #6#)))) 

(SDEFUN |FFCAT-;integral?;SUPB;33| ((|f| (S)) (|p| (UP)) (% (|Boolean|)))
        (SPROG ((|r| (|Union| F "failed")))
               (SEQ (LETT |r| (SPADCALL |p| (QREFELT % 188)))
                    (EXIT
                     (COND
                      ((QEQCAR |r| 0)
                       (SPADCALL |f| (QCDR |r|) (QREFELT % 189)))
                      ('T
                       (QEQCAR
                        (SPADCALL (QCDR (SPADCALL |f| (QREFELT % 21))) |p|
                                  (QREFELT % 54))
                        1))))))) 

(SDEFUN |FFCAT-;differentiate;SMS;34|
        ((|f| (S)) (|d| (|Mapping| UP UP)) (% (S)))
        (SPROG NIL
               (SPADCALL |f|
                         (CONS #'|FFCAT-;differentiate;SMS;34!0|
                               (VECTOR % |d|))
                         (QREFELT % 193)))) 

(SDEFUN |FFCAT-;differentiate;SMS;34!0| ((|x| NIL) ($$ NIL))
        (PROG (|d| %)
          (LETT |d| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |d| (QREFELT % 191)))))) 

(DECLAIM (NOTINLINE |FunctionFieldCategory&;|)) 

(DEFUN |FunctionFieldCategory&| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (DV$4 NIL) (|dv$| NIL) (% NIL)
    (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT |dv$| (LIST '|FunctionFieldCategory&| DV$1 DV$2 DV$3 DV$4))
    (LETT % (GETREFV 196))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST (|HasCategory| |#2| '(|Finite|))
                                             (|HasCategory| |#2|
                                                            '(|Field|))))))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (SETF |pv$| (QREFELT % 3))
    (COND
     ((|testBitVector| |pv$| 2)
      (PROGN
       (QSETREFV % 106
                 (CONS (|dispatchFunction| |FFCAT-;nonSingularModel;SL;13|)
                       %)))))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (QSETREFV % 113
                 (CONS (|dispatchFunction| |FFCAT-;rationalPoints;L;15|) %)))))
    %))) 

(MAKEPROP '|FunctionFieldCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|Fraction| 7) (0 . |numer|)
              (5 . |coerce|) (10 . |denom|) (|Fraction| 8) (15 . /)
              (21 . |denom|) (|NonNegativeInteger|) (26 . |degree|)
              (31 . |numer|) (|Record| (|:| |num| 125) (|:| |den| 8))
              (36 . |integralCoordinates|) (|Boolean|) (41 . |ground?|)
              |FFCAT-;integral?;SB;3| (46 . |elt|) (52 . |0|) (56 . ~=)
              |FFCAT-;integral?;SFB;4| (62 . |numberOfComponents|)
              |FFCAT-;absolutelyIrreducible?;B;5| (|Vector| 14)
              (66 . |coordinates|) (|InnerCommonDenominator| 8 14 125 31)
              (71 . |splitDenominator|) |FFCAT-;yCoordinates;SR;6|
              (76 . |definingPolynomial|) (80 . |degree|) (85 . ~=)
              (91 . |reductum|) (|Union| 14 '#1="failed") (96 . |retractIfCan|)
              (101 . |leadingCoefficient|) (106 . /) (112 . -)
              (|Union| 8 '"failed") (117 . |retractIfCan|)
              |FFCAT-;hyperelliptic;U;7| (122 . |lift|)
              (|Record| (|:| |num| 9) (|:| |den| 8))
              (|UnivariatePolynomialCommonDenominator| 8 14 9)
              (127 . |splitDenominator|) (132 . |gcd|) (|Union| % '"failed")
              (138 . |exquo|) (144 . |coerce|) (149 . |inv|) (154 . *)
              (160 . |reduce|) (165 . |discriminant|) (169 . |retract|)
              (|Record| (|:| |num| %) (|:| |den| 8) (|:| |derivden| 8)
                        (|:| |gd| 8))
              (|Mapping| 8 8) |FFCAT-;algSplitSimple;SMR;8|
              (174 . |hyperelliptic|) |FFCAT-;elliptic;U;9| (178 . |elt|)
              (|Fraction| %) (184 . |elt|) (190 . |zero?|)
              |FFCAT-;rationalPoint?;2FB;10| (|Polynomial| 7) (195 . |coerce|)
              (|SparseUnivariatePolynomial| 71) (|Mapping| 71 7)
              (|UnivariatePolynomialCategoryFunctions2| 7 8 71 73)
              (200 . |map|) (206 . |elt|) (|Mapping| 71 14)
              (|UnivariatePolynomialCategoryFunctions2| 14 9 71 73)
              (212 . |map|) (|Vector| %) (218 . |integralBasis|) (|Matrix| 14)
              (222 . |coordinates|) (|MatrixCommonDenominator| 8 14)
              (227 . |commonDenominator|) (|String|) (|Symbol|)
              (232 . |string|) (237 . |coerce|) (242 . |degree|)
              (248 . |zero?|) (253 . |coerce|) (|Integer|) (|Vector| 6)
              (258 . |elt|) (264 . *) (270 . -) (|List| 88) (276 . |concat|)
              (|List| 71) (|PolyGroebner| 7) (282 . |lexGroebner|)
              (|Mapping| 22 71) (288 . |select!|) (294 . |nonSingularModel|)
              (299 . |size|) (|PositiveInteger|) (303 . |index|) (|List| %)
              (|List| (|List| 7)) (308 . |concat|) (313 . |rationalPoints|)
              (317 . |singular?|) (322 . |minIndex|) (327 . +) (333 . |0|)
              (337 . |yCoordinates|) (342 . ^) (348 . *) (354 . +)
              (360 . |zero?|) (365 . |exquo|) |FFCAT-;elt;S3F;17| (|Vector| 8)
              (371 . |minIndex|) (376 . |content|) (381 . |gcd|)
              (386 . |primitivePart|) (391 . *) (397 . |represents|)
              |FFCAT-;primitivePart;2S;18| (402 . |1|) (406 . |1|)
              (410 . |monomial|) (416 . ^) (422 . |integralAtInfinity?|)
              (427 . |concat|) |FFCAT-;reduceBasisAtInfinity;2V;19|
              (432 . |traceMatrix|) (437 . |inverse|) (442 . |maxRowIndex|)
              (447 . |row|) |FFCAT-;complementaryBasis;2V;20| (453 . |0|)
              (457 . <) (463 . |inverseIntegralMatrixAtInfinity|) (467 . *)
              (|Mapping| 22 14) (473 . |any?|)
              |FFCAT-;integralAtInfinity?;SB;21| (479 . |norm|) (|List| 8)
              |FFCAT-;special_order;SLI;24| (|Mapping| 22 6) (484 . |count|)
              |FFCAT-;numberOfComponents;Nni;25| |FFCAT-;represents;VUPS;26|
              (490 . |integralMatrixAtInfinity|)
              (494 . |inverseIntegralMatrix|) (498 . *) (504 . |determinant|)
              (509 . ^) (515 . *) (521 . |rank|) |FFCAT-;genus;Nni;27|
              (525 . |minIndex|) (530 . |0|) (534 . ~=) (540 . |0|)
              (544 . |leadingCoefficient|) (549 . /) (|Vector| 10)
              (555 . |minIndex|) (560 . ~=) (566 . |copy|) (571 . |zero|)
              (577 . |maxColIndex|) (|Matrix| 10) (|Mapping| 10 14)
              (|MatrixCategoryFunctions2| 14 31 31 83 10 173 173 179)
              (582 . |map|) (588 . |transpose|) (|List| 173)
              (593 . |nullSpace|) |FFCAT-;normalizeAtInfinity;2V;32|
              (|Union| 7 '#1#) (598 . |retractIfCan|) (603 . |integral?|)
              |FFCAT-;integral?;SUPB;33| (609 . |differentiate|)
              (|Mapping| 14 14) (615 . |differentiate|)
              |FFCAT-;differentiate;SMS;34| (|List| 17))
           '#(|yCoordinates| 621 |special_order| 626 |represents| 632
              |reduceBasisAtInfinity| 638 |rationalPoints| 643 |rationalPoint?|
              647 |primitivePart| 653 |numberOfComponents| 658
              |normalizeAtInfinity| 662 |nonSingularModel| 667
              |integralAtInfinity?| 672 |integral?| 677 |hyperelliptic| 694
              |genus| 698 |elt| 702 |elliptic| 709 |differentiate| 713
              |complementaryBasis| 719 |algSplitSimple| 724
              |absolutelyIrreducible?| 730)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|rationalPoints| ((|List| (|List| |#2|)))) T)
                              '((|nonSingularModel|
                                 ((|List| (|Polynomial| |#2|)) (|Symbol|)))
                                T)
                              '((|algSplitSimple|
                                 ((|Record| (|:| |num| |#1|) (|:| |den| |#3|)
                                            (|:| |derivden| |#3|)
                                            (|:| |gd| |#3|))
                                  |#1| (|Mapping| |#3| |#3|)))
                                T)
                              '((|hyperelliptic| ((|Union| |#3| "failed"))) T)
                              '((|elliptic| ((|Union| |#3| "failed"))) T)
                              '((|elt| (|#2| |#1| |#2| |#2|)) T)
                              '((|primitivePart| (|#1| |#1|)) T)
                              '((|represents| (|#1| (|Vector| |#3|) |#3|)) T)
                              '((|differentiate|
                                 (|#1| |#1| (|Mapping| |#3| |#3|)))
                                T)
                              '((|integral?| ((|Boolean|) |#1| |#3|)) T)
                              '((|integral?| ((|Boolean|) |#1| |#2|)) T)
                              '((|yCoordinates|
                                 ((|Record| (|:| |num| (|Vector| |#3|))
                                            (|:| |den| |#3|))
                                  |#1|))
                                T)
                              '((|reduceBasisAtInfinity|
                                 ((|Vector| |#1|) (|Vector| |#1|)))
                                T)
                              '((|normalizeAtInfinity|
                                 ((|Vector| |#1|) (|Vector| |#1|)))
                                T)
                              '((|complementaryBasis|
                                 ((|Vector| |#1|) (|Vector| |#1|)))
                                T)
                              '((|integral?| ((|Boolean|) |#1|)) T)
                              '((|special_order|
                                 ((|Integer|) |#1| (|List| |#3|)))
                                T)
                              '((|integralAtInfinity?| ((|Boolean|) |#1|)) T)
                              '((|rationalPoint?| ((|Boolean|) |#2| |#2|)) T)
                              '((|absolutelyIrreducible?| ((|Boolean|))) T)
                              '((|genus| ((|NonNegativeInteger|))) T)
                              '((|numberOfComponents| ((|NonNegativeInteger|)))
                                T)
                              '((|differentiate|
                                 (|#1| |#1|
                                  (|Mapping| (|Fraction| |#3|)
                                             (|Fraction| |#3|))))
                                T)
                              '((|differentiate|
                                 (|#1| |#1|
                                  (|Mapping| (|Fraction| |#3|)
                                             (|Fraction| |#3|))
                                  (|NonNegativeInteger|)))
                                T)
                              '((|differentiate|
                                 (|#1| |#1| (|List| (|Symbol|))
                                  (|List| (|NonNegativeInteger|))))
                                T)
                              '((|differentiate|
                                 (|#1| |#1| (|Symbol|) (|NonNegativeInteger|)))
                                T)
                              '((|differentiate|
                                 (|#1| |#1| (|List| (|Symbol|))))
                                T)
                              '((|differentiate| (|#1| |#1| (|Symbol|))) T)
                              '((|differentiate|
                                 (|#1| |#1| (|NonNegativeInteger|)))
                                T)
                              '((|differentiate| (|#1| |#1|)) T)
                              '((|represents|
                                 (|#1| (|Vector| (|Fraction| |#3|))))
                                T)
                              '((|represents|
                                 (|#1| (|Vector| (|Fraction| |#3|))
                                  (|Vector| |#1|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 194
                                            '(1 10 7 0 11 1 8 0 7 12 1 10 7 0
                                              13 2 14 0 8 8 15 1 14 8 0 16 1 8
                                              17 0 18 1 14 8 0 19 1 6 20 0 21 1
                                              8 22 0 23 2 8 7 0 7 25 0 7 0 26 2
                                              7 22 0 0 27 0 6 17 29 1 6 31 0 32
                                              1 33 20 31 34 0 6 9 36 1 9 17 0
                                              37 2 17 22 0 0 38 1 9 0 0 39 1 9
                                              40 0 41 1 9 14 0 42 2 14 0 0 0 43
                                              1 14 0 0 44 1 14 45 0 46 1 6 9 0
                                              48 1 50 49 9 51 2 8 0 0 0 52 2 8
                                              53 0 0 54 1 14 0 8 55 1 14 0 0 56
                                              2 9 0 14 0 57 1 6 0 9 58 0 6 14
                                              59 1 14 8 0 60 0 6 45 64 2 9 14 0
                                              14 66 2 8 67 67 67 68 1 14 22 0
                                              69 1 71 0 7 72 2 75 73 74 8 76 2
                                              73 71 0 71 77 2 79 73 78 9 80 0 6
                                              81 82 1 6 83 81 84 1 85 8 83 86 1
                                              88 87 0 89 1 88 0 87 90 2 71 17 0
                                              88 91 1 17 22 0 92 1 71 0 88 93 2
                                              95 6 0 94 96 2 6 0 14 0 97 2 71 0
                                              0 0 98 2 99 0 0 0 100 2 102 101
                                              101 99 103 2 101 0 104 0 105 1 0
                                              101 88 106 0 7 17 107 1 7 0 108
                                              109 1 111 0 110 112 0 0 111 113 1
                                              6 22 7 114 1 95 94 0 115 2 6 0 0
                                              0 116 0 6 0 117 1 6 20 0 118 2 7
                                              0 0 17 119 2 7 0 0 0 120 2 7 0 0
                                              0 121 1 7 22 0 122 2 7 53 0 0 123
                                              1 125 94 0 126 1 8 7 0 127 1 7 0
                                              110 128 1 8 0 0 129 2 8 0 7 0 130
                                              1 6 0 31 131 0 6 0 133 0 7 0 134
                                              2 8 0 7 17 135 2 14 0 0 17 136 1
                                              6 22 0 137 1 95 0 110 138 1 6 83
                                              81 140 1 83 53 0 141 1 83 94 0
                                              142 2 83 31 0 94 143 0 17 0 145 2
                                              94 22 0 0 146 0 6 83 147 2 83 31
                                              31 0 148 2 31 22 149 0 150 1 6 14
                                              0 152 2 95 17 155 0 156 0 6 83
                                              159 0 6 83 160 2 83 0 0 0 161 1
                                              83 14 0 162 2 14 0 0 94 163 2 14
                                              0 0 0 164 0 6 108 165 1 31 94 0
                                              167 0 14 0 168 2 14 22 0 0 169 0
                                              10 0 170 1 8 7 0 171 2 10 0 7 7
                                              172 1 173 94 0 174 2 10 22 0 0
                                              175 1 95 0 0 176 2 83 0 17 17 177
                                              1 83 94 0 178 2 181 179 180 83
                                              182 1 179 0 0 183 1 179 184 0 185
                                              1 8 187 0 188 2 6 22 0 7 189 2 14
                                              0 0 62 191 2 6 0 0 192 193 1 0 20
                                              0 35 2 0 94 0 153 154 2 0 0 125 8
                                              158 1 0 81 81 139 0 0 111 113 2 0
                                              22 7 7 70 1 0 0 0 132 0 0 17 157
                                              1 0 81 81 186 1 0 101 88 106 1 0
                                              22 0 151 1 0 22 0 24 2 0 22 0 7
                                              28 2 0 22 0 8 190 0 0 45 47 0 0
                                              17 166 3 0 7 0 7 7 124 0 0 45 65
                                              2 0 0 0 62 194 1 0 81 81 144 2 0
                                              61 0 62 63 0 0 22 30)))))
           '|lookupComplete|)) 
