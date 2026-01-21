
(PUT '|FPOSET;finitePoset;LL%;1| '|SPADreplace| 'CONS) 

(SDEFUN |FPOSET;finitePoset;LL%;1|
        ((|carrier| (|List| S)) (|struct1| (|List| (|List| (|Boolean|))))
         (% (%)))
        (CONS |carrier| |struct1|)) 

(SDEFUN |FPOSET;finitePoset;LM%;2|
        ((|carrier| (|List| S)) (|pred| (|Mapping| (|Boolean|) S S)) (% (%)))
        (SPROG
         ((|struct1| (|List| (|List| (|Boolean|)))) (#1=#:G18 NIL) (|x| NIL)
          (#2=#:G17 NIL) (#3=#:G16 NIL) (|y| NIL) (#4=#:G15 NIL))
         (SEQ
          (LETT |struct1|
                (PROGN
                 (LETT #4# NIL)
                 (SEQ (LETT |y| NIL) (LETT #3# |carrier|) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |y| (CAR #3#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS
                               (PROGN
                                (LETT #2# NIL)
                                (SEQ (LETT |x| NIL) (LETT #1# |carrier|) G190
                                     (COND
                                      ((OR (ATOM #1#)
                                           (PROGN (LETT |x| (CAR #1#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #2#
                                             (CONS (SPADCALL |x| |y| |pred|)
                                                   #2#))))
                                     (LETT #1# (CDR #1#)) (GO G190) G191
                                     (EXIT (NREVERSE #2#))))
                               #4#))))
                      (LETT #3# (CDR #3#)) (GO G190) G191
                      (EXIT (NREVERSE #4#)))))
          (EXIT (CONS |carrier| |struct1|))))) 

(PUT '|FPOSET;getVert;%L;3| '|SPADreplace| 'QCAR) 

(SDEFUN |FPOSET;getVert;%L;3| ((|s| (%)) (% (|List| S))) (QCAR |s|)) 

(PUT '|FPOSET;getArr;%L;4| '|SPADreplace| 'QCDR) 

(SDEFUN |FPOSET;getArr;%L;4| ((|s| (%)) (% (|List| (|List| (|Boolean|)))))
        (QCDR |s|)) 

(SDEFUN |FPOSET;setVert;%LV;5| ((|s| (%)) (|v| (|List| S)) (% (|Void|)))
        (SEQ (PROGN (RPLACA |s| |v|) (QCAR |s|))
             (EXIT (SPADCALL (QREFELT % 16))))) 

(SDEFUN |FPOSET;setArr;%LV;6|
        ((|s| (%)) (|v| (|List| (|List| (|Boolean|)))) (% (|Void|)))
        (SEQ (PROGN (RPLACD |s| |v|) (QCDR |s|))
             (EXIT (SPADCALL (QREFELT % 16))))) 

(DECLAIM (NOTINLINE |FinitePoset;|)) 

(DEFUN |FinitePoset| (#1=#:G39)
  (SPROG NIL
         (PROG (#2=#:G40)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|FinitePoset|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|FinitePoset;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|FinitePoset|)))))))))) 

(DEFUN |FinitePoset;| (|#1|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|FinitePoset| DV$1))
          (LETT % (GETREFV 39))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|FinitePoset| (LIST DV$1)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 7
                    (|Record| (|:| |set1| (|List| |#1|))
                              (|:| |struct1| (|List| (|List| (|Boolean|))))))
          %))) 

(MAKEPROP '|FinitePoset| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|List| 6)
              (|List| (|List| 19)) |FPOSET;finitePoset;LL%;1|
              (|Mapping| 19 6 6) |FPOSET;finitePoset;LM%;2|
              |FPOSET;getVert;%L;3| |FPOSET;getArr;%L;4| (|Void|) (0 . |void|)
              |FPOSET;setVert;%LV;5| |FPOSET;setArr;%LV;6| (|Boolean|)
              (|String|) (|OutputForm|)
              (|Record| (|:| |value| 6) (|:| |posX| 24) (|:| |posY| 24))
              (|Record| (|:| |name| 20) (|:| |arrType| 24) (|:| |fromOb| 24)
                        (|:| |toOb| 24) (|:| |xOffset| 29) (|:| |yOffset| 29)
                        (|:| |map| 25))
              (|NonNegativeInteger|) (|List| 24) (|List| 22) (|List| 23)
              (|DirectedGraph| %) (|Integer|) (|List| 31) (|Tree| 29)
              (|List| (|Loop|)) (|Matrix| 24) (|Matrix| 29)
              (|Scene| (|SCartesian| '2)) (|List| %) (|Union| 24 '"failed")
              (|IncidenceAlgebra| 29 6))
           '#(~= 4 |zetaMatrix| 10 |upperSet| 15 |unit| 20 |terminal| 26
              |subdiagramSvg| 31 |spanningTreeNode| 39 |spanningTreeArrow| 45
              |spanningForestNode| 51 |spanningForestArrow| 56 |setVert| 61
              |setArr| 67 |routeNodes| 73 |routeArrows| 80 |powerSetStructure|
              87 |outDegree| 92 |opposite| 98 |objectToIndex| 103 |nodeToNode|
              109 |nodeToArrow| 115 |nodeFromNode| 121 |nodeFromArrow| 127
              |moebius| 133 |min| 138 |merge| 149 |meetIfCan| 155 |max| 168
              |mapContra| 179 |map| 188 |lub| 197 |lowerSet| 203 |looseEquals|
              208 |loopsNodes| 214 |loopsAtNode| 219 |loopsArrows| 225 |le| 230
              |latex| 237 |laplacianMatrix| 242 |kgraph| 247 |joinIfCan| 253
              |isGreaterThan?| 266 |isFunctional?| 273 |isFixPoint?| 278
              |isDirected?| 284 |isDirectSuccessor?| 288 |isChain?| 295
              |isAntisymmetric?| 300 |isAntiChain?| 305 |isAcyclic?| 310
              |initial| 315 |indexToObject| 319 |incidenceMatrix| 325
              |inDegree| 330 |implies| 336 |glb| 343 |getVertices| 349
              |getVertexIndex| 354 |getVert| 360 |getArrows| 365
              |getArrowIndex| 370 |getArr| 377 |flatten| 382 |finitePoset| 387
              |distanceMatrix| 399 |distance| 404 |diagramsSvg| 411
              |diagramWidth| 418 |diagramSvg| 423 |diagramHeight| 430
              |deepDiagramSvg| 435 |cycleOpen| 442 |cycleClosed| 448 |createY|
              454 |createX| 460 |createWidth| 466 |coverMatrix| 471
              |completeTransitivity| 476 |completeReflexivity| 481 |coerce| 486
              |arrowsToNode| 491 |arrowsToArrow| 497 |arrowsFromNode| 503
              |arrowsFromArrow| 509 |arrowName| 515 |adjacencyMatrix| 522
              |addObject!| 527 |addArrow!| 539 = 577 + 583)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0))
                 (CONS
                  '#(|Poset&| NIL |FiniteGraph&| |SetCategory&| NIL
                     |BasicType&|)
                  (CONS
                   '#((|Poset| 6) (|Preorder| 6) (|FiniteGraph| 6)
                      (|SetCategory|) (|CoercibleTo| 21) (|BasicType|))
                   (|makeByteWordVec2| 38
                                       '(0 15 0 16 2 0 19 0 0 1 1 0 38 0 1 1 0
                                         0 0 1 2 0 0 8 20 1 1 0 0 6 1 4 0 15 35
                                         0 19 19 1 2 0 31 0 24 1 2 0 31 0 24 1
                                         1 0 30 0 1 1 0 30 0 1 2 0 15 0 8 17 2
                                         0 15 0 9 18 3 0 25 0 24 24 1 3 0 25 0
                                         24 24 1 1 0 0 6 1 2 0 24 0 24 1 1 0 0
                                         0 1 2 0 24 0 6 1 2 0 25 0 24 1 2 0 25
                                         0 24 1 2 0 25 0 24 1 2 0 25 0 24 1 1 0
                                         38 0 1 1 0 24 0 1 2 0 24 0 25 1 2 0 0
                                         0 0 1 3 0 37 0 24 24 1 2 0 37 0 25 1 2
                                         0 24 0 25 1 1 0 24 0 1 5 0 0 0 25 8 29
                                         29 1 5 0 0 0 25 8 29 29 1 2 0 37 0 25
                                         1 1 0 0 0 1 2 0 19 0 0 1 1 0 32 0 1 2
                                         0 32 0 24 1 1 0 32 0 1 3 0 19 0 24 24
                                         1 1 0 20 0 1 1 0 34 0 1 2 0 0 8 20 1 3
                                         0 37 0 24 24 1 2 0 37 0 25 1 3 0 19 0
                                         24 24 1 1 0 19 0 1 2 0 19 0 24 1 0 0
                                         19 1 3 0 19 0 24 24 1 1 0 19 0 1 1 0
                                         19 0 1 1 0 19 0 1 1 0 19 0 1 0 0 0 1 2
                                         0 6 0 24 1 1 0 34 0 1 2 0 24 0 24 1 3
                                         0 19 0 24 24 1 2 0 37 0 25 1 1 0 26 0
                                         1 2 0 24 0 6 1 1 0 8 0 13 1 0 27 0 1 3
                                         0 24 0 24 24 1 1 0 9 0 14 1 0 0 28 1 2
                                         0 0 8 9 10 2 0 0 8 11 12 1 0 34 0 1 3
                                         0 29 0 24 24 1 3 0 15 20 36 19 1 1 0
                                         24 0 1 3 0 15 20 0 19 1 1 0 24 0 1 3 0
                                         15 20 0 19 1 2 0 0 8 20 1 2 0 0 8 20 1
                                         2 0 24 24 24 1 2 0 24 24 24 1 1 0 24
                                         24 1 1 0 38 0 1 1 0 0 0 1 1 0 0 0 1 1
                                         0 21 0 1 2 0 25 0 24 1 2 0 25 0 24 1 2
                                         0 25 0 24 1 2 0 25 0 24 1 3 0 20 0 24
                                         24 1 1 0 33 0 1 2 0 0 0 22 1 2 0 0 0 6
                                         1 2 0 0 0 23 1 5 0 0 0 20 24 24 25 1 4
                                         0 0 0 20 24 24 1 4 0 0 0 20 6 6 1 3 0
                                         0 0 24 24 1 2 0 19 0 0 1 2 0 0 0 0
                                         1)))))
           '|lookupComplete|)) 
