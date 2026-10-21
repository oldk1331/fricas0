
(SDEFUN |GPOLCAT-;monomials;SL;1| ((|p| (S)) (% (|List| S)))
        (SPROG ((|ml| (|List| S)))
               (SEQ (LETT |ml| NIL)
                    (SEQ G190
                         (COND
                          ((NULL
                            (SPADCALL |p| (|spadConstant| % 10)
                                      (QREFELT % 13)))
                           (GO G191)))
                         (SEQ
                          (LETT |ml| (CONS (SPADCALL |p| (QREFELT % 14)) |ml|))
                          (EXIT (LETT |p| (SPADCALL |p| (QREFELT % 15)))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT (NREVERSE |ml|))))) 

(SDEFUN |GPOLCAT-;monomial;SLLS;2|
        ((|p| (S)) (|lv| (|List| |VarSet|))
         (|ln| (|List| (|NonNegativeInteger|))) (% (S)))
        (COND
         ((NULL |lv|)
          (COND ((NULL |ln|) |p|)
                (#1='T (|error| "mismatched lists in monomial"))))
         ((NULL |ln|) (|error| "mismatched lists in monomial"))
         (#1#
          (SPADCALL
           (SPADCALL |p| (|SPADfirst| |lv|) (|SPADfirst| |ln|) (QREFELT % 19))
           (CDR |lv|) (CDR |ln|) (QREFELT % 22))))) 

(SDEFUN |GPOLCAT-;variables;2SL;3| ((|p| (S)) (|q| (S)) (% (|List| |VarSet|)))
        (SPADCALL (ELT % 24) (SPADCALL |p| (QREFELT % 25))
                  (SPADCALL |q| (QREFELT % 25)) (QREFELT % 27))) 

(SDEFUN |GPOLCAT-;mkPrim| ((|p| (S)) (% (S)))
        (SPADCALL (|spadConstant| % 30) (SPADCALL |p| (QREFELT % 31))
                  (QREFELT % 32))) 

(SDEFUN |GPOLCAT-;primitiveMonomials;SL;5| ((|p| (S)) (% (|List| S)))
        (SPROG ((|ml| (|List| S)))
               (SEQ (LETT |ml| NIL)
                    (SEQ G190
                         (COND
                          ((NULL
                            (SPADCALL |p| (|spadConstant| % 10)
                                      (QREFELT % 13)))
                           (GO G191)))
                         (SEQ
                          (LETT |ml|
                                (CONS
                                 (|GPOLCAT-;mkPrim|
                                  (SPADCALL |p| (QREFELT % 14)) %)
                                 |ml|))
                          (EXIT (LETT |p| (SPADCALL |p| (QREFELT % 15)))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT (NREVERSE |ml|))))) 

(DECLAIM (NOTINLINE |MaybeSkewPolynomialCategory&;|)) 

(DEFUN |MaybeSkewPolynomialCategory&| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (DV$4 NIL) (|dv$| NIL) (% NIL)
    (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT |dv$| (LIST '|MaybeSkewPolynomialCategory&| DV$1 DV$2 DV$3 DV$4))
    (LETT % (GETREFV 34))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#2|
                                                       '(|canonicalUnitNormal|))
                                        (|HasCategory| |#2|
                                                       '(|ComparableRepresentation|))
                                        (|HasCategory| |#2| '(|Comparable|))
                                        (|HasCategory| |#2| '(|SemiRing|))
                                        (|HasCategory| |#2| '(|Ring|))))))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (SETF |pv$| (QREFELT % 3))
    (COND
     ((|testBitVector| |pv$| 4)
      (PROGN
       (QSETREFV % 33
                 (CONS (|dispatchFunction| |GPOLCAT-;primitiveMonomials;SL;5|)
                       %)))))
    %))) 

(MAKEPROP '|MaybeSkewPolynomialCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (0 . |0|) (4 . |0|) (|Boolean|)
              (8 . ~=) (14 . |leadingMonomial|) (19 . |reductum|) (|List| %)
              |GPOLCAT-;monomials;SL;1| (|NonNegativeInteger|)
              (24 . |monomial|) (|List| 9) (|List| 18) (31 . |monomial|)
              |GPOLCAT-;monomial;SLLS;2| (38 . >) (44 . |variables|)
              (|Mapping| 12 9 9) (49 . |merge_unique|)
              |GPOLCAT-;variables;2SL;3| (56 . |1|) (60 . |1|) (64 . |degree|)
              (69 . |monomial|) (75 . |primitiveMonomials|))
           '#(|variables| 80 |primitiveMonomials| 86 |monomials| 91 |monomial|
              96)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|primitiveMonomials| ((|List| |#1|) |#1|)) T)
                              '((|variables| ((|List| |#4|) |#1| |#1|)) T)
                              '((|variables| ((|List| |#4|) |#1|)) T)
                              '((|monomial|
                                 (|#1| |#1| (|List| |#4|)
                                  (|List| (|NonNegativeInteger|))))
                                T)
                              '((|monomial|
                                 (|#1| |#1| |#4| (|NonNegativeInteger|)))
                                T)
                              '((|monomials| ((|List| |#1|) |#1|)) T)
                              '((|monomial| (|#1| |#2| |#3|)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 33
                                            '(0 6 0 10 0 7 0 11 2 6 12 0 0 13 1
                                              6 0 0 14 1 6 0 0 15 3 6 0 0 9 18
                                              19 3 6 0 0 20 21 22 2 9 12 0 0 24
                                              1 6 20 0 25 3 20 0 26 0 0 27 0 6
                                              0 29 0 7 0 30 1 6 8 0 31 2 6 0 7
                                              8 32 1 0 16 0 33 2 0 20 0 0 28 1
                                              0 16 0 33 1 0 16 0 17 3 0 0 0 20
                                              21 23)))))
           '|lookupComplete|)) 
