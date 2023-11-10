
(PUT '|DFMAT;minRowIndex;%I;1| '|SPADreplace| '(XLAM (|x|) 0)) 

(SDEFUN |DFMAT;minRowIndex;%I;1| ((|x| (%)) (% (|Integer|))) 0) 

(PUT '|DFMAT;minColIndex;%I;2| '|SPADreplace| '(XLAM (|x|) 0)) 

(SDEFUN |DFMAT;minColIndex;%I;2| ((|x| (%)) (% (|Integer|))) 0) 

(PUT '|DFMAT;nrows;%Nni;3| '|SPADreplace| 'DANROWS) 

(SDEFUN |DFMAT;nrows;%Nni;3| ((|x| (%)) (% (|NonNegativeInteger|)))
        (DANROWS |x|)) 

(PUT '|DFMAT;ncols;%Nni;4| '|SPADreplace| 'DANCOLS) 

(SDEFUN |DFMAT;ncols;%Nni;4| ((|x| (%)) (% (|NonNegativeInteger|)))
        (DANCOLS |x|)) 

(SDEFUN |DFMAT;maxRowIndex;%I;5| ((|x| (%)) (% (|Integer|)))
        (- (DANROWS |x|) 1)) 

(SDEFUN |DFMAT;maxColIndex;%I;6| ((|x| (%)) (% (|Integer|)))
        (- (DANCOLS |x|) 1)) 

(PUT '|DFMAT;qelt;%2IDf;7| '|SPADreplace| 'DAREF2) 

(SDEFUN |DFMAT;qelt;%2IDf;7|
        ((|m| (%)) (|i| #1=(|Integer|)) (|j| #1#) (% (|DoubleFloat|)))
        (DAREF2 |m| |i| |j|)) 

(PUT '|DFMAT;elt;%2IDf;8| '|SPADreplace| 'DAREF2) 

(SDEFUN |DFMAT;elt;%2IDf;8|
        ((|m| (%)) (|i| #1=(|Integer|)) (|j| #1#) (% (|DoubleFloat|)))
        (DAREF2 |m| |i| |j|)) 

(PUT '|DFMAT;qsetelt!;%2I2Df;9| '|SPADreplace| 'DSETAREF2) 

(SDEFUN |DFMAT;qsetelt!;%2I2Df;9|
        ((|m| (%)) (|i| #1=(|Integer|)) (|j| #1#) (|r| #2=(|DoubleFloat|))
         (% #2#))
        (DSETAREF2 |m| |i| |j| |r|)) 

(PUT '|DFMAT;setelt!;%2I2Df;10| '|SPADreplace| 'DSETAREF2) 

(SDEFUN |DFMAT;setelt!;%2I2Df;10|
        ((|m| (%)) (|i| #1=(|Integer|)) (|j| #1#) (|r| #2=(|DoubleFloat|))
         (% #2#))
        (DSETAREF2 |m| |i| |j| |r|)) 

(PUT '|DFMAT;empty;%;11| '|SPADreplace| '(XLAM NIL (MAKE_DOUBLE_MATRIX 0 0))) 

(SDEFUN |DFMAT;empty;%;11| ((% (%))) (MAKE_DOUBLE_MATRIX 0 0)) 

(PUT '|DFMAT;qnew;2Nni%;12| '|SPADreplace| 'MAKE_DOUBLE_MATRIX) 

(SDEFUN |DFMAT;qnew;2Nni%;12|
        ((|rows| #1=(|NonNegativeInteger|)) (|cols| #1#) (% (%)))
        (MAKE_DOUBLE_MATRIX |rows| |cols|)) 

(PUT '|DFMAT;new;2NniDf%;13| '|SPADreplace| 'MAKE_DOUBLE_MATRIX1) 

(SDEFUN |DFMAT;new;2NniDf%;13|
        ((|rows| #1=(|NonNegativeInteger|)) (|cols| #1#) (|a| (|DoubleFloat|))
         (% (%)))
        (MAKE_DOUBLE_MATRIX1 |rows| |cols| |a|)) 

(DECLAIM (NOTINLINE |DoubleFloatMatrix;|)) 

(DEFUN |DoubleFloatMatrix| ()
  (SPROG NIL
         (PROG (#1=#:G3189)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|DoubleFloatMatrix|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|DoubleFloatMatrix|
                             (LIST
                              (CONS NIL (CONS 1 (|DoubleFloatMatrix;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|DoubleFloatMatrix|)))))))))) 

(DEFUN |DoubleFloatMatrix;| ()
  (SPROG
   ((|dv$| NIL) (% NIL) (#1=#:G3186 NIL) (#2=#:G3187 NIL) (#3=#:G3185 NIL)
    (|pv$| NIL))
   (PROGN
    (LETT |dv$| '(|DoubleFloatMatrix|))
    (LETT % (GETREFV 49))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| (|DoubleFloat|)
                                                       '(|Comparable|))
                                        (|HasCategory| (|DoubleFloat|)
                                                       '(|Hashable|))
                                        (|HasCategory| (|DoubleFloat|)
                                                       '(|OrderedSet|))
                                        (|HasCategory| (|DoubleFloat|)
                                                       '(|BasicType|))
                                        (LETT #1#
                                              (|HasCategory| (|DoubleFloat|)
                                                             '(|SetCategory|)))
                                        (OR
                                         (|HasCategory| (|DoubleFloat|)
                                                        '(|Comparable|))
                                         #1#)
                                        (OR
                                         (|HasCategory| (|DoubleFloat|)
                                                        '(|BasicType|))
                                         (|HasCategory| (|DoubleFloat|)
                                                        '(|Comparable|))
                                         (|HasCategory| (|DoubleFloat|)
                                                        '(|Hashable|))
                                         #1#)
                                        (LETT #2#
                                              (AND
                                               (|HasCategory| (|DoubleFloat|)
                                                              '(|Evalable|
                                                                (|DoubleFloat|)))
                                               (|HasCategory| (|DoubleFloat|)
                                                              '(|SetCategory|))))
                                        (OR
                                         (AND
                                          (|HasCategory| (|DoubleFloat|)
                                                         '(|Evalable|
                                                           (|DoubleFloat|)))
                                          (|HasCategory| (|DoubleFloat|)
                                                         '(|Comparable|)))
                                         #2#)
                                        (LETT #3#
                                              (|HasCategory| (|DoubleFloat|)
                                                             '(|CoercibleTo|
                                                               (|OutputForm|))))
                                        (OR #3# #2#)
                                        (|HasCategory| (|DoubleFloat|)
                                                       '(|AbelianGroup|))
                                        (|HasCategory| (|DoubleFloat|)
                                                       '(|SemiRng|))
                                        (AND
                                         (|HasCategory| (|DoubleFloat|)
                                                        '(|Monoid|))
                                         (|HasCategory| (|DoubleFloat|)
                                                        '(|SemiRng|)))
                                        (|HasCategory| (|DoubleFloat|)
                                                       '(|EuclideanDomain|))
                                        (|HasCategory| (|DoubleFloat|)
                                                       '(|IntegralDomain|))
                                        (|HasCategory| (|DoubleFloat|)
                                                       '(|CommutativeRing|))
                                        (|HasCategory| (|DoubleFloat|)
                                                       '(|Field|))))))
    (|haddProp| |$ConstructorCache| '|DoubleFloatMatrix| NIL (CONS 1 %))
    (|stuffDomainSlots| %)
    (AND (|HasCategory| % '(|finiteAggregate|)) (|augmentPredVector| % 262144))
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|HasCategory| (|DoubleFloat|) '(|OrderedSet|))
         (|augmentPredVector| % 524288))
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|HasCategory| (|DoubleFloat|) '(|BasicType|))
         (|augmentPredVector| % 1048576))
    (AND
     (OR
      (AND (|HasCategory| % '(|finiteAggregate|))
           (|HasCategory| (|DoubleFloat|) '(|BasicType|)))
      (|HasCategory| (|DoubleFloat|) '(|Hashable|)) #1#)
     (|augmentPredVector| % 2097152))
    (SETF |pv$| (QREFELT % 3))
    %))) 

(MAKEPROP '|DoubleFloatMatrix| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Integer|) |DFMAT;minRowIndex;%I;1|
              |DFMAT;minColIndex;%I;2| (|NonNegativeInteger|)
              |DFMAT;nrows;%Nni;3| |DFMAT;ncols;%Nni;4|
              |DFMAT;maxRowIndex;%I;5| |DFMAT;maxColIndex;%I;6| (|DoubleFloat|)
              |DFMAT;qelt;%2IDf;7| |DFMAT;elt;%2IDf;8|
              |DFMAT;qsetelt!;%2I2Df;9| |DFMAT;setelt!;%2I2Df;10|
              |DFMAT;empty;%;11| |DFMAT;qnew;2Nni%;12| |DFMAT;new;2NniDf%;13|
              (|List| 14) (|Equation| 14) (|List| 23) (|Boolean|)
              (|OutputForm|) (|List| 31) (|Union| % '"failed")
              (|SingleInteger|) (|HashState|) (|DoubleFloatVector|) (|List| %)
              (|String|) (|Mapping| 25 14 14) (|Mapping| 25 14) (|Void|)
              (|List| 45) (|Union| 14 '"one") (|Mapping| 14 6 6) (|List| 22)
              (|Mapping| 14 14 14) (|Mapping| 14 14) (|List| 32)
              (|PositiveInteger|) (|List| 9) (|List| 47) (|Segment| 6)
              (|List| 6))
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
                   '#((|MatrixCategory| 14 31 31)
                      (|TwoDimensionalArrayCategory| 14 31 31)
                      (|HomogeneousAggregate| 14) (|Comparable|) (|Aggregate|)
                      (|Evalable| 14) (|SetCategory|) (|Hashable|) (|Type|)
                      (|finiteAggregate|) (|shallowlyMutable|)
                      (|InnerEvalable| 14 14) (|CoercibleTo| 26) (|BasicType|))
                   (|makeByteWordVec2| 48
                                       '(2 22 25 0 0 1 1 0 25 0 1 2 0 0 9 9 1 2
                                         0 32 0 44 1 2 0 32 0 45 1 1 0 0 32 1 2
                                         0 0 0 0 1 1 0 0 31 1 1 0 0 0 1 1 0 25
                                         0 1 3 0 0 0 6 6 1 3 0 0 0 6 6 1 5 0 0
                                         0 6 6 6 6 1 1 0 0 0 1 1 0 25 0 1 2 1
                                         25 0 0 1 2 0 25 0 9 1 4 0 0 0 6 6 0 1
                                         4 0 0 0 46 46 0 1 4 0 0 0 47 46 0 1 4
                                         0 0 0 46 47 0 1 4 0 0 0 48 47 0 1 4 0
                                         0 0 47 48 0 1 4 0 0 0 48 48 0 1 4 0 0
                                         0 47 47 0 1 4 0 0 0 6 48 0 1 4 0 0 0
                                         48 6 0 1 4 0 14 0 6 6 14 18 4 0 0 0 6
                                         46 0 1 4 0 0 0 46 6 0 1 3 0 0 0 6 31 1
                                         3 0 0 0 6 31 1 2 0 0 9 14 1 0 0 0 1 1
                                         0 47 0 1 1 15 0 0 1 2 0 31 0 6 1 1 16
                                         9 0 1 4 0 14 0 6 6 14 17 2 0 0 9 9 20
                                         3 0 14 0 6 6 15 2 13 0 0 6 1 1 0 22 0
                                         1 1 16 9 0 1 1 16 27 0 1 1 0 9 0 10 3
                                         0 0 9 9 14 21 1 0 9 0 11 2 0 25 0 9 1
                                         1 17 14 0 1 1 0 6 0 7 1 0 6 0 8 1 20
                                         14 0 1 1 19 22 0 1 2 21 25 14 0 1 1 0
                                         6 0 12 1 0 6 0 13 1 20 14 0 1 2 19 14
                                         34 0 1 3 0 0 9 9 39 1 1 0 0 40 1 2 0 0
                                         42 0 1 4 0 0 41 0 0 14 1 3 0 0 41 0 0
                                         1 2 0 0 42 0 1 1 0 40 0 1 2 0 25 0 9 1
                                         1 5 33 0 1 7 0 36 0 6 37 32 9 9 38 1 1
                                         0 0 32 1 2 0 0 0 0 1 1 13 0 32 1 2 13
                                         0 0 0 1 1 18 28 0 1 2 0 32 0 44 1 2 0
                                         32 0 45 1 1 0 0 32 1 2 0 0 0 0 1 2 2
                                         30 30 0 1 1 2 29 0 1 2 0 0 0 14 1 2 16
                                         28 0 14 1 2 19 25 35 0 1 3 8 0 0 22 22
                                         1 2 8 0 0 23 1 3 8 0 0 14 14 1 2 8 0 0
                                         24 1 2 0 25 0 0 1 1 0 25 0 1 0 0 0 19
                                         3 0 0 0 46 46 1 3 0 0 0 47 46 1 3 0 0
                                         0 46 47 1 3 0 0 0 6 46 1 3 0 0 0 46 6
                                         1 3 0 0 0 48 47 1 3 0 0 0 47 48 1 3 0
                                         0 0 48 48 1 3 0 0 0 47 47 1 3 0 0 0 6
                                         48 1 3 0 0 0 48 6 1 4 0 14 0 6 6 14 1
                                         3 0 14 0 6 6 16 1 0 0 32 1 1 0 0 22 1
                                         1 0 25 0 1 1 17 14 0 1 2 21 9 14 0 1 2
                                         19 9 35 0 1 1 0 0 0 1 1 15 27 0 1 2 0
                                         31 0 6 1 1 0 47 0 1 1 10 26 0 1 1 0 0
                                         31 1 3 0 43 0 44 44 1 3 0 43 0 45 45 1
                                         1 0 0 43 1 1 0 0 40 1 2 19 25 35 0 1 1
                                         12 25 0 1 2 14 0 0 9 1 2 18 0 0 6 1 1
                                         17 14 0 1 2 22 25 0 0 1 2 18 0 0 14 1
                                         2 12 0 0 0 1 1 12 0 0 1 2 0 0 0 0 1 2
                                         12 0 6 0 1 2 13 31 0 31 1 2 13 31 31 0
                                         1 2 13 0 14 0 1 2 13 0 0 14 1 2 13 0 0
                                         0 1 1 19 9 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|DoubleFloatMatrix| 'NILADIC T) 
