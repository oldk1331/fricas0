
(DEFPARAMETER |IntervalCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |IntervalCategory;|)) 

(DEFPARAMETER |IntervalCategory;AL| 'NIL) 

(DEFUN |IntervalCategory| (|t#1|)
  (LET (#1=#:G2 (#2=#:G3 (|devaluate| |t#1|)))
    (COND ((SETQ #1# (|assoc| #2# |IntervalCategory;AL|)) (CDR #1#))
          (T
           (SETQ |IntervalCategory;AL|
                   (|cons5| (CONS #2# (SETQ #1# (|IntervalCategory;| #2#)))
                            |IntervalCategory;AL|))
           #1#)))) 

(DEFUN |IntervalCategory;| (|t#1|)
  (SPROG ((#1=#:G1 NIL))
         (PROG1
             (LETT #1#
                   (|subst_in_cat| '(|t#1|) (LIST |t#1|)
                                   (|subst_in_cat| '(#2=#:G0)
                                                   (LIST '(|Integer|))
                                                   (COND
                                                    (|IntervalCategory;CAT|)
                                                    ('T
                                                     (LETT
                                                      |IntervalCategory;CAT|
                                                      (|Join|
                                                       (|AIntervalCategory|
                                                        '|t#1|)
                                                       (|GcdDomain|)
                                                       (|OrderedSet|)
                                                       (|TranscendentalFunctionCategory|)
                                                       (|RadicalCategory|)
                                                       (|RetractableTo| '#2#)
                                                       (|Approximate|)
                                                       (|mkCategory|
                                                        '(((|interval|
                                                            (% |t#1|))
                                                           T)
                                                          ((|interval|
                                                            (%
                                                             (|Fraction|
                                                              (|Integer|))))
                                                           T))
                                                        NIL NIL NIL))))))))
           (SETELT #1# 0 (LIST '|IntervalCategory| |t#1|))))) 
