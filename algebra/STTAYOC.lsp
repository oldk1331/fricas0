
(DECLAIM (NOTINLINE |StreamTaylorSeriesOperationsCategory;|)) 

(DEFPARAMETER |StreamTaylorSeriesOperationsCategory;AL| 'NIL) 

(DEFUN |StreamTaylorSeriesOperationsCategory| (|t#1| |t#2|)
  (LET (#1=#:G1 (#2=#:G2 (LIST (|devaluate| |t#1|) (|devaluate| |t#2|))))
    (COND
     ((SETQ #1# (|assoc| #2# |StreamTaylorSeriesOperationsCategory;AL|))
      (CDR #1#))
     (T
      (SETQ |StreamTaylorSeriesOperationsCategory;AL|
              (|cons5|
               (CONS #2#
                     (SETQ #1#
                             (APPLY #'|StreamTaylorSeriesOperationsCategory;|
                                    #2#)))
               |StreamTaylorSeriesOperationsCategory;AL|))
      #1#)))) 

(DEFUN |StreamTaylorSeriesOperationsCategory;| (|t#1| |t#2|)
  (SPROG ((#1=#:G0 NIL))
         (PROG1
             (LETT #1#
                   (|subst_in_cat| '(|t#1| |t#2|) (LIST |t#1| |t#2|)
                                   (|Join|
                                    (|mkCategory|
                                     '(((+
                                         ((|Stream| |t#2|) (|Stream| |t#2|)
                                          (|Stream| |t#2|)))
                                        T)
                                       ((-
                                         ((|Stream| |t#2|) (|Stream| |t#2|)
                                          (|Stream| |t#2|)))
                                        T)
                                       ((- ((|Stream| |t#2|) (|Stream| |t#2|)))
                                        T)
                                       ((*
                                         ((|Stream| |t#2|) (|Stream| |t#1|)
                                          (|Stream| |t#2|)))
                                        T)
                                       ((*
                                         ((|Stream| |t#2|) |t#1|
                                          (|Stream| |t#2|)))
                                        T)
                                       ((*
                                         ((|Stream| |t#2|) (|Stream| |t#2|)
                                          |t#1|))
                                        (|has| |t#2| (|RightModule| |t#1|)))
                                       ((*
                                         ((|Stream| |t#2|) |t#2|
                                          (|Stream| |t#1|)))
                                        (|has| |t#2| (|RightModule| |t#1|)))
                                       ((|mapmult|
                                         ((|Stream| |t#2|) (|Stream| |t#2|)
                                          (|Stream| |t#1|)))
                                        (|has| |t#2| (|RightModule| |t#1|)))
                                       ((|eval|
                                         ((|Stream| |t#2|) (|Stream| |t#2|)
                                          |t#1|))
                                        (|has| |t#2| (|RightModule| |t#1|)))
                                       ((|compose|
                                         ((|Stream| |t#2|) (|Stream| |t#2|)
                                          (|Stream| |t#1|)))
                                        (|has| |t#2| (|RightModule| |t#1|)))
                                       ((|monom|
                                         ((|Stream| |t#2|) |t#2| (|Integer|)))
                                        T)
                                       ((|integers|
                                         ((|Stream| (|Integer|)) (|Integer|)))
                                        T)
                                       ((|oddintegers|
                                         ((|Stream| (|Integer|)) (|Integer|)))
                                        T)
                                       ((|int| ((|Stream| |t#1|) |t#1|)) T)
                                       ((|mapmult|
                                         ((|Stream| |t#2|) (|Stream| |t#1|)
                                          (|Stream| |t#2|)))
                                        T)
                                       ((|deriv|
                                         ((|Stream| |t#2|) (|Stream| |t#2|)))
                                        T)
                                       ((|gderiv|
                                         ((|Stream| |t#2|)
                                          (|Mapping| |t#1| (|Integer|))
                                          (|Stream| |t#2|)))
                                        T)
                                       ((|coerce| ((|Stream| |t#2|) |t#2|)) T)
                                       ((|addiag|
                                         ((|Stream| |t#2|)
                                          (|Stream| (|Stream| |t#2|))))
                                        T)
                                       ((|multisect|
                                         ((|Stream| |t#2|) (|Integer|)
                                          (|Integer|) (|Stream| |t#2|)))
                                        T)
                                       ((|invmultisect|
                                         ((|Stream| |t#2|) (|Integer|)
                                          (|Integer|) (|Stream| |t#2|)))
                                        T)
                                       ((|integrate|
                                         ((|Stream| |t#2|) |t#2|
                                          (|Stream| |t#2|)))
                                        (|has| |t#1|
                                               (|Algebra|
                                                (|Fraction| (|Integer|)))))
                                       ((|lazyIntegrate|
                                         ((|Stream| |t#2|) |t#2|
                                          (|Mapping| (|Stream| |t#2|))))
                                        (|has| |t#1|
                                               (|Algebra|
                                                (|Fraction| (|Integer|))))))
                                     NIL NIL NIL))))
           (SETELT #1# 0
                   (LIST '|StreamTaylorSeriesOperationsCategory| |t#1|
                         |t#2|))))) 
