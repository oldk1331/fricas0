
(DECLAIM (NOTINLINE |MatrixOperationsCategory;|)) 

(DEFPARAMETER |MatrixOperationsCategory;AL| 'NIL) 

(DEFUN |MatrixOperationsCategory| (|t#1| |t#2| |t#3|)
  (LET (#1=#:G1
        (#2=#:G2
         (LIST (|devaluate| |t#1|) (|devaluate| |t#2|) (|devaluate| |t#3|))))
    (COND ((SETQ #1# (|assoc| #2# |MatrixOperationsCategory;AL|)) (CDR #1#))
          (T
           (SETQ |MatrixOperationsCategory;AL|
                   (|cons5|
                    (CONS #2#
                          (SETQ #1# (APPLY #'|MatrixOperationsCategory;| #2#)))
                    |MatrixOperationsCategory;AL|))
           #1#)))) 

(DEFUN |MatrixOperationsCategory;| (|t#1| |t#2| |t#3|)
  (SPROG ((#1=#:G0 NIL))
         (PROG1
             (LETT #1#
                   (|subst_in_cat| '(|t#1| |t#2| |t#3|)
                                   (LIST |t#1| |t#2| |t#3|)
                                   (|Join|
                                    (|mkCategory|
                                     '(((|square?| ((|Boolean|) %)) T)
                                       ((|diagonal?| ((|Boolean|) %))
                                        (|has| |t#1| (|AbelianMonoid|)))
                                       ((|zero?| ((|Boolean|) %))
                                        (|has| |t#1| (|AbelianMonoid|)))
                                       ((|symmetric?| ((|Boolean|) %)) T)
                                       ((|antisymmetric?| ((|Boolean|) %))
                                        (|has| |t#1| (|AbelianGroup|)))
                                       ((+ (% % %))
                                        (|has| |t#1| (|AbelianMonoid|)))
                                       ((- (% % %))
                                        (|has| |t#1| (|AbelianGroup|)))
                                       ((- (% %))
                                        (|has| |t#1| (|AbelianGroup|)))
                                       ((* (% (|Integer|) %))
                                        (|has| |t#1| (|AbelianGroup|)))
                                       ((* (% % %)) (|has| |t#1| (|SemiRng|)))
                                       ((* (% |t#1| %))
                                        (|has| |t#1| (|SemiRng|)))
                                       ((* (% % |t#1|))
                                        (|has| |t#1| (|SemiRng|)))
                                       ((|exquo|
                                         ((|Union| % "failed") % |t#1|))
                                        (|has| |t#1| (|IntegralDomain|)))
                                       ((/ (% % |t#1|))
                                        (|has| |t#1| (|Field|)))
                                       ((|rowEchelon| (% %))
                                        (|has| |t#1| (|EuclideanDomain|)))
                                       ((|columnSpace| ((|List| |t#3|) %))
                                        (|has| |t#1| (|EuclideanDomain|)))
                                       ((|rank| ((|NonNegativeInteger|) %))
                                        (|has| |t#1| (|IntegralDomain|)))
                                       ((|nullity| ((|NonNegativeInteger|) %))
                                        (|has| |t#1| (|IntegralDomain|)))
                                       ((|nullSpace| ((|List| |t#3|) %))
                                        (|has| |t#1| (|IntegralDomain|)))
                                       ((|map| (% (|Mapping| |t#1| |t#1|) %))
                                        T))
                                     NIL NIL NIL))))
           (SETELT #1# 0
                   (LIST '|MatrixOperationsCategory| |t#1| |t#2| |t#3|))))) 
