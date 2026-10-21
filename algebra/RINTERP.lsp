
(SDEFUN |RINTERP;interpolate;2L2NniF;1|
        ((|xlist| (|List| F)) (|ylist| (|List| F)) (|m| (|NonNegativeInteger|))
         (|k| (|NonNegativeInteger|)) (% (|Fraction| (|Polynomial| F))))
        (SPROG
         ((#1=#:G29 NIL) (#2=#:G30 NIL) (#3=#:G31 NIL) (#4=#:G32 NIL)
          (#5=#:G33 NIL) (#6=#:G34 NIL) (|tempvec| (|List| F)) (#7=#:G35 NIL)
          (#8=#:G36 NIL) (#9=#:G37 NIL) (|j| NIL) (#10=#:G38 NIL)
          (#11=#:G39 NIL) (#12=#:G40 NIL) (|collist| (|List| (|List| F)))
          (|res| (|List| (|Vector| F))) (#13=#:G41 NIL) (#14=#:G42 NIL)
          (#15=#:G43 NIL) (|i| NIL) (#16=#:G44 NIL)
          (|reslist| (|List| (|List| (|Polynomial| F)))))
         (SEQ
          (COND
           ((SPADCALL (LENGTH |xlist|) (LENGTH |ylist|) (QREFELT % 10))
            (|error| "Different number of points and values."))
           ((SPADCALL (LENGTH |xlist|) (+ (+ |m| |k|) 1) (QREFELT % 10))
            (|error| "wrong number of points"))
           ('T
            (SEQ
             (LETT |tempvec|
                   (PROGN
                    (LETT #1# NIL)
                    (SEQ (LETT |i| 1) (LETT #2# (+ (+ |m| |k|) 1)) G190
                         (COND ((|greater_SI| |i| #2#) (GO G191)))
                         (SEQ
                          (EXIT (LETT #1# (CONS (|spadConstant| % 11) #1#))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                         (EXIT (NREVERSE #1#)))))
             (LETT |collist|
                   (CONS |tempvec|
                         (PROGN
                          (LETT #3# NIL)
                          (SEQ (LETT |j| 1) (LETT #4# (MAX |m| |k|)) G190
                               (COND ((|greater_SI| |j| #4#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #3#
                                       (CONS
                                        (LETT |tempvec|
                                              (PROGN
                                               (LETT #5# NIL)
                                               (SEQ (LETT |i| 1)
                                                    (LETT #6#
                                                          (+ (+ |m| |k|) 1))
                                                    G190
                                                    (COND
                                                     ((|greater_SI| |i| #6#)
                                                      (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (LETT #5#
                                                            (CONS
                                                             (SPADCALL
                                                              (SPADCALL
                                                               |tempvec| |i|
                                                               (QREFELT % 14))
                                                              (SPADCALL |xlist|
                                                                        |i|
                                                                        (QREFELT
                                                                         % 14))
                                                              (QREFELT % 15))
                                                             #5#))))
                                                    (LETT |i| (|inc_SI| |i|))
                                                    (GO G190) G191
                                                    (EXIT (NREVERSE #5#)))))
                                        #3#))))
                               (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                               (EXIT (NREVERSE #3#))))))
             (LETT |collist|
                   (SPADCALL
                    (PROGN
                     (LETT #7# NIL)
                     (SEQ (LETT |j| 1) (LETT #8# (+ |m| 1)) G190
                          (COND ((|greater_SI| |j| #8#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #7#
                                  (CONS (SPADCALL |collist| |j| (QREFELT % 19))
                                        #7#))))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT (NREVERSE #7#))))
                    (PROGN
                     (LETT #9# NIL)
                     (SEQ (LETT |j| 1) (LETT #10# (+ |k| 1)) G190
                          (COND ((|greater_SI| |j| #10#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #9#
                                  (CONS
                                   (PROGN
                                    (LETT #11# NIL)
                                    (SEQ (LETT |i| 1)
                                         (LETT #12# (+ (+ |m| |k|) 1)) G190
                                         (COND
                                          ((|greater_SI| |i| #12#) (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #11#
                                                 (CONS
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL |collist| |j|
                                                               (QREFELT % 19))
                                                     |i| (QREFELT % 14))
                                                    (SPADCALL |ylist| |i|
                                                              (QREFELT % 14))
                                                    (QREFELT % 15))
                                                   (QREFELT % 20))
                                                  #11#))))
                                         (LETT |i| (|inc_SI| |i|)) (GO G190)
                                         G191 (EXIT (NREVERSE #11#))))
                                   #9#))))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT (NREVERSE #9#))))
                    (QREFELT % 21)))
             (LETT |res|
                   (SPADCALL
                    (SPADCALL (SPADCALL |collist| (QREFELT % 23))
                              (QREFELT % 24))
                    (QREFELT % 26)))
             (COND
              ((SPADCALL (LENGTH |res|) 1 (QREFELT % 10))
               (SPADCALL "Warning: unattainable points!" (QREFELT % 30))))
             (LETT |reslist|
                   (LIST
                    (PROGN
                     (LETT #13# NIL)
                     (SEQ (LETT |i| 0) (LETT #14# |m|) G190
                          (COND ((|greater_SI| |i| #14#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #13#
                                  (CONS
                                   (SPADCALL
                                    (SPADCALL (SPADCALL |res| 1 (QREFELT % 32))
                                              (+ |i| 1) (QREFELT % 33))
                                    (SPADCALL
                                     (SPADCALL (QREFELT % 6) (QREFELT % 36))
                                     |i| (QREFELT % 37))
                                    (QREFELT % 38))
                                   #13#))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT (NREVERSE #13#))))
                    (PROGN
                     (LETT #15# NIL)
                     (SEQ (LETT |i| 0) (LETT #16# |k|) G190
                          (COND ((|greater_SI| |i| #16#) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #15#
                                  (CONS
                                   (SPADCALL
                                    (SPADCALL (SPADCALL |res| 1 (QREFELT % 32))
                                              (+ (+ |i| |m|) 2) (QREFELT % 33))
                                    (SPADCALL
                                     (SPADCALL (QREFELT % 6) (QREFELT % 36))
                                     |i| (QREFELT % 37))
                                    (QREFELT % 38))
                                   #15#))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT (NREVERSE #15#))))))
             (EXIT
              (SPADCALL
               (SPADCALL (ELT % 39) (SPADCALL |reslist| 1 (QREFELT % 42))
                         (QREFELT % 44))
               (SPADCALL (ELT % 39) (SPADCALL |reslist| 2 (QREFELT % 42))
                         (QREFELT % 44))
               (QREFELT % 45))))))))) 

(DECLAIM (NOTINLINE |RationalInterpolation;|)) 

(DEFUN |RationalInterpolation;| (|#1| |#2|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 |#1|)
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|RationalInterpolation| DV$1 DV$2))
          (LETT % (GETREFV 47))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|RationalInterpolation|
                      (LIST DV$1 DV$2) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |RationalInterpolation| (&REST #1=#:G45)
  (SPROG NIL
         (PROG (#2=#:G46)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluate_sig| #1# '(NIL T))
                                               (HGET |$ConstructorCache|
                                                     '|RationalInterpolation|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |RationalInterpolation;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|RationalInterpolation|)))))))))) 

(MAKEPROP '|RationalInterpolation| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Boolean|)
              (|NonNegativeInteger|) (0 . ~=) (6 . |1|) (|Integer|) (|List| 7)
              (10 . |elt|) (16 . *) (|Fraction| 35) (22 . |1|) (|List| 13)
              (26 . |elt|) (32 . -) (37 . |append|) (|Matrix| 7)
              (43 . |matrix|) (48 . |transpose|) (|List| 31) (53 . |nullSpace|)
              (|Void|) (|String|) (|OutputPackage|) (58 . |output|)
              (|Vector| 7) (63 . |elt|) (69 . |elt|) (|Symbol|)
              (|Polynomial| 7) (75 . |coerce|) (80 . ^) (86 . *) (92 . +)
              (|List| 35) (|List| 40) (98 . |elt|) (|Mapping| 35 35 35)
              (104 . |reduce|) (110 . /) |RINTERP;interpolate;2L2NniF;1|)
           '#(|interpolate| 116) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|interpolate|
                                 ((|Fraction| (|Polynomial| |#2|))
                                  (|List| |#2|) (|List| |#2|)
                                  (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 46
                                            '(2 9 8 0 0 10 0 7 0 11 2 13 7 0 12
                                              14 2 7 0 0 0 15 0 16 0 17 2 18 13
                                              0 12 19 1 7 0 0 20 2 18 0 0 0 21
                                              1 22 0 18 23 1 22 0 0 24 1 22 25
                                              0 26 1 29 27 28 30 2 25 31 0 12
                                              32 2 31 7 0 12 33 1 35 0 34 36 2
                                              35 0 0 9 37 2 35 0 7 0 38 2 35 0
                                              0 0 39 2 41 40 0 12 42 2 40 35 43
                                              0 44 2 16 0 35 35 45 4 0 16 13 13
                                              9 9 46)))))
           '|lookupComplete|)) 
