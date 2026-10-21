
(SDEFUN |REP;evalvect|
        ((|vect| (|Matrix| (|Fraction| (|Polynomial| (|Integer|)))))
         (|alg| (|Expression| (|Integer|))) (|x| (|Symbol|))
         (% (|Matrix| (|Expression| (|Integer|)))))
        (SPROG
         ((|n| (|NonNegativeInteger|))
          (|xx| (|Kernel| (|Expression| (|Integer|))))
          (|w| (|Matrix| (|Expression| (|Integer|)))) (|i| NIL) (#1=#:G10 NIL)
          (|v| (|Expression| (|Integer|))))
         (SEQ (LETT |n| (ANROWS |vect|))
              (LETT |xx| (SPADCALL |x| (QREFELT % 9)))
              (LETT |w| (SPADCALL |n| 1 (QREFELT % 14)))
              (SEQ (LETT |i| 1) (LETT #1# |n|) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (LETT |v|
                          (SPADCALL
                           (SPADCALL (SPADCALL |vect| |i| 1 (QREFELT % 18))
                                     (QREFELT % 19))
                           |xx| |alg| (QREFELT % 21)))
                    (EXIT (SPADCALL |w| |i| 1 |v| (QREFELT % 22))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |w|)))) 

(SDEFUN |REP;innerprod|
        ((|v1| (|Matrix| (|Expression| (|Integer|))))
         (|v2| (|Matrix| (|Expression| (|Integer|))))
         (% (|Expression| (|Integer|))))
        (SPADCALL (SPADCALL (SPADCALL |v1| (QREFELT % 23)) |v2| (QREFELT % 24))
                  1 1 (QREFELT % 25))) 

(SDEFUN |REP;normalise;2M;3|
        ((|v| (|Matrix| (|Expression| (|Integer|))))
         (% (|Matrix| (|Expression| (|Integer|)))))
        (SPROG ((|normv| (|Expression| (|Integer|))))
               (SEQ
                (LETT |normv|
                      (SPADCALL (|REP;innerprod| |v| |v| %) (QREFELT % 26)))
                (EXIT
                 (COND
                  ((SPADCALL |normv| (|spadConstant| % 27) (QREFELT % 29)) |v|)
                  ('T
                   (SPADCALL
                    (SPADCALL (|spadConstant| % 11) |normv| (QREFELT % 30)) |v|
                    (QREFELT % 31)))))))) 

(SDEFUN |REP;radicalEigenvalues;ML;4|
        ((A (|Matrix| (|Fraction| (|Polynomial| (|Integer|)))))
         (% (|List| (|Expression| (|Integer|)))))
        (SPROG
         ((|x| (|Symbol|)) (|pol| (|Fraction| (|Polynomial| (|Integer|)))))
         (SEQ (LETT |x| (SPADCALL (QREFELT % 33)))
              (LETT |pol|
                    (SPADCALL (SPADCALL A |x| (QREFELT % 36)) (QREFELT % 37)))
              (EXIT (SPADCALL |pol| |x| (QREFELT % 39)))))) 

(SDEFUN |REP;radicalEigenvector;EML;5|
        ((|alpha| (|Expression| (|Integer|)))
         (A (|Matrix| (|Fraction| (|Polynomial| (|Integer|)))))
         (% (|List| (|Matrix| (|Expression| (|Integer|))))))
        (SPROG
         ((|n| (|NonNegativeInteger|))
          (B (|Matrix| (|Expression| (|Integer|)))) (|i| NIL) (#1=#:G26 NIL)
          (|j| NIL) (#2=#:G27 NIL) (#3=#:G28 NIL) (|v| NIL) (#4=#:G29 NIL))
         (SEQ (LETT |n| (ANROWS A)) (LETT B (SPADCALL |n| |n| (QREFELT % 14)))
              (SEQ (LETT |i| 1) (LETT #1# |n|) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (SEQ (LETT |j| 1) (LETT #2# |n|) G190
                         (COND ((|greater_SI| |j| #2#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SPADCALL B |i| |j|
                                     (SPADCALL
                                      (SPADCALL A |i| |j| (QREFELT % 18))
                                      (QREFELT % 19))
                                     (QREFELT % 22))))
                         (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (SPADCALL B |i| |i|
                               (SPADCALL (SPADCALL B |i| |i| (QREFELT % 25))
                                         |alpha| (QREFELT % 41))
                               (QREFELT % 22))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (PROGN
                (LETT #3# NIL)
                (SEQ (LETT |v| NIL) (LETT #4# (SPADCALL B (QREFELT % 43))) G190
                     (COND
                      ((OR (ATOM #4#) (PROGN (LETT |v| (CAR #4#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #3# (CONS (SPADCALL |v| (QREFELT % 45)) #3#))))
                     (LETT #4# (CDR #4#)) (GO G190) G191
                     (EXIT (NREVERSE #3#)))))))) 

(SDEFUN |REP;radicalEigenvectors;ML;6|
        ((A (|Matrix| (|Fraction| (|Polynomial| (|Integer|)))))
         (%
          (|List|
           #1=(|Record| (|:| |radval| (|Expression| (|Integer|)))
                        (|:| |radmult| (|Integer|))
                        (|:| |radvect|
                             (|List|
                              (|Matrix| (|Expression| (|Integer|)))))))))
        (SPROG
         ((|leig|
           (|List|
            (|Record|
             (|:| |eigval|
                  (|Union| (|Fraction| (|Polynomial| (|Integer|)))
                           (|SuchThat| (|Symbol|) (|Polynomial| (|Integer|)))))
             (|:| |eigmult| (|NonNegativeInteger|))
             (|:| |eigvec|
                  (|List|
                   (|Matrix| (|Fraction| (|Polynomial| (|Integer|)))))))))
          (|n| (|NonNegativeInteger|)) (|eig| NIL) (#2=#:G59 NIL) (|ll| NIL)
          (#3=#:G60 NIL) (|m| (|Matrix| (|Expression| (|Integer|)))) (|i| NIL)
          (#4=#:G61 NIL)
          (|veclist| (|List| (|Matrix| (|Expression| (|Integer|)))))
          (#5=#:G39 NIL) (#6=#:G40 NIL)
          (|sym| (|SuchThat| (|Symbol|) (|Polynomial| (|Integer|))))
          (|xx| (|Symbol|)) (|lval| (|List| (|Expression| (|Integer|))))
          (|alg| NIL) (#7=#:G62 NIL) (#8=#:G63 NIL) (|ep| NIL) (#9=#:G64 NIL)
          (|nsl| #1#)
          (|sln|
           (|List|
            (|Record| (|:| |radval| (|Expression| (|Integer|)))
                      (|:| |radmult| (|Integer|))
                      (|:| |radvect|
                           (|List| (|Matrix| (|Expression| (|Integer|)))))))))
         (SEQ (LETT |leig| (SPADCALL A (QREFELT % 51))) (LETT |n| (ANROWS A))
              (LETT |sln| NIL)
              (SEQ (LETT |eig| NIL) (LETT #2# |leig|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |eig| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((QEQCAR (QVELT |eig| 0) 0)
                       (SEQ (LETT |veclist| NIL)
                            (SEQ (LETT |ll| NIL) (LETT #3# (QVELT |eig| 2))
                                 G190
                                 (COND
                                  ((OR (ATOM #3#)
                                       (PROGN (LETT |ll| (CAR #3#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |m| (SPADCALL |n| 1 (QREFELT % 14)))
                                  (SEQ (LETT |i| 1) (LETT #4# |n|) G190
                                       (COND
                                        ((|greater_SI| |i| #4#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (SPADCALL |m| |i| 1
                                                   (SPADCALL
                                                    (SPADCALL |ll| |i| 1
                                                              (QREFELT % 18))
                                                    (QREFELT % 19))
                                                   (QREFELT % 22))))
                                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                       (EXIT NIL))
                                  (EXIT (LETT |veclist| (CONS |m| |veclist|))))
                                 (LETT #3# (CDR #3#)) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT
                             (LETT |sln|
                                   (CONS
                                    (VECTOR
                                     (SPADCALL
                                      (PROG2 (LETT #5# (QVELT |eig| 0))
                                          (QCDR #5#)
                                        (|check_union2| (QEQCAR #5# 0)
                                                        (|Fraction|
                                                         (|Polynomial|
                                                          (|Integer|)))
                                                        (|Union|
                                                         (|Fraction|
                                                          (|Polynomial|
                                                           (|Integer|)))
                                                         (|SuchThat| (|Symbol|)
                                                                     (|Polynomial|
                                                                      (|Integer|))))
                                                        #5#))
                                      (QREFELT % 19))
                                     (QVELT |eig| 1) |veclist|)
                                    |sln|)))))
                      ('T
                       (SEQ
                        (LETT |sym|
                              (PROG2 (LETT #6# (QVELT |eig| 0))
                                  (QCDR #6#)
                                (|check_union2| (QEQCAR #6# 1)
                                                (|SuchThat| (|Symbol|)
                                                            (|Polynomial|
                                                             (|Integer|)))
                                                (|Union|
                                                 (|Fraction|
                                                  (|Polynomial| (|Integer|)))
                                                 (|SuchThat| (|Symbol|)
                                                             (|Polynomial|
                                                              (|Integer|))))
                                                #6#)))
                        (LETT |xx| (SPADCALL |sym| (QREFELT % 53)))
                        (LETT |lval|
                              (SPADCALL
                               (SPADCALL (SPADCALL |sym| (QREFELT % 54))
                                         (QREFELT % 37))
                               |xx| (QREFELT % 39)))
                        (EXIT
                         (SEQ (LETT |alg| NIL) (LETT #7# |lval|) G190
                              (COND
                               ((OR (ATOM #7#)
                                    (PROGN (LETT |alg| (CAR #7#)) NIL))
                                (GO G191)))
                              (SEQ
                               (LETT |nsl|
                                     (VECTOR |alg| (QVELT |eig| 1)
                                             (PROGN
                                              (LETT #8# NIL)
                                              (SEQ (LETT |ep| NIL)
                                                   (LETT #9# (QVELT |eig| 2))
                                                   G190
                                                   (COND
                                                    ((OR (ATOM #9#)
                                                         (PROGN
                                                          (LETT |ep| (CAR #9#))
                                                          NIL))
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (LETT #8#
                                                           (CONS
                                                            (|REP;evalvect|
                                                             |ep| |alg| |xx| %)
                                                            #8#))))
                                                   (LETT #9# (CDR #9#))
                                                   (GO G190) G191
                                                   (EXIT (NREVERSE #8#))))))
                               (EXIT (LETT |sln| (CONS |nsl| |sln|))))
                              (LETT #7# (CDR #7#)) (GO G190) G191
                              (EXIT NIL))))))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT |sln|)))) 

(SDEFUN |REP;gramschmidt;2L;7|
        ((|lvect| (|List| (|Matrix| (|Expression| (|Integer|)))))
         (% (|List| (|Matrix| (|Expression| (|Integer|))))))
        (SPROG
         ((|v| (|Matrix| (|Expression| (|Integer|))))
          (|n| #1=(|NonNegativeInteger|)) (#2=#:G67 NIL)
          (RMR
           (|Join|
            (|RectangularMatrixCategory|
             #3=(PROG1
                    (LET #4=#:G66
                      |n|)
                  (|check_subtype2| (> #4# 0) '(|PositiveInteger|) '#1# #4#))
             #5=(|call| (XLAM |ignore| 1)) #6=(|Expression| (|Integer|))
             (|DirectProduct| #5# #6#) (|DirectProduct| #3# #6#))
            (|CoercibleTo| (|Matrix| #6#))
            (CATEGORY |domain|
             (IF (|has| #6# (|ConvertibleTo| (|InputForm|)))
                 (ATTRIBUTE (|ConvertibleTo| (|InputForm|)))
                 |noBranch|)
             (SIGNATURE |rectangularMatrix| (% (|Matrix| #6#)))
             (SIGNATURE |coerce| ((|Matrix| #6#) %)))))
          (#7=#:G79 NIL) (|w| NIL) (#8=#:G80 NIL) (#9=#:G74 (RMR))
          (#10=#:G72 (RMR)) (#11=#:G73 NIL)
          (|pol| (|Matrix| (|Expression| (|Integer|))))
          (|orth| (|List| (|Matrix| (|Expression| (|Integer|))))))
         (SEQ
          (COND ((SPADCALL |lvect| NIL (QREFELT % 58)) NIL)
                ('T
                 (SEQ (LETT |v| (|SPADfirst| |lvect|)) (LETT |n| (ANROWS |v|))
                      (LETT RMR
                            (|RectangularMatrix|
                             (PROG1 (LETT #2# |n|)
                               (|check_subtype2| (> #2# 0) '(|PositiveInteger|)
                                                 '(|NonNegativeInteger|) #2#))
                             1 (|Expression| (|Integer|))))
                      (LETT |orth| (LIST (SPADCALL |v| (QREFELT % 32))))
                      (SEQ (LETT #7# (CDR |lvect|)) G190
                           (COND
                            ((OR (ATOM #7#) (PROGN (LETT |v| (CAR #7#)) NIL))
                             (GO G191)))
                           (SEQ
                            (LETT |pol|
                                  (SPADCALL
                                   (SPADCALL |v|
                                             (PROGN
                                              (LETT #11# NIL)
                                              (SEQ (LETT |w| NIL)
                                                   (LETT #8# |orth|) G190
                                                   (COND
                                                    ((OR (ATOM #8#)
                                                         (PROGN
                                                          (LETT |w| (CAR #8#))
                                                          NIL))
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (PROGN
                                                      (LETT #9#
                                                            (SPADCALL
                                                             (|REP;innerprod|
                                                              |w| |v| %)
                                                             |w|
                                                             (QREFELT % 31)))
                                                      (COND
                                                       (#11#
                                                        (LETT #10#
                                                              (SPADCALL #10#
                                                                        #9#
                                                                        (|compiledLookupCheck|
                                                                         '+
                                                                         (LIST
                                                                          '% '%
                                                                          '%)
                                                                         RMR))))
                                                       ('T
                                                        (PROGN
                                                         (LETT #10# #9#)
                                                         (LETT #11# 'T)))))))
                                                   (LETT #8# (CDR #8#))
                                                   (GO G190) G191 (EXIT NIL))
                                              (COND (#11# #10#)
                                                    ('T
                                                     (SPADCALL
                                                      (|compiledLookupCheck|
                                                       '|0| (LIST '%) RMR)))))
                                             (|compiledLookupCheck| '-
                                                                    (LIST '% '%
                                                                          '%)
                                                                    RMR))
                                   (|compiledLookupCheck| '|coerce|
                                                          (LIST
                                                           (LIST '|Matrix|
                                                                 (LIST
                                                                  '|Expression|
                                                                  (LIST
                                                                   '|Integer|)))
                                                           '%)
                                                          RMR)))
                            (EXIT
                             (LETT |orth|
                                   (CONS (SPADCALL |pol| (QREFELT % 32))
                                         |orth|))))
                           (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
                      (EXIT |orth|))))))) 

(SDEFUN |REP;eigenMatrix;MU;8|
        ((A (|Matrix| (|Fraction| (|Polynomial| (|Integer|)))))
         (% (|Union| (|Matrix| (|Expression| (|Integer|))) "failed")))
        (SPROG
         ((|eiv| NIL) (#1=#:G96 NIL)
          (#2=#:G87 #3=(|List| (|Matrix| (|Expression| (|Integer|)))))
          (#4=#:G85 #3#) (#5=#:G86 NIL) (|lef| #3#)
          (|n| (|NonNegativeInteger|)) (|v| NIL) (#6=#:G97 NIL)
          (|d| (|Matrix| (|Expression| (|Integer|)))))
         (SEQ
          (LETT |lef|
                (PROGN
                 (LETT #5# NIL)
                 (SEQ (LETT |eiv| NIL) (LETT #1# (SPADCALL A (QREFELT % 57)))
                      G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |eiv| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #2# (QVELT |eiv| 2))
                         (COND
                          (#5# (LETT #4# (SPADCALL #4# #2# (QREFELT % 60))))
                          ('T (PROGN (LETT #4# #2#) (LETT #5# 'T)))))))
                      (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                 (COND (#5# #4#) (#7='T NIL))))
          (LETT |n| (ANROWS A))
          (EXIT
           (COND ((< (LENGTH |lef|) |n|) (CONS 1 "failed"))
                 (#7#
                  (SEQ (LETT |d| (SPADCALL (|SPADfirst| |lef|) (QREFELT % 61)))
                       (SEQ (LETT |v| NIL) (LETT #6# (CDR |lef|)) G190
                            (COND
                             ((OR (ATOM #6#) (PROGN (LETT |v| (CAR #6#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT |d| (SPADCALL |d| |v| (QREFELT % 62)))))
                            (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
                       (EXIT (CONS 0 |d|))))))))) 

(SDEFUN |REP;orthonormalBasis;ML;9|
        ((A (|Matrix| (|Fraction| (|Polynomial| (|Integer|)))))
         (% (|List| (|Matrix| (|Expression| (|Integer|))))))
        (SPROG
         ((|alglist|
           (|List|
            (|Record| (|:| |radval| (|Expression| (|Integer|)))
                      (|:| |radmult| (|Integer|))
                      (|:| |radvect|
                           (|List| (|Matrix| (|Expression| (|Integer|))))))))
          (|alterm| NIL) (#1=#:G107 NIL)
          (|lvec| (|List| (|Matrix| (|Expression| (|Integer|)))))
          (|basis| (|List| (|Matrix| (|Expression| (|Integer|))))))
         (SEQ
          (COND
           ((NULL (SPADCALL A (QREFELT % 65)))
            (|error| "the matrix is not symmetric"))
           ('T
            (SEQ (LETT |basis| NIL) (LETT |lvec| NIL)
                 (LETT |alglist| (SPADCALL A (QREFELT % 57)))
                 (SEQ (LETT |alterm| NIL) (LETT #1# |alglist|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |alterm| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (SEQ (LETT |lvec| (QVELT |alterm| 2))
                            (EXIT
                             (COND
                              ((SPADCALL |lvec| NIL (QREFELT % 58))
                               (|error| "sorry ")))))
                       (EXIT
                        (COND
                         ((> (LENGTH |lvec|) 1)
                          (SEQ (LETT |lvec| (SPADCALL |lvec| (QREFELT % 59)))
                               (EXIT
                                (LETT |basis|
                                      (SPADCALL |lvec| |basis|
                                                (QREFELT % 60))))))
                         ('T
                          (LETT |basis|
                                (CONS
                                 (SPADCALL (|SPADfirst| |lvec|) (QREFELT % 32))
                                 |basis|))))))
                      (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                 (EXIT |basis|))))))) 

(DECLAIM (NOTINLINE |RadicalEigenPackage;|)) 

(DEFUN |RadicalEigenPackage;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|RadicalEigenPackage|))
          (LETT % (GETREFV 67))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|RadicalEigenPackage| NIL
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 6 (|RadicalSolvePackage| (|Integer|)))
          %))) 

(DEFUN |RadicalEigenPackage| ()
  (SPROG NIL
         (PROG (#1=#:G109)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|RadicalEigenPackage|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|RadicalEigenPackage|
                             (LIST
                              (CONS NIL (CONS 1 (|RadicalEigenPackage;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|RadicalEigenPackage|)))))))))) 

(MAKEPROP '|RadicalEigenPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL 'RSP (|Symbol|) (|Kernel| 10)
              (0 . |kernel|) (|Expression| 16) (5 . |1|) (|NonNegativeInteger|)
              (|Matrix| 10) (9 . |zero|) (|Fraction| 34) (|Integer|)
              (|Matrix| 15) (15 . |elt|) (22 . |coerce|) (|Kernel| %)
              (27 . |eval|) (34 . |setelt!|) (42 . |transpose|) (47 . *)
              (53 . |elt|) (60 . |sqrt|) (65 . |0|) (|Boolean|) (69 . =)
              (75 . /) (81 . *) |REP;normalise;2M;3| (87 . |new|)
              (|Polynomial| 16) (|EigenPackage| 16)
              (91 . |characteristicPolynomial|) (97 . |coerce|) (|List| 10)
              (102 . |radicalRoots|) |REP;radicalEigenvalues;ML;4| (108 . -)
              (|List| 44) (114 . |nullSpace|) (|Vector| 10) (119 . |coerce|)
              (|List| 13) |REP;radicalEigenvector;EML;5| (|Union| 15 52)
              (|Record| (|:| |eigval| 48) (|:| |eigmult| 12)
                        (|:| |eigvec| (|List| 17)))
              (|List| 49) (124 . |eigenvectors|) (|SuchThat| 7 34)
              (129 . |lhs|) (134 . |rhs|)
              (|Record| (|:| |radval| 10) (|:| |radmult| 16)
                        (|:| |radvect| 46))
              (|List| 55) |REP;radicalEigenvectors;ML;6| (139 . =)
              |REP;gramschmidt;2L;7| (145 . |append|) (151 . |copy|)
              (156 . |horizConcat|) (|Union| 13 '"failed")
              |REP;eigenMatrix;MU;8| (162 . |symmetric?|)
              |REP;orthonormalBasis;ML;9|)
           '#(|radicalEigenvectors| 167 |radicalEigenvector| 172
              |radicalEigenvalues| 178 |orthonormalBasis| 183 |normalise| 188
              |gramschmidt| 193 |eigenMatrix| 198)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|radicalEigenvectors|
                                 ((|List|
                                   (|Record|
                                    (|:| |radval| (|Expression| (|Integer|)))
                                    (|:| |radmult| (|Integer|))
                                    (|:| |radvect|
                                         (|List|
                                          (|Matrix|
                                           (|Expression| (|Integer|)))))))
                                  (|Matrix|
                                   (|Fraction| (|Polynomial| (|Integer|))))))
                                T)
                              '((|radicalEigenvector|
                                 ((|List|
                                   (|Matrix| (|Expression| (|Integer|))))
                                  (|Expression| (|Integer|))
                                  (|Matrix|
                                   (|Fraction| (|Polynomial| (|Integer|))))))
                                T)
                              '((|radicalEigenvalues|
                                 ((|List| (|Expression| (|Integer|)))
                                  (|Matrix|
                                   (|Fraction| (|Polynomial| (|Integer|))))))
                                T)
                              '((|eigenMatrix|
                                 ((|Union|
                                   (|Matrix| (|Expression| (|Integer|)))
                                   "failed")
                                  (|Matrix|
                                   (|Fraction| (|Polynomial| (|Integer|))))))
                                T)
                              '((|normalise|
                                 ((|Matrix| (|Expression| (|Integer|)))
                                  (|Matrix| (|Expression| (|Integer|)))))
                                T)
                              '((|gramschmidt|
                                 ((|List|
                                   (|Matrix| (|Expression| (|Integer|))))
                                  (|List|
                                   (|Matrix| (|Expression| (|Integer|))))))
                                T)
                              '((|orthonormalBasis|
                                 ((|List|
                                   (|Matrix| (|Expression| (|Integer|))))
                                  (|Matrix|
                                   (|Fraction| (|Polynomial| (|Integer|))))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 66
                                            '(1 8 0 7 9 0 10 0 11 2 13 0 12 12
                                              14 3 17 15 0 16 16 18 1 10 0 15
                                              19 3 10 0 0 20 0 21 4 13 10 0 16
                                              16 10 22 1 13 0 0 23 2 13 0 0 0
                                              24 3 13 10 0 16 16 25 1 10 0 0 26
                                              0 10 0 27 2 10 28 0 0 29 2 10 0 0
                                              0 30 2 13 0 10 0 31 0 7 0 33 2 35
                                              34 17 7 36 1 15 0 34 37 2 6 38 15
                                              7 39 2 10 0 0 0 41 1 13 42 0 43 1
                                              13 0 44 45 1 35 50 17 51 1 52 7 0
                                              53 1 52 34 0 54 2 46 28 0 0 58 2
                                              46 0 0 0 60 1 13 0 0 61 2 13 0 0
                                              0 62 1 17 28 0 65 1 0 56 17 57 2
                                              0 46 10 17 47 1 0 38 17 40 1 0 46
                                              17 66 1 0 13 13 32 1 0 46 46 59 1
                                              0 63 17 64)))))
           '|lookupComplete|)) 
