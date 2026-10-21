
(SDEFUN |MESH;meshPar2Var;TsM2SLTs;1|
        ((|sp| (|ThreeSpace| (|DoubleFloat|)))
         (|ptFun|
          (|Mapping| (|Point| (|DoubleFloat|)) (|DoubleFloat|)
                     (|DoubleFloat|)))
         (|uSeg| (|Segment| (|DoubleFloat|)))
         (|vSeg| (|Segment| (|DoubleFloat|))) (|opts| (|List| (|DrawOption|)))
         (% (|ThreeSpace| (|DoubleFloat|))))
        (SPROG
         ((|uNum| (|PositiveInteger|)) (|vNum| (|PositiveInteger|))
          (|ustep| #1=(|DoubleFloat|)) (|vstep| #1#) (|iv| NIL) (|iu| NIL)
          (|pt| (|Point| (|DoubleFloat|)))
          (|lp| (|List| (|Point| (|DoubleFloat|))))
          (|someU| #2=(|DoubleFloat|))
          (|llp| (|List| (|List| (|Point| (|DoubleFloat|))))) (|someV| #2#)
          (|aProp| (|SubSpaceComponentProperty|)) (#3=#:G16 NIL) (|l| NIL)
          (#4=#:G17 NIL))
         (SEQ (LETT |llp| NIL)
              (LETT |uNum|
                    (SPADCALL |opts| (SPADCALL (QREFELT % 8)) (QREFELT % 11)))
              (LETT |vNum|
                    (SPADCALL |opts| (SPADCALL (QREFELT % 12)) (QREFELT % 13)))
              (LETT |ustep|
                    (|div_DF_I|
                     (|sub_DF| (SPADCALL |uSeg| (QREFELT % 16))
                               (SPADCALL |uSeg| (QREFELT % 17)))
                     |uNum|))
              (LETT |vstep|
                    (|div_DF_I|
                     (|sub_DF| (SPADCALL |vSeg| (QREFELT % 16))
                               (SPADCALL |vSeg| (QREFELT % 17)))
                     |vNum|))
              (LETT |someV| (SPADCALL |vSeg| (QREFELT % 17)))
              (SEQ (LETT |iv| |vNum|) G190 (COND ((< |iv| 0) (GO G191)))
                   (SEQ
                    (COND
                     ((ZEROP |iv|)
                      (LETT |someV| (SPADCALL |vSeg| (QREFELT % 16)))))
                    (LETT |lp| NIL)
                    (LETT |someU| (SPADCALL |uSeg| (QREFELT % 17)))
                    (SEQ (LETT |iu| |uNum|) G190 (COND ((< |iu| 0) (GO G191)))
                         (SEQ
                          (COND
                           ((ZEROP |iu|)
                            (LETT |someU| (SPADCALL |uSeg| (QREFELT % 16)))))
                          (LETT |pt| (SPADCALL |someU| |someV| |ptFun|))
                          (LETT |lp| (CONS |pt| |lp|))
                          (EXIT (LETT |someU| (|add_DF| |someU| |ustep|))))
                         (LETT |iu| (+ |iu| -1)) (GO G190) G191 (EXIT NIL))
                    (LETT |llp| (CONS |lp| |llp|))
                    (EXIT (LETT |someV| (|add_DF| |someV| |vstep|))))
                   (LETT |iv| (+ |iv| -1)) (GO G190) G191 (EXIT NIL))
              (LETT |aProp| (SPADCALL NIL NIL (QREFELT % 20)))
              (EXIT
               (SPADCALL |sp| |llp|
                         (PROGN
                          (LETT #3# NIL)
                          (SEQ (LETT |l| NIL) (LETT #4# |llp|) G190
                               (COND
                                ((OR (ATOM #4#)
                                     (PROGN (LETT |l| (CAR #4#)) NIL))
                                 (GO G191)))
                               (SEQ (EXIT (LETT #3# (CONS |aProp| #3#))))
                               (LETT #4# (CDR #4#)) (GO G190) G191
                               (EXIT (NREVERSE #3#))))
                         |aProp| (QREFELT % 24)))))) 

(DECLAIM (NOTINLINE |MeshCreationRoutinesForThreeDimensions;|)) 

(DEFUN |MeshCreationRoutinesForThreeDimensions;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|MeshCreationRoutinesForThreeDimensions|))
          (LETT % (GETREFV 27))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache|
                      '|MeshCreationRoutinesForThreeDimensions| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |MeshCreationRoutinesForThreeDimensions| ()
  (SPROG NIL
         (PROG (#1=#:G19)
           (RETURN
            (COND
             ((LETT #1#
                    (HGET |$ConstructorCache|
                          '|MeshCreationRoutinesForThreeDimensions|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache|
                             '|MeshCreationRoutinesForThreeDimensions|
                             (LIST
                              (CONS NIL
                                    (CONS 1
                                          (|MeshCreationRoutinesForThreeDimensions;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|MeshCreationRoutinesForThreeDimensions|)))))))))) 

(MAKEPROP '|MeshCreationRoutinesForThreeDimensions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|PositiveInteger|)
              (|ViewDefaultsPackage|) (0 . |var1StepsDefault|)
              (|List| (|DrawOption|)) (|DrawOptionFunctions0|)
              (4 . |var1Steps|) (10 . |var2StepsDefault|) (14 . |var2Steps|)
              (|DoubleFloat|) (|Segment| 14) (20 . |low|) (25 . |high|)
              (|Boolean|) (|SubSpaceComponentProperty|) (30 . |new|)
              (|List| (|List| (|Point| 14))) (|List| 19) (|ThreeSpace| 14)
              (36 . |mesh|) (|Mapping| (|Point| 14) 14 14)
              |MESH;meshPar2Var;TsM2SLTs;1|)
           '#(|meshPar2Var| 44) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|meshPar2Var|
                                 ((|ThreeSpace| (|DoubleFloat|))
                                  (|ThreeSpace| (|DoubleFloat|))
                                  (|Mapping| (|Point| (|DoubleFloat|))
                                             (|DoubleFloat|) (|DoubleFloat|))
                                  (|Segment| (|DoubleFloat|))
                                  (|Segment| (|DoubleFloat|))
                                  (|List| (|DrawOption|))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 26
                                            '(0 7 6 8 2 10 6 9 6 11 0 7 6 12 2
                                              10 6 9 6 13 1 15 14 0 16 1 15 14
                                              0 17 2 19 0 18 18 20 4 23 0 0 21
                                              22 19 24 5 0 23 23 25 15 15 9
                                              26)))))
           '|lookupComplete|)) 
