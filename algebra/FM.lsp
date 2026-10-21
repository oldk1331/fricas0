
(MAKEPROP '|FM;rep| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |FM;rep| ((|x| (%)) (% (|Rep|))) |x|) 

(MAKEPROP '|FM;per| '|SPADreplace| '(XLAM (|r|) |r|)) 

(SDEFUN |FM;per| ((|r| (|Rep|)) (% (%))) |r|) 

(SDEFUN |FM;*;R2%;3| ((|r| (R)) (|x| (%)) (% (%)))
        (SPROG ((#1=#:G23 NIL) (|u| NIL) (#2=#:G24 NIL))
               (SEQ
                (COND ((SPADCALL |r| (QREFELT % 13)) (|spadConstant| % 14))
                      ((SPADCALL |r| (QREFELT % 11) (QREFELT % 15)) |x|)
                      ('T
                       (PROGN
                        (LETT #1# NIL)
                        (SEQ (LETT |u| NIL) (LETT #2# |x|) G190
                             (COND
                              ((OR (ATOM #2#) (PROGN (LETT |u| (CAR #2#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #1#
                                     (CONS
                                      (CONS (QCAR |u|)
                                            (SPADCALL |r| (QCDR |u|)
                                                      (QREFELT % 16)))
                                      #1#))))
                             (LETT #2# (CDR #2#)) (GO G190) G191
                             (EXIT (NREVERSE #1#))))))))) 

(SDEFUN |FM;*;R2%;4| ((|r| (R)) (|x| (%)) (% (%)))
        (SPROG ((#1=#:G29 NIL) (|u| NIL) (#2=#:G30 NIL) (|a| (R)))
               (SEQ
                (COND ((SPADCALL |r| (QREFELT % 13)) (|spadConstant| % 14))
                      ((SPADCALL |r| (QREFELT % 11) (QREFELT % 15)) |x|)
                      ('T
                       (PROGN
                        (LETT #1# NIL)
                        (SEQ (LETT |u| NIL) (LETT #2# |x|) G190
                             (COND
                              ((OR (ATOM #2#) (PROGN (LETT |u| (CAR #2#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL
                                  (LETT |a|
                                        (SPADCALL |r| (QCDR |u|)
                                                  (QREFELT % 16)))
                                  (|spadConstant| % 10) (QREFELT % 18))
                                 (LETT #1#
                                       (CONS (CONS (QCAR |u|) |a|) #1#))))))
                             (LETT #2# (CDR #2#)) (GO G190) G191
                             (EXIT (NREVERSE #1#))))))))) 

(SDEFUN |FM;*;%R%;5| ((|x| (%)) (|r| (R)) (% (%)))
        (SPROG ((#1=#:G35 NIL) (|u| NIL) (#2=#:G36 NIL))
               (SEQ
                (COND ((SPADCALL |r| (QREFELT % 13)) (|spadConstant| % 14))
                      ((SPADCALL |r| (QREFELT % 11) (QREFELT % 15)) |x|)
                      ('T
                       (PROGN
                        (LETT #1# NIL)
                        (SEQ (LETT |u| NIL) (LETT #2# |x|) G190
                             (COND
                              ((OR (ATOM #2#) (PROGN (LETT |u| (CAR #2#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #1#
                                     (CONS
                                      (CONS (QCAR |u|)
                                            (SPADCALL (QCDR |u|) |r|
                                                      (QREFELT % 16)))
                                      #1#))))
                             (LETT #2# (CDR #2#)) (GO G190) G191
                             (EXIT (NREVERSE #1#))))))))) 

(SDEFUN |FM;*;%R%;6| ((|x| (%)) (|r| (R)) (% (%)))
        (SPROG ((#1=#:G41 NIL) (|u| NIL) (#2=#:G42 NIL) (|a| (R)))
               (SEQ
                (COND ((SPADCALL |r| (QREFELT % 13)) (|spadConstant| % 14))
                      ((SPADCALL |r| (QREFELT % 11) (QREFELT % 15)) |x|)
                      ('T
                       (PROGN
                        (LETT #1# NIL)
                        (SEQ (LETT |u| NIL) (LETT #2# |x|) G190
                             (COND
                              ((OR (ATOM #2#) (PROGN (LETT |u| (CAR #2#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL
                                  (LETT |a|
                                        (SPADCALL (QCDR |u|) |r|
                                                  (QREFELT % 16)))
                                  (|spadConstant| % 10) (QREFELT % 18))
                                 (LETT #1#
                                       (CONS (CONS (QCAR |u|) |a|) #1#))))))
                             (LETT #2# (CDR #2#)) (GO G190) G191
                             (EXIT (NREVERSE #1#))))))))) 

(SDEFUN |FM;*;RS%;7| ((|r| (R)) (|s| (S)) (% (%)))
        (COND
         ((SPADCALL |r| (|spadConstant| % 10) (QREFELT % 15))
          (|spadConstant| % 14))
         ('T (LIST (CONS |s| |r|))))) 

(SDEFUN |FM;*;SR%;8| ((|s| (S)) (|r| (R)) (% (%)))
        (COND
         ((SPADCALL |r| (|spadConstant| % 10) (QREFELT % 15))
          (|spadConstant| % 14))
         ('T (LIST (CONS |s| |r|))))) 

(SDEFUN |FM;coerce;%Of;9| ((|x| (%)) (% (|OutputForm|)))
        (SPROG ((|rec| NIL) (#1=#:G58 NIL) (|le| (|List| (|OutputForm|))))
               (SEQ
                (COND
                 ((NULL |x|) (SPADCALL (|spadConstant| % 10) (QREFELT % 23)))
                 ('T
                  (SEQ (LETT |le| NIL)
                       (SEQ (LETT |rec| NIL) (LETT #1# (REVERSE |x|)) G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |rec| (CAR #1#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((SPADCALL (QCDR |rec|) (|spadConstant| % 9)
                                          (QREFELT % 15))
                                (LETT |le|
                                      (CONS
                                       (SPADCALL (QCAR |rec|) (QREFELT % 24))
                                       |le|)))
                               ('T
                                (LETT |le|
                                      (CONS
                                       (SPADCALL
                                        (SPADCALL (QCDR |rec|) (QREFELT % 23))
                                        (SPADCALL (QCAR |rec|) (QREFELT % 24))
                                        (QREFELT % 25))
                                       |le|))))))
                            (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                       (EXIT (SPADCALL (ELT % 26) |le| (QREFELT % 29))))))))) 

(SDEFUN |FM;coerce;%Of;10| ((|x| (%)) (% (|OutputForm|)))
        (SPROG ((#1=#:G74 NIL) (|rec| NIL) (#2=#:G75 NIL))
               (SEQ
                (SPADCALL (ELT % 26)
                          (PROGN
                           (LETT #1# NIL)
                           (SEQ (LETT |rec| NIL) (LETT #2# |x|) G190
                                (COND
                                 ((OR (ATOM #2#)
                                      (PROGN (LETT |rec| (CAR #2#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #1#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL (QCDR |rec|)
                                                    (QREFELT % 23))
                                          (SPADCALL (QCAR |rec|)
                                                    (QREFELT % 24))
                                          (QREFELT % 25))
                                         #1#))))
                                (LETT #2# (CDR #2#)) (GO G190) G191
                                (EXIT (NREVERSE #1#))))
                          (QREFELT % 29))))) 

(SDEFUN |FM;support;%L;11| ((|x| (%)) (% (|List| S)))
        (SPROG ((#1=#:G79 NIL) (|t| NIL) (#2=#:G80 NIL))
               (SEQ
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |t| NIL) (LETT #2# |x|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |t| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #1# (CONS (QCAR |t|) #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#))))))) 

(SDEFUN |FM;coefficients;%L;12| ((|x| (%)) (% (|List| R)))
        (SPROG ((#1=#:G84 NIL) (|t| NIL) (#2=#:G85 NIL))
               (SEQ
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |t| NIL) (LETT #2# |x|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |t| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #1# (CONS (QCDR |t|) #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#))))))) 

(SDEFUN |FM;monom| ((|b| (S)) (|r| (R)) (% (%))) (LIST (CONS |b| |r|))) 

(SDEFUN |FM;monomials;%L;14| ((|x| (%)) (% (|List| %)))
        (SPROG ((#1=#:G90 NIL) (|t| NIL) (#2=#:G91 NIL))
               (SEQ
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |t| NIL) (LETT #2# |x|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |t| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS (|FM;monom| (QCAR |t|) (QCDR |t|) %)
                                    #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#))))))) 

(SDEFUN |FM;retractIfCan;%U;15| ((|x| (%)) (% (|Union| S "failed")))
        (COND
         ((OR (SPADCALL (SPADCALL |x| (QREFELT % 38)) 1 (QREFELT % 40))
              (NULL
               (SPADCALL (QCDR (|SPADfirst| |x|)) (|spadConstant| % 9)
                         (QREFELT % 15))))
          (CONS 1 "failed"))
         ('T (CONS 0 (QCAR (|SPADfirst| |x|)))))) 

(SDEFUN |FM;retract;%S;16| ((|x| (%)) (% (S)))
        (SPROG ((|rr| (|Union| S "failed")))
               (SEQ (LETT |rr| (SPADCALL |x| (QREFELT % 42)))
                    (EXIT
                     (COND ((QEQCAR |rr| 1) (|error| "FM1.retract impossible"))
                           ('T (QCDR |rr|))))))) 

(SDEFUN |FM;coerce;S%;17| ((|s| (S)) (% (%)))
        (LIST (CONS |s| (|spadConstant| % 9)))) 

(SDEFUN |FM;coefficient;%SR;18| ((|x| (%)) (|s| (S)) (% (R)))
        (COND ((NULL |x|) (|spadConstant| % 10))
              ((SPADCALL |s| (QCAR (|SPADfirst| |x|)) (QREFELT % 45))
               (SPADCALL (CDR |x|) |s| (QREFELT % 46)))
              ((SPADCALL (QCAR (|SPADfirst| |x|)) |s| (QREFELT % 47))
               (QCDR (|SPADfirst| |x|)))
              ('T (|spadConstant| % 10)))) 

(SDEFUN |FM;coefficient;%SR;19| ((|x| (%)) (|s| (S)) (% (R)))
        (SPROG ((|xr| (|Rep|)) (|t| NIL) (#1=#:G117 NIL) (#2=#:G116 NIL))
               (SEQ
                (EXIT
                 (SEQ (LETT |xr| |x|)
                      (SEQ (LETT |t| NIL) (LETT #1# |xr|) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL (QCAR |t|) |s| (QREFELT % 47))
                               (PROGN (LETT #2# (QCDR |t|)) (GO #3=#:G115))))))
                           (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                      (EXIT (|spadConstant| % 10))))
                #3# (EXIT #2#)))) 

(SDEFUN |FM;linearExtend;M%R;20| ((|f| (|Mapping| R S)) (|x| (%)) (% (R)))
        (SPROG ((|t| NIL) (#1=#:G126 NIL) (|res| (R)))
               (SEQ
                (COND ((SPADCALL |x| (QREFELT % 48)) (|spadConstant| % 10))
                      ('T
                       (SEQ (LETT |res| (|spadConstant| % 10))
                            (SEQ (LETT |t| NIL)
                                 (LETT #1# (SPADCALL |x| (QREFELT % 51))) G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |t| (CAR #1#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT |res|
                                         (SPADCALL |res|
                                                   (SPADCALL (QCDR |t|)
                                                             (SPADCALL
                                                              (QCAR |t|) |f|)
                                                             (QREFELT % 16))
                                                   (QREFELT % 52)))))
                                 (LETT #1# (CDR #1#)) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT |res|))))))) 

(DECLAIM (NOTINLINE |FreeModule;|)) 

(DEFUN |FreeModule;| (|#1| |#2|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (#1=#:G132 NIL) (#2=#:G131 NIL)
    (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$| (LIST '|FreeModule| DV$1 DV$2))
    (LETT % (GETREFV 61))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1| '(|AbelianGroup|))
                                        (|HasCategory| |#1| '(|AbelianMonoid|))
                                        (|HasCategory| |#1|
                                                       '(|CommutativeRing|))
                                        (OR
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         (|HasCategory| |#1|
                                                        '(|AbelianMonoid|))
                                         (|HasCategory| |#1|
                                                        '(|CancellationAbelianMonoid|)))
                                        (OR
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         (|HasCategory| |#1|
                                                        '(|CancellationAbelianMonoid|)))
                                        (AND (|HasCategory| |#1| '(|Hashable|))
                                             (|HasCategory| |#2|
                                                            '(|Hashable|)))
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (|HasCategory| |#2| '(|Comparable|))
                                        (|HasCategory| |#1|
                                                       '(|OrderedAbelianMonoidSup|))
                                        (LETT #1#
                                              (|HasCategory| |#2|
                                                             '(|OrderedSet|)))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|OrderedAbelianMonoidSup|))
                                         #1#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|AbelianMonoid|))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|OrderedAbelianMonoidSup|))
                                          #1#))
                                        (OR
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         (|HasCategory| |#1|
                                                        '(|CancellationAbelianMonoid|))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|OrderedAbelianMonoidSup|))
                                          #1#))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|OrderedAbelianSemiGroup|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1| '(|Comparable|))
                                          (|HasCategory| |#2| '(|Comparable|)))
                                         (AND
                                          (|HasCategory| |#1| '(|Comparable|))
                                          #1#)
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|OrderedAbelianMonoidSup|))
                                          #1#)
                                         (AND #2# #1#))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|OrderedAbelianMonoidSup|))
                                          #1#)
                                         (AND #2# #1#))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1| '(|Comparable|))
                                          (|HasCategory| |#2| '(|Comparable|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|OrderedAbelianMonoidSup|))
                                          #1#)
                                         (AND #2# #1#))))))
    (|haddProp| |$ConstructorCache| '|FreeModule| (LIST DV$1 DV$2) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|OrderedAbelianMonoidSup|)) #1#
           (|HasCategory| % '(|SetWithZero|)))
      (AND #2# #1# (|HasCategory| % '(|SetWithZero|))))
     (|augmentPredVector| % 131072))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|OrderedAbelianMonoidSup|)) #1#
           (|HasCategory| % '(|AbelianGroup|)))
      (AND #2# #1# (|HasCategory| % '(|AbelianGroup|))))
     (|augmentPredVector| % 262144))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 8 (|List| (|Record| (|:| |k| |#2|) (|:| |c| |#1|))))
    (QSETREFV % 11
              (COND
               ((|HasCategory| |#1| '(|MagmaWithUnit|)) (|spadConstant| % 9))
               ('T (|spadConstant| % 10))))
    (COND
     ((|HasCategory| |#1| '(|noZeroDivisors|))
      (QSETREFV % 17 (CONS (|dispatchFunction| |FM;*;R2%;3|) %)))
     ('T (QSETREFV % 17 (CONS (|dispatchFunction| |FM;*;R2%;4|) %))))
    (COND
     ((|HasCategory| |#1| '(|noZeroDivisors|))
      (QSETREFV % 19 (CONS (|dispatchFunction| |FM;*;%R%;5|) %)))
     ('T (QSETREFV % 19 (CONS (|dispatchFunction| |FM;*;%R%;6|) %))))
    (COND
     ((|HasCategory| |#1| '(|MagmaWithUnit|))
      (QSETREFV % 30 (CONS (|dispatchFunction| |FM;coerce;%Of;9|) %)))
     ('T (QSETREFV % 30 (CONS (|dispatchFunction| |FM;coerce;%Of;10|) %))))
    (COND
     ((|testBitVector| |pv$| 7)
      (PROGN
       (QSETREFV % 42 (CONS (|dispatchFunction| |FM;retractIfCan;%U;15|) %))
       (QSETREFV % 43 (CONS (|dispatchFunction| |FM;retract;%S;16|) %))
       (QSETREFV % 44 (CONS (|dispatchFunction| |FM;coerce;S%;17|) %)))))
    (COND
     ((|testBitVector| |pv$| 8)
      (QSETREFV % 46 (CONS (|dispatchFunction| |FM;coefficient;%SR;18|) %)))
     ('T
      (QSETREFV % 46 (CONS (|dispatchFunction| |FM;coefficient;%SR;19|) %))))
    (COND
     ((|testBitVector| |pv$| 3)
      (PROGN
       (QSETREFV % 54
                 (CONS (|dispatchFunction| |FM;linearExtend;M%R;20|) %)))))
    %))) 

(DEFUN |FreeModule| (&REST #1=#:G133)
  (SPROG NIL
         (PROG (#2=#:G134)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FreeModule|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |FreeModule;|) #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|FreeModule|)))))))))) 

(MAKEPROP '|FreeModule| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|IndexedDirectProductObject| 6 7)
              (|local| |#1|) (|local| |#2|) '|Rep| (0 . |1|) (4 . |0|) '|r_one|
              (|Boolean|) (8 . |zero?|) (13 . |0|) (17 . =) (23 . *) (29 . *)
              (35 . ~=) (41 . *) |FM;*;RS%;7| |FM;*;SR%;8| (|OutputForm|)
              (47 . |coerce|) (52 . |coerce|) (57 . *) (63 . +)
              (|Mapping| 22 22 22) (|List| 22) (69 . |reduce|) (75 . |coerce|)
              (|List| 7) |FM;support;%L;11| (|List| 6) |FM;coefficients;%L;12|
              (|List| %) |FM;monomials;%L;14| (|NonNegativeInteger|)
              (80 . |numberOfMonomials|) (|Integer|) (85 . ~=)
              (|Union| 7 '"failed") (91 . |retractIfCan|) (96 . |retract|)
              (101 . |coerce|) (106 . |smaller?|) (112 . |coefficient|)
              (118 . =) (124 . |zero?|) (|Record| (|:| |k| 7) (|:| |c| 6))
              (|List| 49) (129 . |listOfTerms|) (134 . +) (|Mapping| 6 7)
              (140 . |linearExtend|) (|String|) (|PositiveInteger|)
              (|Mapping| 6 6) (|SingleInteger|) (|HashState|)
              (|Union| % '"failed"))
           '#(~= 146 |zero?| 152 |support| 157 |sup| 162 |subtractIfCan| 168
              |smaller?| 174 |sign| 180 |sample| 185 |retractIfCan| 189
              |retract| 194 |reductum| 199 |positive?| 204 |opposite?| 209
              |numberOfMonomials| 215 |negative?| 220 |monomials| 225
              |monomial?| 230 |monomial| 235 |min| 241 |max| 247 |map| 253
              |listOfTerms| 259 |linearExtend| 264 |leadingTerm| 270
              |leadingSupport| 275 |leadingMonomial| 280 |leadingCoefficient|
              285 |latex| 290 |inf| 295 |hashUpdate!| 301 |hash| 307
              |constructOrdered| 312 |construct| 317 |coerce| 322
              |coefficients| 332 |coefficient| 337 |abs| 343 >= 348 > 354 = 360
              <= 366 < 372 |0| 378 - 382 + 393 * 399)
           'NIL
           (CONS
            (|makeByteWordVec2| 16
                                '(0 3 0 0 0 11 0 0 0 16 1 16 5 15 4 15 2 0 7 6
                                  0 7 16 0 0))
            (CONS
             '#(|FreeModuleCategory&| |Module&| NIL NIL NIL NIL NIL NIL NIL
                |OrderedAbelianSemiGroup&| |AbelianGroup&| |OrderedSet&| NIL
                NIL |AbelianMonoid&| NIL |SetWithZero&| |AbelianSemiGroup&|
                |RetractableTo&| |Hashable&| |SetCategory&| NIL |PartialOrder&|
                NIL |BasicType&|)
             (CONS
              '#((|FreeModuleCategory| 6 7) (|Module| 6)
                 (|IndexedDirectProductCategory| 6 7) (|BiModule| 6 6)
                 (|IndexedProductCategory| 6 7) (|OrderedAbelianMonoidSup|)
                 (|RightModule| 6) (|LeftModule| 6)
                 (|AbelianProductCategory| 6) (|OrderedAbelianSemiGroup|)
                 (|AbelianGroup|) (|OrderedSet|) (|CancellationAbelianMonoid|)
                 (|Comparable|) (|AbelianMonoid|) (|ComparableRepresentation|)
                 (|SetWithZero|) (|AbelianSemiGroup|) (|RetractableTo| 7)
                 (|Hashable|) (|SetCategory|) (|CoercibleFrom| 7)
                 (|PartialOrder|) (|CoercibleTo| 22) (|BasicType|))
              (|makeByteWordVec2| 60
                                  '(0 6 0 9 0 6 0 10 1 6 12 0 13 0 0 0 14 2 6
                                    12 0 0 15 2 6 0 0 0 16 2 0 0 6 0 17 2 6 12
                                    0 0 18 2 0 0 0 6 19 1 6 22 0 23 1 7 22 0 24
                                    2 22 0 0 0 25 2 22 0 0 0 26 2 28 22 27 0 29
                                    1 0 22 0 30 1 0 37 0 38 2 39 12 0 0 40 1 0
                                    41 0 42 1 0 7 0 43 1 0 0 7 44 2 7 12 0 0 45
                                    2 0 6 0 7 46 2 7 12 0 0 47 1 0 12 0 48 1 0
                                    50 0 51 2 6 0 0 0 52 2 0 6 53 0 54 2 0 12 0
                                    0 1 1 12 12 0 48 1 0 31 0 32 2 11 0 0 0 1 2
                                    13 60 0 0 1 2 17 12 0 0 1 1 18 39 0 1 0 12
                                    0 1 1 7 41 0 42 1 7 7 0 43 1 8 0 0 1 1 18
                                    12 0 1 2 12 12 0 0 1 1 0 37 0 38 1 18 12 0
                                    1 1 0 35 0 36 1 0 12 0 1 2 0 0 6 7 1 2 16 0
                                    0 0 1 2 16 0 0 0 1 2 0 0 57 0 1 1 0 50 0 51
                                    2 3 6 53 0 54 1 8 49 0 1 1 8 7 0 1 1 8 0 0
                                    1 1 8 6 0 1 1 0 55 0 1 2 11 0 0 0 1 2 6 59
                                    59 0 1 1 6 58 0 1 1 8 0 50 1 1 0 0 50 1 1 0
                                    22 0 30 1 7 0 7 44 1 0 33 0 34 2 0 6 0 7 46
                                    1 19 0 0 1 2 16 12 0 0 1 2 16 12 0 0 1 2 0
                                    12 0 0 1 2 16 12 0 0 1 2 16 12 0 0 1 0 12 0
                                    14 2 1 0 0 0 1 1 1 0 0 1 2 0 0 0 0 1 2 0 0
                                    56 0 1 2 0 0 6 0 17 2 0 0 0 6 19 2 0 0 6 7
                                    20 2 0 0 7 6 21 2 12 0 37 0 1 2 1 0 39 0
                                    1)))))
           '|lookupComplete|)) 
