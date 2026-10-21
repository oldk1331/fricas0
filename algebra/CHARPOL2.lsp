
(SDEFUN |CHARPOL2;danilewski;MR;1|
        ((|m| (|Matrix| F))
         (%
          (|Record| (|:| |matrix| (|Matrix| F))
                    (|:| |block_list| (|List| (|Integer|))))))
        (SPROG
         ((|n| (|NonNegativeInteger|)) (|nc| NIL) (#1=#:G38 NIL)
          (|n1| (|Integer|)) (|k1| (|Integer|)) (|kk| NIL) (#2=#:G39 NIL)
          (|has_block| (|Boolean|)) (#3=#:G36 NIL) (|nn| (|Integer|))
          (|blocks| (|List| (|Integer|))) (#4=#:G37 NIL) (|piv| (F))
          (#5=#:G40 NIL) (|cc| (F)) (#6=#:G41 NIL) (|val| (F)) (#7=#:G42 NIL)
          (#8=#:G43 NIL) (|s| (F)) (|i| NIL) (#9=#:G44 NIL) (|j| NIL)
          (#10=#:G45 NIL))
         (SEQ (LETT |n| (ANCOLS |m|))
              (EXIT
               (COND
                ((SPADCALL |n| (ANROWS |m|) (QREFELT % 9))
                 (|error| "need square matrix"))
                ('T
                 (SEQ (LETT |n1| |n|) (LETT |nn| |n|) (LETT |blocks| NIL)
                      (SEQ (LETT |nc| 1) (LETT #1# (- |n| 1)) G190
                           (COND ((|greater_SI| |nc| #1#) (GO G191)))
                           (SEQ
                            (EXIT
                             (SEQ (LETT |n1| (+ (- |n| |nc|) 1))
                                  (LETT |k1| (- |n1| 1)) (LETT |has_block| NIL)
                                  (SEQ (LETT |piv| (QAREF2O |m| |n1| |k1| 1 1))
                                       (EXIT
                                        (COND
                                         ((SPADCALL |piv| (|spadConstant| % 11)
                                                    (QREFELT % 12))
                                          (SEQ (LETT |has_block| 'T)
                                               (EXIT
                                                (SEQ
                                                 (EXIT
                                                  (SEQ (LETT |kk| 1)
                                                       (LETT #2# (- |k1| 1))
                                                       G190
                                                       (COND
                                                        ((|greater_SI| |kk|
                                                                       #2#)
                                                         (GO G191)))
                                                       (SEQ
                                                        (EXIT
                                                         (COND
                                                          ((SPADCALL
                                                            (LETT |piv|
                                                                  (QAREF2O |m|
                                                                           |n1|
                                                                           |kk|
                                                                           1
                                                                           1))
                                                            (|spadConstant| %
                                                                            11)
                                                            (QREFELT % 13))
                                                           (SEQ
                                                            (LETT |m|
                                                                  (SPADCALL |m|
                                                                            |kk|
                                                                            |k1|
                                                                            (QREFELT
                                                                             %
                                                                             16)))
                                                            (LETT |m|
                                                                  (SPADCALL |m|
                                                                            |kk|
                                                                            |k1|
                                                                            (QREFELT
                                                                             %
                                                                             17)))
                                                            (LETT |has_block|
                                                                  NIL)
                                                            (EXIT
                                                             (PROGN
                                                              (LETT #3# 1)
                                                              (GO
                                                               #11=#:G10))))))))
                                                       (LETT |kk|
                                                             (|inc_SI| |kk|))
                                                       (GO G190) G191
                                                       (EXIT NIL)))
                                                 #11# (EXIT #3#))))))))
                                  (EXIT
                                   (COND
                                    (|has_block|
                                     (SEQ (LETT |nn| |k1|)
                                          (LETT |blocks| (CONS |n1| |blocks|))
                                          (EXIT
                                           (PROGN
                                            (LETT #4# |$NoValue|)
                                            (GO #12=#:G6)))))
                                    ('T
                                     (SEQ
                                      (LETT |piv|
                                            (SPADCALL (|spadConstant| % 10)
                                                      |piv| (QREFELT % 18)))
                                      (SEQ (LETT |i| 1) (LETT #5# |k1|) G190
                                           (COND
                                            ((|greater_SI| |i| #5#) (GO G191)))
                                           (SEQ
                                            (LETT |cc|
                                                  (SPADCALL |piv|
                                                            (QAREF2O |m| |i|
                                                                     |k1| 1 1)
                                                            (QREFELT % 19)))
                                            (EXIT
                                             (SEQ (LETT |j| 1) (LETT #6# |nn|)
                                                  G190
                                                  (COND
                                                   ((|greater_SI| |j| #6#)
                                                    (GO G191)))
                                                  (SEQ
                                                   (LETT |val|
                                                         (COND
                                                          ((EQL |j| |k1|) |cc|)
                                                          ('T
                                                           (SPADCALL
                                                            (QAREF2O |m| |i|
                                                                     |j| 1 1)
                                                            (SPADCALL |cc|
                                                                      (QAREF2O
                                                                       |m| |n1|
                                                                       |j| 1 1)
                                                                      (QREFELT
                                                                       % 19))
                                                            (QREFELT % 20)))))
                                                   (EXIT
                                                    (QSETAREF2O |m| |i| |j|
                                                                |val| 1 1)))
                                                  (LETT |j| (|inc_SI| |j|))
                                                  (GO G190) G191 (EXIT NIL))))
                                           (LETT |i| (|inc_SI| |i|)) (GO G190)
                                           G191 (EXIT NIL))
                                      (SEQ (LETT |j| 1) (LETT #7# |nn|) G190
                                           (COND
                                            ((|greater_SI| |j| #7#) (GO G191)))
                                           (SEQ
                                            (LETT |s| (|spadConstant| % 11))
                                            (SEQ (LETT |i| 1) (LETT #8# |k1|)
                                                 G190
                                                 (COND
                                                  ((|greater_SI| |i| #8#)
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT |s|
                                                         (SPADCALL |s|
                                                                   (SPADCALL
                                                                    (QAREF2O
                                                                     |m| |n1|
                                                                     |i| 1 1)
                                                                    (QAREF2O
                                                                     |m| |i|
                                                                     |j| 1 1)
                                                                    (QREFELT %
                                                                             19))
                                                                   (QREFELT %
                                                                            21)))))
                                                 (LETT |i| (|inc_SI| |i|))
                                                 (GO G190) G191 (EXIT NIL))
                                            (EXIT
                                             (QSETAREF2O |m| |k1| |j| |s| 1
                                                         1)))
                                           (LETT |j| (|inc_SI| |j|)) (GO G190)
                                           G191 (EXIT NIL))
                                      (SEQ (LETT |i| 0)
                                           (LETT #9# (- |nn| |n1|)) G190
                                           (COND
                                            ((|greater_SI| |i| #9#) (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (QSETAREF2O |m| |k1| (+ |k1| |i|)
                                                         (SPADCALL
                                                          (QAREF2O |m| |k1|
                                                                   (+ |k1| |i|)
                                                                   1 1)
                                                          (QAREF2O |m| |n1|
                                                                   (+ |n1| |i|)
                                                                   1 1)
                                                          (QREFELT % 21))
                                                         1 1)))
                                           (LETT |i| (|inc_SI| |i|)) (GO G190)
                                           G191 (EXIT NIL))
                                      (SEQ (LETT |j| 1) (LETT #10# |nn|) G190
                                           (COND
                                            ((|greater_SI| |j| #10#)
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (QSETAREF2O |m| |n1| |j|
                                                         (|spadConstant| % 11)
                                                         1 1)))
                                           (LETT |j| (|inc_SI| |j|)) (GO G190)
                                           G191 (EXIT NIL))
                                      (EXIT
                                       (QSETAREF2O |m| |n1| |k1|
                                                   (|spadConstant| % 10) 1
                                                   1))))))))
                            #12# (EXIT #4#))
                           (LETT |nc| (|inc_SI| |nc|)) (GO G190) G191
                           (EXIT NIL))
                      (EXIT (CONS |m| (CONS 1 |blocks|)))))))))) 

(SDEFUN |CHARPOL2;char_pol;MSup;2|
        ((|m| (|Matrix| F)) (% (|SparseUnivariatePolynomial| F)))
        (SPROG
         ((|pp|
           (|Record| (|:| |matrix| #1=(|Matrix| F))
                     (|:| |block_list| #2=(|List| (|Integer|)))))
          (|n| (|NonNegativeInteger|)) (|mp| #1#) (|i0| (|Integer|))
          (|blocks| #2#) (|i1| (|Integer|)) (|i| NIL) (#3=#:G59 NIL)
          (#4=#:G51 NIL) (#5=#:G53 NIL)
          (|res1| (|SparseUnivariatePolynomial| F))
          (|res| (|SparseUnivariatePolynomial| F)))
         (SEQ
          (LETT |pp| (SPADCALL (SPADCALL |m| (QREFELT % 24)) (QREFELT % 23)))
          (LETT |n| (ANCOLS |m|)) (LETT |blocks| (QCDR |pp|))
          (LETT |mp| (QCAR |pp|)) (LETT |res| (|spadConstant| % 26))
          (SEQ G190 (COND ((NULL (NULL (NULL |blocks|))) (GO G191)))
               (SEQ (LETT |i0| (|SPADfirst| |blocks|))
                    (LETT |blocks| (CDR |blocks|))
                    (LETT |i1|
                          (COND ((NULL |blocks|) (+ |n| 1))
                                ('T (|SPADfirst| |blocks|))))
                    (LETT |res1| (|spadConstant| % 27))
                    (SEQ (LETT |i| 0) (LETT #3# (- (- |i1| |i0|) 1)) G190
                         (COND ((|greater_SI| |i| #3#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |res1|
                                 (SPADCALL |res1|
                                           (SPADCALL
                                            (SPADCALL |mp| |i0|
                                                      (PROG1
                                                          (LETT #4#
                                                                (- (- |i1| |i|)
                                                                   1))
                                                        (|check_subtype2|
                                                         (>= #4# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #4#))
                                                      (QREFELT % 28))
                                            |i| (QREFELT % 29))
                                           (QREFELT % 30)))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (LETT |res1|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (|spadConstant| % 10) (QREFELT % 31))
                            (PROG1 (LETT #5# (- |i1| |i0|))
                              (|check_subtype2| (>= #5# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #5#))
                            (QREFELT % 29))
                           |res1| (QREFELT % 30)))
                    (COND
                     ((EVENP (- |i1| |i0|))
                      (LETT |res1| (SPADCALL |res1| (QREFELT % 32)))))
                    (EXIT (LETT |res| (SPADCALL |res| |res1| (QREFELT % 33)))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(DECLAIM (NOTINLINE |CharacteristicPolynomial2;|)) 

(DEFUN |CharacteristicPolynomial2;| (|#1|)
  (SPROG ((DV$1 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|CharacteristicPolynomial2| DV$1))
          (LETT % (GETREFV 35))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|CharacteristicPolynomial2|
                      (LIST DV$1) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |CharacteristicPolynomial2| (#1=#:G60)
  (SPROG NIL
         (PROG (#2=#:G61)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|CharacteristicPolynomial2|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|CharacteristicPolynomial2;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|CharacteristicPolynomial2|)))))))))) 

(MAKEPROP '|CharacteristicPolynomial2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Boolean|)
              (|NonNegativeInteger|) (0 . ~=) (6 . |1|) (10 . |0|) (14 . =)
              (20 . ~=) (|Integer|) (|Matrix| 6) (26 . |swapRows!|)
              (33 . |swapColumns!|) (40 . /) (46 . *) (52 . -) (58 . +)
              (|Record| (|:| |matrix| 15) (|:| |block_list| (|List| 14)))
              |CHARPOL2;danilewski;MR;1| (64 . |copy|)
              (|SparseUnivariatePolynomial| 6) (69 . |1|) (73 . |0|)
              (77 . |elt|) (84 . |monomial|) (90 . +) (96 . -) (101 . -)
              (106 . *) |CHARPOL2;char_pol;MSup;2|)
           '#(|danilewski| 112 |char_pol| 117) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|danilewski|
                                 ((|Record| (|:| |matrix| (|Matrix| |#1|))
                                            (|:| |block_list|
                                                 (|List| (|Integer|))))
                                  (|Matrix| |#1|)))
                                T)
                              '((|char_pol|
                                 ((|SparseUnivariatePolynomial| |#1|)
                                  (|Matrix| |#1|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 34
                                            '(2 8 7 0 0 9 0 6 0 10 0 6 0 11 2 6
                                              7 0 0 12 2 6 7 0 0 13 3 15 0 0 14
                                              14 16 3 15 0 0 14 14 17 2 6 0 0 0
                                              18 2 6 0 0 0 19 2 6 0 0 0 20 2 6
                                              0 0 0 21 1 15 0 0 24 0 25 0 26 0
                                              25 0 27 3 15 6 0 14 14 28 2 25 0
                                              6 8 29 2 25 0 0 0 30 1 6 0 0 31 1
                                              25 0 0 32 2 25 0 0 0 33 1 0 22 15
                                              23 1 0 25 15 34)))))
           '|lookupComplete|)) 
