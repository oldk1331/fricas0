
(PUT '|I32MAT;minRowIndex;%I;1| '|SPADreplace| '(XLAM (|x|) 0)) 

(SDEFUN |I32MAT;minRowIndex;%I;1| ((|x| (%)) (% (|Integer|))) 0) 

(PUT '|I32MAT;minColIndex;%I;2| '|SPADreplace| '(XLAM (|x|) 0)) 

(SDEFUN |I32MAT;minColIndex;%I;2| ((|x| (%)) (% (|Integer|))) 0) 

(PUT '|I32MAT;nrows;%Nni;3| '|SPADreplace| 'ANROWS_I32) 

(SDEFUN |I32MAT;nrows;%Nni;3| ((|x| (%)) (% (|NonNegativeInteger|)))
        (ANROWS_I32 |x|)) 

(PUT '|I32MAT;ncols;%Nni;4| '|SPADreplace| 'ANCOLS_I32) 

(SDEFUN |I32MAT;ncols;%Nni;4| ((|x| (%)) (% (|NonNegativeInteger|)))
        (ANCOLS_I32 |x|)) 

(SDEFUN |I32MAT;maxRowIndex;%I;5| ((|x| (%)) (% (|Integer|)))
        (- (ANROWS_I32 |x|) 1)) 

(SDEFUN |I32MAT;maxColIndex;%I;6| ((|x| (%)) (% (|Integer|)))
        (- (ANCOLS_I32 |x|) 1)) 

(PUT '|I32MAT;qelt;%3I;7| '|SPADreplace| 'AREF2_I32) 

(SDEFUN |I32MAT;qelt;%3I;7|
        ((|m| (%)) (|i| #1=(|Integer|)) (|j| #1#) (% (|Integer|)))
        (AREF2_I32 |m| |i| |j|)) 

(PUT '|I32MAT;elt;%3I;8| '|SPADreplace| 'AREF2_I32) 

(SDEFUN |I32MAT;elt;%3I;8|
        ((|m| (%)) (|i| #1=(|Integer|)) (|j| #1#) (% (|Integer|)))
        (AREF2_I32 |m| |i| |j|)) 

(PUT '|I32MAT;qsetelt!;%4I;9| '|SPADreplace| 'SETAREF2_I32) 

(SDEFUN |I32MAT;qsetelt!;%4I;9|
        ((|m| (%)) (|i| #1=(|Integer|)) (|j| #1#) (|r| #2=(|Integer|)) (% #2#))
        (SETAREF2_I32 |m| |i| |j| |r|)) 

(PUT '|I32MAT;setelt!;%4I;10| '|SPADreplace| 'SETAREF2_I32) 

(SDEFUN |I32MAT;setelt!;%4I;10|
        ((|m| (%)) (|i| #1=(|Integer|)) (|j| #1#) (|r| #2=(|Integer|)) (% #2#))
        (SETAREF2_I32 |m| |i| |j| |r|)) 

(PUT '|I32MAT;empty;%;11| '|SPADreplace| '(XLAM NIL (MAKE_MATRIX_I32 0 0))) 

(SDEFUN |I32MAT;empty;%;11| ((% (%))) (MAKE_MATRIX_I32 0 0)) 

(PUT '|I32MAT;qnew;2Nni%;12| '|SPADreplace| 'MAKE_MATRIX_I32) 

(SDEFUN |I32MAT;qnew;2Nni%;12|
        ((|rows| #1=(|NonNegativeInteger|)) (|cols| #1#) (% (%)))
        (MAKE_MATRIX_I32 |rows| |cols|)) 

(PUT '|I32MAT;new;2NniI%;13| '|SPADreplace| 'MAKE_MATRIX1_I32) 

(SDEFUN |I32MAT;new;2NniI%;13|
        ((|rows| #1=(|NonNegativeInteger|)) (|cols| #1#) (|a| (|Integer|))
         (% (%)))
        (MAKE_MATRIX1_I32 |rows| |cols| |a|)) 

(DECLAIM (NOTINLINE |I32Matrix;|)) 

(DEFUN |I32Matrix| ()
  (SPROG NIL
         (PROG (#1=#:G2530)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|I32Matrix|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|I32Matrix|
                             (LIST (CONS NIL (CONS 1 (|I32Matrix;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|I32Matrix|)))))))))) 

(DEFUN |I32Matrix;| ()
  (SPROG
   ((|dv$| NIL) (% NIL) (#1=#:G2527 NIL) (#2=#:G2528 NIL) (#3=#:G2526 NIL)
    (|pv$| NIL))
   (PROGN
    (LETT |dv$| '(|I32Matrix|))
    (LETT % (GETREFV 46))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| (|Integer|)
                                                       '(|Comparable|))
                                        (|HasCategory| (|Integer|)
                                                       '(|Hashable|))
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))
                                        (|HasCategory| (|Integer|)
                                                       '(|BasicType|))
                                        (LETT #1#
                                              (|HasCategory| (|Integer|)
                                                             '(|SetCategory|)))
                                        (OR
                                         (|HasCategory| (|Integer|)
                                                        '(|Comparable|))
                                         #1#)
                                        (OR
                                         (|HasCategory| (|Integer|)
                                                        '(|BasicType|))
                                         (|HasCategory| (|Integer|)
                                                        '(|Comparable|))
                                         (|HasCategory| (|Integer|)
                                                        '(|Hashable|))
                                         #1#)
                                        (LETT #2#
                                              (AND
                                               (|HasCategory| (|Integer|)
                                                              '(|Evalable|
                                                                (|Integer|)))
                                               (|HasCategory| (|Integer|)
                                                              '(|SetCategory|))))
                                        (OR
                                         (AND
                                          (|HasCategory| (|Integer|)
                                                         '(|Evalable|
                                                           (|Integer|)))
                                          (|HasCategory| (|Integer|)
                                                         '(|Comparable|)))
                                         #2#)
                                        (LETT #3#
                                              (|HasCategory| (|Integer|)
                                                             '(|CoercibleTo|
                                                               (|OutputForm|))))
                                        (OR #3# #2#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianGroup|))
                                        (|HasCategory| (|Integer|)
                                                       '(|SemiRng|))
                                        (AND
                                         (|HasCategory| (|Integer|)
                                                        '(|Monoid|))
                                         (|HasCategory| (|Integer|)
                                                        '(|SemiRng|)))
                                        (|HasCategory| (|Integer|)
                                                       '(|EuclideanDomain|))
                                        (|HasCategory| (|Integer|)
                                                       '(|IntegralDomain|))
                                        (|HasCategory| (|Integer|)
                                                       '(|CommutativeRing|))
                                        (|HasCategory| (|Integer|)
                                                       '(|Field|))))))
    (|haddProp| |$ConstructorCache| '|I32Matrix| NIL (CONS 1 %))
    (|stuffDomainSlots| %)
    (AND (|HasCategory| % '(|finiteAggregate|)) (|augmentPredVector| % 262144))
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|HasCategory| (|Integer|) '(|OrderedSet|))
         (|augmentPredVector| % 524288))
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|HasCategory| (|Integer|) '(|BasicType|))
         (|augmentPredVector| % 1048576))
    (AND
     (OR
      (AND (|HasCategory| % '(|finiteAggregate|))
           (|HasCategory| (|Integer|) '(|BasicType|)))
      (|HasCategory| (|Integer|) '(|Hashable|)) #1#)
     (|augmentPredVector| % 2097152))
    (SETF |pv$| (QREFELT % 3))
    %))) 

(MAKEPROP '|I32Matrix| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Integer|) |I32MAT;minRowIndex;%I;1|
              |I32MAT;minColIndex;%I;2| (|NonNegativeInteger|)
              |I32MAT;nrows;%Nni;3| |I32MAT;ncols;%Nni;4|
              |I32MAT;maxRowIndex;%I;5| |I32MAT;maxColIndex;%I;6|
              |I32MAT;qelt;%3I;7| |I32MAT;elt;%3I;8| |I32MAT;qsetelt!;%4I;9|
              |I32MAT;setelt!;%4I;10| |I32MAT;empty;%;11|
              |I32MAT;qnew;2Nni%;12| |I32MAT;new;2NniI%;13| (|List| 6)
              (|Equation| 6) (|List| 22) (|Boolean|) (|OutputForm|) (|List| 30)
              (|Union| % '"failed") (|SingleInteger|) (|HashState|)
              (|I32Vector|) (|List| %) (|String|) (|Mapping| 24 6 6)
              (|Mapping| 24 6) (|Void|) (|List| 43) (|Union| 6 '"one")
              (|Mapping| 6 6 6) (|List| 21) (|Mapping| 6 6) (|List| 31)
              (|PositiveInteger|) (|List| 9) (|List| 45) (|Segment| 6))
           '#(~= 0 |zero?| 6 |zero| 11 |vertSplit| 17 |vertConcat| 29
              |transpose| 40 |symmetric?| 50 |swapRows!| 55 |swapColumns!| 62
              |subMatrix| 69 |squareTop| 78 |square?| 83 |smaller?| 88 |size?|
              94 |setsubMatrix!| 100 |setelt!| 108 |setRow!| 204 |setColumn!|
              211 |scalarMatrix| 218 |sample| 224 |rowSlice| 228 |rowEchelon|
              233 |row| 238 |rank| 244 |qsetelt!| 249 |qnew| 257 |qelt| 263
              |positivePower| 270 |parts| 276 |nullity| 281 |nullSpace| 286
              |nrows| 291 |new| 296 |ncols| 303 |more?| 308 |minordet| 314
              |minRowIndex| 319 |minColIndex| 324 |min| 329 |members| 334
              |member?| 339 |maxRowIndex| 345 |maxColIndex| 350 |max| 355
              |matrix| 366 |map!| 378 |map| 384 |listOfLists| 405 |less?| 410
              |latex| 416 |kronecker_prod1| 421 |kroneckerSum| 432
              |kroneckerProduct| 443 |inverse| 454 |horizSplit| 459
              |horizConcat| 471 |hashUpdate!| 482 |hash| 488 |fill!| 493
              |exquo| 499 |every?| 505 |eval| 511 |eq?| 537 |empty?| 543
              |empty| 548 |elt| 552 |diagonalMatrix| 644 |diagonal?| 654
              |determinant| 659 |count| 664 |copy| 676 |columnSpace| 681
              |column| 686 |colSlice| 692 |coerce| 697 |blockSplit| 707
              |blockConcat| 721 |array2| 726 |any?| 731 |antisymmetric?| 737 ^
              742 |Pfaffian| 754 = 759 / 765 - 771 + 782 * 788 |#| 824)
           'NIL
           (CONS (|makeByteWordVec2| 11 '(0 0 0 1 0 9 6 2 0 0 0 9 11 7))
                 (CONS
                  '#(|MatrixCategory&| |TwoDimensionalArrayCategory&|
                     |HomogeneousAggregate&| NIL |Aggregate&| |Evalable&|
                     |SetCategory&| |Hashable&| NIL NIL NIL |InnerEvalable&|
                     NIL |BasicType&|)
                  (CONS
                   '#((|MatrixCategory| 6 30 30)
                      (|TwoDimensionalArrayCategory| 6 30 30)
                      (|HomogeneousAggregate| 6) (|Comparable|) (|Aggregate|)
                      (|Evalable| 6) (|SetCategory|) (|Hashable|) (|Type|)
                      (|finiteAggregate|) (|shallowlyMutable|)
                      (|InnerEvalable| 6 6) (|CoercibleTo| 25) (|BasicType|))
                   (|makeByteWordVec2| 45
                                       '(2 22 24 0 0 1 1 0 24 0 1 2 0 0 9 9 1 2
                                         0 31 0 42 1 2 0 31 0 43 1 1 0 0 31 1 2
                                         0 0 0 0 1 1 0 0 30 1 1 0 0 0 1 1 0 24
                                         0 1 3 0 0 0 6 6 1 3 0 0 0 6 6 1 5 0 0
                                         0 6 6 6 6 1 1 0 0 0 1 1 0 24 0 1 2 1
                                         24 0 0 1 2 0 24 0 9 1 4 0 0 0 6 6 0 1
                                         4 0 0 0 44 44 0 1 4 0 0 0 45 44 0 1 4
                                         0 0 0 44 45 0 1 4 0 0 0 21 45 0 1 4 0
                                         0 0 45 21 0 1 4 0 0 0 21 21 0 1 4 0 0
                                         0 45 45 0 1 4 0 0 0 6 21 0 1 4 0 0 0
                                         21 6 0 1 4 0 6 0 6 6 6 17 4 0 0 0 6 44
                                         0 1 4 0 0 0 44 6 0 1 3 0 0 0 6 30 1 3
                                         0 0 0 6 30 1 2 0 0 9 6 1 0 0 0 1 1 0
                                         45 0 1 1 15 0 0 1 2 0 30 0 6 1 1 16 9
                                         0 1 4 0 6 0 6 6 6 16 2 0 0 9 9 19 3 0
                                         6 0 6 6 14 2 13 0 0 6 1 1 0 21 0 1 1
                                         16 9 0 1 1 16 26 0 1 1 0 9 0 10 3 0 0
                                         9 9 6 20 1 0 9 0 11 2 0 24 0 9 1 1 17
                                         6 0 1 1 0 6 0 7 1 0 6 0 8 1 20 6 0 1 1
                                         19 21 0 1 2 21 24 6 0 1 1 0 6 0 12 1 0
                                         6 0 13 1 20 6 0 1 2 19 6 33 0 1 3 0 0
                                         9 9 38 1 1 0 0 39 1 2 0 0 40 0 1 4 0 0
                                         38 0 0 6 1 3 0 0 38 0 0 1 2 0 0 40 0 1
                                         1 0 39 0 1 2 0 24 0 9 1 1 5 32 0 1 7 0
                                         35 0 6 36 31 9 9 37 1 1 0 0 31 1 2 0 0
                                         0 0 1 1 13 0 31 1 2 13 0 0 0 1 1 18 27
                                         0 1 2 0 31 0 42 1 2 0 31 0 43 1 1 0 0
                                         31 1 2 0 0 0 0 1 2 2 29 29 0 1 1 2 28
                                         0 1 2 0 0 0 6 1 2 16 27 0 6 1 2 19 24
                                         34 0 1 3 8 0 0 21 21 1 2 8 0 0 22 1 3
                                         8 0 0 6 6 1 2 8 0 0 23 1 2 0 24 0 0 1
                                         1 0 24 0 1 0 0 0 18 3 0 0 0 44 44 1 3
                                         0 0 0 45 44 1 3 0 0 0 44 45 1 3 0 0 0
                                         6 44 1 3 0 0 0 44 6 1 3 0 0 0 21 45 1
                                         3 0 0 0 45 21 1 3 0 0 0 21 21 1 3 0 0
                                         0 45 45 1 3 0 0 0 6 21 1 3 0 0 0 21 6
                                         1 4 0 6 0 6 6 6 1 3 0 6 0 6 6 15 1 0 0
                                         31 1 1 0 0 21 1 1 0 24 0 1 1 17 6 0 1
                                         2 21 9 6 0 1 2 19 9 34 0 1 1 0 0 0 1 1
                                         15 26 0 1 2 0 30 0 6 1 1 0 45 0 1 1 10
                                         25 0 1 1 0 0 30 1 3 0 41 0 42 42 1 3 0
                                         41 0 43 43 1 1 0 0 41 1 1 0 0 39 1 2
                                         19 24 34 0 1 1 12 24 0 1 2 14 0 0 9 1
                                         2 18 0 0 6 1 1 17 6 0 1 2 22 24 0 0 1
                                         2 18 0 0 6 1 2 12 0 0 0 1 1 12 0 0 1 2
                                         0 0 0 0 1 2 12 0 6 0 1 2 13 30 0 30 1
                                         2 13 30 30 0 1 2 13 0 6 0 1 2 13 0 0 6
                                         1 2 13 0 0 0 1 1 19 9 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|I32Matrix| 'NILADIC T) 
