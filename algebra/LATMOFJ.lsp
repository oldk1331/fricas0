
(SDEFUN |LATMOFJ;proposition| ((|s| (|String|)) (% (%)))
        (LIST (LIST (CONS 1 (LIST |s|))))) 

(SDEFUN |LATMOFJ;logicT;%;2| ((% (%))) (LIST (LIST (CONS 0 (LIST 'T))))) 

(SDEFUN |LATMOFJ;logicF;%;3| ((% (%))) (LIST (LIST (CONS 0 (LIST 'F))))) 

(SDEFUN |LATMOFJ;variable;S%;4| ((|v| (|String|)) (% (%)))
        (LIST (LIST (CONS 1 (LIST |v|))))) 

(SDEFUN |LATMOFJ;latticeMeetOfJoins;U%;5|
        ((|e|
          (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                   (|:| |var| (|Record| (|:| |str| (|String|))))))
         (% (%)))
        (LIST (LIST |e|))) 

(MAKEPROP '|LATMOFJ;emptyLattice;%;6| '|SPADreplace| '(XLAM NIL NIL)) 

(SDEFUN |LATMOFJ;emptyLattice;%;6| ((% (%))) NIL) 

(MAKEPROP '|LATMOFJ;empty?;%B;7| '|SPADreplace| 'NULL) 

(SDEFUN |LATMOFJ;empty?;%B;7| ((|n| (%)) (% (|Boolean|))) (NULL |n|)) 

(SDEFUN |LATMOFJ;/\\;3%;8| ((|a| (%)) (|b| (%)) (% (%)))
        (SPROG ((#1=#:G71 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL |a| (QREFELT % 17))
                    (PROGN (LETT #1# |b|) (GO #2=#:G70))))
                  (COND
                   ((SPADCALL |b| (QREFELT % 17))
                    (PROGN (LETT #1# |a|) (GO #2#))))
                  (EXIT
                   (SPADCALL (SPADCALL |a| |b| (QREFELT % 19))
                             (QREFELT % 20)))))
                #2# (EXIT #1#)))) 

(SDEFUN |LATMOFJ;\\/;3%;9| ((|a| (%)) (|b| (%)) (% (%)))
        (SPROG
         ((#1=#:G87 NIL) (|innera| NIL) (#2=#:G88 NIL) (|innerb| NIL)
          (#3=#:G89 NIL)
          (|termLeft|
           #4=(|List|
               (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                        (|:| |var| (|Record| (|:| |str| (|String|)))))))
          (|termRight| #4#)
          (|term|
           (|List|
            (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                     (|:| |var| (|Record| (|:| |str| (|String|)))))))
          (|r|
           (|List|
            (|List|
             (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                      (|:| |var| (|Record| (|:| |str| (|String|)))))))))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL |a| (QREFELT % 17))
              (PROGN (LETT #1# |b|) (GO #5=#:G86))))
            (COND
             ((SPADCALL |b| (QREFELT % 17)) (PROGN (LETT #1# |a|) (GO #5#))))
            (LETT |r| NIL)
            (SEQ (LETT |innera| NIL) (LETT #2# |a|) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |innera| (CAR #2#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |innerb| NIL) (LETT #3# |b|) G190
                        (COND
                         ((OR (ATOM #3#) (PROGN (LETT |innerb| (CAR #3#)) NIL))
                          (GO G191)))
                        (SEQ (LETT |termLeft| |innera|)
                             (LETT |termRight| |innerb|)
                             (LETT |term|
                                   (SPADCALL |termLeft| |termRight|
                                             (QREFELT % 23)))
                             (EXIT
                              (LETT |r| (SPADCALL |r| |term| (QREFELT % 24)))))
                        (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))))
                 (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
            (EXIT (SPADCALL |r| (QREFELT % 20)))))
          #5# (EXIT #1#)))) 

(SDEFUN |LATMOFJ;meet;L%;10| ((|ln| (|List| %)) (% (%)))
        (SPROG ((|ele| NIL) (#1=#:G94 NIL) (|r| (%)))
               (SEQ (LETT |r| (SPADCALL (QREFELT % 15)))
                    (SEQ (LETT |ele| NIL) (LETT #1# |ln|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |ele| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |r| (SPADCALL |r| |ele| (QREFELT % 21)))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT |r|)))) 

(SDEFUN |LATMOFJ;join;L%;11| ((|ln| (|List| %)) (% (%)))
        (SPROG ((|ele| NIL) (#1=#:G99 NIL) (|r| (%)))
               (SEQ (LETT |r| (SPADCALL (QREFELT % 15)))
                    (SEQ (LETT |ele| NIL) (LETT #1# |ln|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |ele| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |r| (SPADCALL |r| |ele| (QREFELT % 25)))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT |r|)))) 

(SDEFUN |LATMOFJ;equalElements|
        ((|a|
          (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                   (|:| |var| (|Record| (|:| |str| (|String|))))))
         (|b|
          (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                   (|:| |var| (|Record| (|:| |str| (|String|))))))
         (% (|Boolean|)))
        (SPROG ((#1=#:G103 NIL) (#2=#:G102 NIL) (#3=#:G107 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((QEQCAR |a| 1)
                    (PROGN
                     (LETT #3#
                           (EQUAL (QCAR (CDR |a|))
                                  (QCAR
                                   (PROG2 (LETT #1# |b|)
                                       (QCDR #1#)
                                     (|check_union2| (QEQCAR #1# 1)
                                                     (|Record|
                                                      (|:| |str| (|String|)))
                                                     (|Union|
                                                      (|:| |const|
                                                           (|Record|
                                                            (|:| |val|
                                                                 (|Symbol|))))
                                                      (|:| |var|
                                                           (|Record|
                                                            (|:| |str|
                                                                 (|String|)))))
                                                     #1#)))))
                     (GO #4=#:G106))))
                  (COND
                   ((QEQCAR |a| 0)
                    (COND
                     ((QEQCAR |b| 0)
                      (PROGN
                       (LETT #3#
                             (EQUAL
                              (QCAR
                               (PROG2 (LETT #2# |a|)
                                   (QCDR #2#)
                                 (|check_union2| (QEQCAR #2# 0)
                                                 (|Record|
                                                  (|:| |val| (|Symbol|)))
                                                 (|Union|
                                                  (|:| |const|
                                                       (|Record|
                                                        (|:| |val|
                                                             (|Symbol|))))
                                                  (|:| |var|
                                                       (|Record|
                                                        (|:| |str|
                                                             (|String|)))))
                                                 #2#)))
                              (QCAR (CDR |b|))))
                       (GO #4#))))))
                  (EXIT NIL)))
                #4# (EXIT #3#)))) 

(SDEFUN |LATMOFJ;removeDuplicatesInTerm|
        ((|n|
          (|List|
           (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                    (|:| |var| (|Record| (|:| |str| (|String|)))))))
         (%
          (|List|
           (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                    (|:| |var| (|Record| (|:| |str| (|String|))))))))
        (SPROG
         ((|ne1| NIL) (#1=#:G124 NIL) (|e1| NIL) (#2=#:G123 NIL) (|ne2| NIL)
          (#3=#:G126 NIL) (|e2| NIL) (#4=#:G125 NIL) (|match| (|Boolean|))
          (|r|
           (|List|
            (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                     (|:| |var| (|Record| (|:| |str| (|String|))))))))
         (SEQ (LETT |r| NIL)
              (SEQ (LETT |ne1| 1) (LETT #1# (LENGTH |n|)) (LETT |e1| NIL)
                   (LETT #2# |n|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |e1| (CAR #2#)) NIL)
                         (|greater_SI| |ne1| #1#))
                     (GO G191)))
                   (SEQ (LETT |match| NIL)
                        (SEQ (LETT |ne2| 1) (LETT #3# (LENGTH |n|))
                             (LETT |e2| NIL) (LETT #4# |n|) G190
                             (COND
                              ((OR (ATOM #4#) (PROGN (LETT |e2| (CAR #4#)) NIL)
                                   (|greater_SI| |ne2| #3#))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL |e1| |e2| (QREFELT % 29))
                                 (COND ((< |ne1| |ne2|) (LETT |match| 'T)))))))
                             (LETT #4#
                                   (PROG1 (CDR #4#)
                                     (LETT |ne2| (|inc_SI| |ne2|))))
                             (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (COND
                          ((NULL |match|)
                           (LETT |r| (SPADCALL |r| |e1| (QREFELT % 30)))))))
                   (LETT #2# (PROG1 (CDR #2#) (LETT |ne1| (|inc_SI| |ne1|))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |r|)))) 

(SDEFUN |LATMOFJ;equalTerms|
        ((|a|
          (|List|
           (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                    (|:| |var| (|Record| (|:| |str| (|String|)))))))
         (|b|
          (|List|
           (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                    (|:| |var| (|Record| (|:| |str| (|String|)))))))
         (% (|Boolean|)))
        (SPROG
         ((|a1| NIL) (#1=#:G145 NIL) (|b1| NIL) (#2=#:G146 NIL)
          (|found| (|Boolean|)) (#3=#:G144 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL (LENGTH |a|) (LENGTH |b|) (QREFELT % 32))
              (PROGN (LETT #3# NIL) (GO #4=#:G143))))
            (SEQ (LETT |a1| NIL) (LETT #1# |a|) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |a1| (CAR #1#)) NIL))
                   (GO G191)))
                 (SEQ (LETT |found| NIL)
                      (SEQ (LETT |b1| NIL) (LETT #2# |b|) G190
                           (COND
                            ((OR (ATOM #2#) (PROGN (LETT |b1| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((|LATMOFJ;equalElements| |a1| |b1| %)
                               (LETT |found| 'T)))))
                           (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (COND
                        ((NULL |found|) (PROGN (LETT #3# NIL) (GO #4#))))))
                 (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #4# (EXIT #3#)))) 

(SDEFUN |LATMOFJ;subTerm|
        ((|a|
          (|List|
           (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                    (|:| |var| (|Record| (|:| |str| (|String|)))))))
         (|b|
          (|List|
           (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                    (|:| |var| (|Record| (|:| |str| (|String|)))))))
         (% (|Boolean|)))
        (SPROG
         ((|a1| NIL) (#1=#:G165 NIL) (|b1| NIL) (#2=#:G166 NIL)
          (|found| (|Boolean|)) (#3=#:G164 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((>= (LENGTH |a|) (LENGTH |b|))
              (PROGN (LETT #3# NIL) (GO #4=#:G163))))
            (SEQ (LETT |a1| NIL) (LETT #1# |a|) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |a1| (CAR #1#)) NIL))
                   (GO G191)))
                 (SEQ (LETT |found| NIL)
                      (SEQ (LETT |b1| NIL) (LETT #2# |b|) G190
                           (COND
                            ((OR (ATOM #2#) (PROGN (LETT |b1| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((|LATMOFJ;equalElements| |a1| |b1| %)
                               (LETT |found| 'T)))))
                           (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (COND
                        ((NULL |found|) (PROGN (LETT #3# NIL) (GO #4#))))))
                 (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #4# (EXIT #3#)))) 

(SDEFUN |LATMOFJ;redux;2%;16| ((|n| (%)) (% (%)))
        (SPROG
         ((|outern| NIL) (#1=#:G180 NIL) (|outer| NIL) (#2=#:G179 NIL)
          (|newinnerList|
           (|List|
            (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                     (|:| |var| (|Record| (|:| |str| (|String|)))))))
          (|innern| NIL) (#3=#:G182 NIL) (#4=#:G181 NIL)
          (|match| #5=(|Boolean|)) (|inner| NIL) (#6=#:G183 NIL)
          (|isSubTerm| #5#) (|modified| #5#)
          (|r|
           (|List|
            (|List|
             (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                      (|:| |var| (|Record| (|:| |str| (|String|)))))))))
         (SEQ (LETT |r| NIL) (LETT |modified| NIL)
              (SEQ (LETT |outern| 1) (LETT #1# (LENGTH |n|)) (LETT |outer| NIL)
                   (LETT #2# |n|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |outer| (CAR #2#)) NIL)
                         (|greater_SI| |outern| #1#))
                     (GO G191)))
                   (SEQ
                    (LETT |newinnerList|
                          (|LATMOFJ;removeDuplicatesInTerm| |outer| %))
                    (COND
                     ((NULL (|LATMOFJ;equalTerms| |newinnerList| |outer| %))
                      (LETT |modified| 'T)))
                    (LETT |match| NIL)
                    (SEQ (LETT |innern| 1) (LETT #3# (LENGTH |n|))
                         (LETT |inner| NIL) (LETT #4# |n|) G190
                         (COND
                          ((OR (ATOM #4#) (PROGN (LETT |inner| (CAR #4#)) NIL)
                               (|greater_SI| |innern| #3#))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((|LATMOFJ;equalTerms| |inner| |outer| %)
                             (COND
                              ((< |innern| |outern|) (LETT |match| 'T)))))))
                         (LETT #4#
                               (PROG1 (CDR #4#)
                                 (LETT |innern| (|inc_SI| |innern|))))
                         (GO G190) G191 (EXIT NIL))
                    (LETT |isSubTerm| NIL)
                    (SEQ (LETT |inner| NIL) (LETT #6# |n|) G190
                         (COND
                          ((OR (ATOM #6#) (PROGN (LETT |inner| (CAR #6#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((|LATMOFJ;subTerm| |inner| |outer| %)
                             (LETT |isSubTerm| 'T)))))
                         (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (COND ((OR |match| |isSubTerm|) (LETT |modified| 'T))
                           ('T
                            (LETT |r|
                                  (SPADCALL |r| |newinnerList|
                                            (QREFELT % 24)))))))
                   (LETT #2#
                         (PROG1 (CDR #2#) (LETT |outern| (|inc_SI| |outern|))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND (|modified| (SPADCALL |r| (QREFELT % 20))) ('T |r|)))))) 

(MAKEPROP '|LATMOFJ;factor;%L;17| '|SPADreplace| 'LIST) 

(SDEFUN |LATMOFJ;factor;%L;17| ((|n| (%)) (% (|List| %))) (LIST |n|)) 

(MAKEPROP '|LATMOFJ;removeDup| '|SPADreplace| '(XLAM (|a| |b|) |a|)) 

(SDEFUN |LATMOFJ;removeDup| ((|a| (|List| %)) (|b| (|List| %)) (% (|List| %)))
        |a|) 

(MAKEPROP '|LATMOFJ;deductions;2L;19| '|SPADreplace| '(XLAM (|ln|) |ln|)) 

(SDEFUN |LATMOFJ;deductions;2L;19| ((|ln| (|List| %)) (% (|List| %))) |ln|) 

(MAKEPROP '|LATMOFJ;opType;%S;20| '|SPADreplace| '(XLAM (|n|) 'OTHER)) 

(SDEFUN |LATMOFJ;opType;%S;20| ((|n| (%)) (% (|Symbol|))) 'OTHER) 

(MAKEPROP '|LATMOFJ;atom?;%B;21| '|SPADreplace| '(XLAM (|n|) NIL)) 

(SDEFUN |LATMOFJ;atom?;%B;21| ((|n| (%)) (% (|Boolean|))) NIL) 

(MAKEPROP '|LATMOFJ;value;%S;22| '|SPADreplace| '(XLAM (|n|) 'C)) 

(SDEFUN |LATMOFJ;value;%S;22| ((|n| (%)) (% (|Symbol|))) 'C) 

(MAKEPROP '|LATMOFJ;getChildren;%L;23| '|SPADreplace| 'LIST) 

(SDEFUN |LATMOFJ;getChildren;%L;23| ((|n| (%)) (% (|List| %))) (LIST |n|)) 

(MAKEPROP '|LATMOFJ;=;2%B;24| '|SPADreplace| '(XLAM (|a| |b|) NIL)) 

(SDEFUN |LATMOFJ;=;2%B;24| ((|a| (%)) (|b| (%)) (% (|Boolean|))) NIL) 

(SDEFUN |LATMOFJ;toString;%S;25| ((|n| (%)) (% (|String|)))
        (SPADCALL (LIST "(" (SPADCALL |n| (QREFELT % 41)) ")") (QREFELT % 42))) 

(SDEFUN |LATMOFJ;stringVarOrLit|
        ((|a|
          (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                   (|:| |var| (|Record| (|:| |str| (|String|))))))
         (% (|String|)))
        (SPROG ((#1=#:G110 NIL) (#2=#:G197 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((QEQCAR |a| 1)
                    (PROGN (LETT #2# (QCAR (CDR |a|))) (GO #3=#:G196))))
                  (COND
                   ((QEQCAR |a| 0)
                    (SEQ
                     (COND
                      ((EQUAL
                        (QCAR
                         (PROG2 (LETT #1# |a|)
                             (QCDR #1#)
                           (|check_union2| (QEQCAR #1# 0)
                                           (|Record| (|:| |val| (|Symbol|)))
                                           (|Union|
                                            (|:| |const|
                                                 (|Record|
                                                  (|:| |val| (|Symbol|))))
                                            (|:| |var|
                                                 (|Record|
                                                  (|:| |str| (|String|)))))
                                           #1#)))
                        'T)
                       (PROGN (LETT #2# "T") (GO #3#))))
                     (EXIT (PROGN (LETT #2# "F") (GO #3#))))))
                  (EXIT "error")))
                #3# (EXIT #2#)))) 

(SDEFUN |LATMOFJ;toStringUnwrapped;%S;27| ((|n| (%)) (% (|String|)))
        (SPROG
         ((|outern| NIL) (#1=#:G211 NIL) (|outer| NIL) (#2=#:G210 NIL)
          (|innern| NIL) (#3=#:G213 NIL) (|inner| NIL) (#4=#:G212 NIL)
          (|r| (|String|)))
         (SEQ (LETT |r| "")
              (SEQ (LETT |outern| 1) (LETT #1# (LENGTH |n|)) (LETT |outer| NIL)
                   (LETT #2# |n|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |outer| (CAR #2#)) NIL)
                         (|greater_SI| |outern| #1#))
                     (GO G191)))
                   (SEQ
                    (SEQ (LETT |innern| 1) (LETT #3# (LENGTH |outer|))
                         (LETT |inner| NIL) (LETT #4# |outer|) G190
                         (COND
                          ((OR (ATOM #4#) (PROGN (LETT |inner| (CAR #4#)) NIL)
                               (|greater_SI| |innern| #3#))
                           (GO G191)))
                         (SEQ
                          (LETT |r|
                                (STRCONC |r|
                                         (|LATMOFJ;stringVarOrLit| |inner| %)))
                          (EXIT
                           (COND
                            ((SPADCALL |innern| (LENGTH |outer|)
                                       (QREFELT % 32))
                             (LETT |r| (STRCONC |r| "\\/"))))))
                         (LETT #4#
                               (PROG1 (CDR #4#)
                                 (LETT |innern| (|inc_SI| |innern|))))
                         (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (COND
                      ((SPADCALL |outern| (LENGTH |n|) (QREFELT % 32))
                       (LETT |r| (STRCONC |r| ")/\\("))))))
                   (LETT #2#
                         (PROG1 (CDR #2#) (LETT |outern| (|inc_SI| |outern|))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |r|)))) 

(SDEFUN |LATMOFJ;outputVarOrLit|
        ((|a|
          (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                   (|:| |var| (|Record| (|:| |str| (|String|))))))
         (% (|OutputForm|)))
        (SPROG ((#1=#:G110 NIL) (#2=#:G216 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((QEQCAR |a| 1)
                    (PROGN
                     (LETT #2# (SPADCALL (QCAR (CDR |a|)) (QREFELT % 45)))
                     (GO #3=#:G215))))
                  (COND
                   ((QEQCAR |a| 0)
                    (PROGN
                     (LETT #2#
                           (SPADCALL
                            (QCAR
                             (PROG2 (LETT #1# |a|)
                                 (QCDR #1#)
                               (|check_union2| (QEQCAR #1# 0)
                                               (|Record|
                                                (|:| |val| (|Symbol|)))
                                               (|Union|
                                                (|:| |const|
                                                     (|Record|
                                                      (|:| |val| (|Symbol|))))
                                                (|:| |var|
                                                     (|Record|
                                                      (|:| |str| (|String|)))))
                                               #1#)))
                            (QREFELT % 46)))
                     (GO #3#))))
                  (EXIT (|error| "outputVarOrLit"))))
                #3# (EXIT #2#)))) 

(SDEFUN |LATMOFJ;coerce;%Of;29| ((|n| (%)) (% (|OutputForm|)))
        (SPROG
         ((|outern| NIL) (#1=#:G230 NIL) (|outer| NIL) (#2=#:G229 NIL)
          (|innern| NIL) (#3=#:G232 NIL) (|inner| NIL) (#4=#:G231 NIL)
          (|r| (|OutputForm|)))
         (SEQ (LETT |r| (SPADCALL "(" (QREFELT % 47)))
              (SEQ (LETT |outern| 1) (LETT #1# (LENGTH |n|)) (LETT |outer| NIL)
                   (LETT #2# |n|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |outer| (CAR #2#)) NIL)
                         (|greater_SI| |outern| #1#))
                     (GO G191)))
                   (SEQ
                    (SEQ (LETT |innern| 1) (LETT #3# (LENGTH |outer|))
                         (LETT |inner| NIL) (LETT #4# |outer|) G190
                         (COND
                          ((OR (ATOM #4#) (PROGN (LETT |inner| (CAR #4#)) NIL)
                               (|greater_SI| |innern| #3#))
                           (GO G191)))
                         (SEQ
                          (LETT |r|
                                (SPADCALL |r|
                                          (|LATMOFJ;outputVarOrLit| |inner| %)
                                          (QREFELT % 48)))
                          (EXIT
                           (COND
                            ((SPADCALL |innern| (LENGTH |outer|)
                                       (QREFELT % 32))
                             (LETT |r|
                                   (SPADCALL |r|
                                             (SPADCALL "\\/" (QREFELT % 47))
                                             (QREFELT % 48)))))))
                         (LETT #4#
                               (PROG1 (CDR #4#)
                                 (LETT |innern| (|inc_SI| |innern|))))
                         (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (COND
                      ((SPADCALL |outern| (LENGTH |n|) (QREFELT % 32))
                       (LETT |r|
                             (SPADCALL |r| (SPADCALL ")/\\(" (QREFELT % 47))
                                       (QREFELT % 48)))))))
                   (LETT #2#
                         (PROG1 (CDR #2#) (LETT |outern| (|inc_SI| |outern|))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL |r| (SPADCALL ")" (QREFELT % 47)) (QREFELT % 48)))))) 

(DECLAIM (NOTINLINE |LatticeMeetOfJoins;|)) 

(DEFUN |LatticeMeetOfJoins;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|LatticeMeetOfJoins|))
          (LETT % (GETREFV 50))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|LatticeMeetOfJoins| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 6
                    (|List|
                     (|List|
                      (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                               (|:| |var|
                                    (|Record| (|:| |str| (|String|))))))))
          %))) 

(DEFUN |LatticeMeetOfJoins| ()
  (SPROG NIL
         (PROG (#1=#:G234)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|LatticeMeetOfJoins|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|LatticeMeetOfJoins|
                             (LIST
                              (CONS NIL (CONS 1 (|LatticeMeetOfJoins;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|LatticeMeetOfJoins|)))))))))) 

(MAKEPROP '|LatticeMeetOfJoins| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| |LATMOFJ;logicT;%;2|
              |LATMOFJ;logicF;%;3| (|String|) |LATMOFJ;variable;S%;4|
              (|Record| (|:| |val| 35)) (|Record| (|:| |str| 9))
              (|Union| (|:| |const| 11) (|:| |var| 12))
              |LATMOFJ;latticeMeetOfJoins;U%;5| |LATMOFJ;emptyLattice;%;6|
              (|Boolean|) |LATMOFJ;empty?;%B;7| (|List| 22) (0 . |concat|)
              |LATMOFJ;redux;2%;16| |LATMOFJ;/\\;3%;8| (|List| 13)
              (6 . |concat|) (12 . |concat|) |LATMOFJ;\\/;3%;9| (|List| %)
              |LATMOFJ;meet;L%;10| |LATMOFJ;join;L%;11| (18 . =)
              (24 . |concat|) (|NonNegativeInteger|) (30 . ~=)
              |LATMOFJ;factor;%L;17| |LATMOFJ;deductions;2L;19| (|Symbol|)
              |LATMOFJ;opType;%S;20| |LATMOFJ;atom?;%B;21|
              |LATMOFJ;value;%S;22| |LATMOFJ;getChildren;%L;23|
              |LATMOFJ;=;2%B;24| |LATMOFJ;toStringUnwrapped;%S;27|
              (36 . |concat|) |LATMOFJ;toString;%S;25| (|OutputForm|)
              (41 . |coerce|) (46 . |coerce|) (51 . |message|) (56 . |hconcat|)
              |LATMOFJ;coerce;%Of;29|)
           '#(~= 62 |variable| 68 |value| 73 |toStringUnwrapped| 78 |toString|
              83 |redux| 88 |opType| 93 |meet| 98 |logicT| 103 |logicF| 107
              |latticeMeetOfJoins| 111 |latex| 116 |join| 121 |getChildren| 126
              |factor| 131 |emptyLattice| 136 |empty?| 140 |deductions| 145
              |coerce| 150 |atom?| 155 |_\|_| 160 |\\/| 164 T 170 = 174 |/\\|
              180)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0 0 0 0))
                 (CONS
                  '#(NIL NIL NIL NIL NIL NIL NIL NIL |SetCategory&| NIL
                     |BasicType&|)
                  (CONS
                   '#((|BoundedDistributiveLattice|) (|DistributiveLattice|)
                      (|BoundedLattice|) (|BoundedJoinSemilattice|) (|Lattice|)
                      (|BoundedMeetSemilattice|) (|JoinSemilattice|)
                      (|MeetSemilattice|) (|SetCategory|) (|CoercibleTo| 44)
                      (|BasicType|))
                   (|makeByteWordVec2| 49
                                       '(2 18 0 0 0 19 2 22 0 0 0 23 2 18 0 0
                                         22 24 2 13 16 0 0 29 2 22 0 0 13 30 2
                                         31 16 0 0 32 1 9 0 26 42 1 9 44 0 45 1
                                         35 44 0 46 1 44 0 9 47 2 44 0 0 0 48 2
                                         0 16 0 0 1 1 0 0 9 10 1 0 35 0 38 1 0
                                         9 0 41 1 0 9 0 43 1 0 0 0 20 1 0 35 0
                                         36 1 0 0 26 27 0 0 0 7 0 0 0 8 1 0 0
                                         13 14 1 0 9 0 1 1 0 0 26 28 1 0 26 0
                                         39 1 0 26 0 33 0 0 0 15 1 0 16 0 17 1
                                         0 26 26 34 1 0 44 0 49 1 0 16 0 37 0 0
                                         0 1 2 0 0 0 0 25 0 0 0 1 2 0 16 0 0 40
                                         2 0 0 0 0 21)))))
           '|lookupComplete|)) 
