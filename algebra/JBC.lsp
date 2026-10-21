
(DECLAIM (NOTINLINE |JetBundleCategory;|)) 

(DEFPARAMETER |JetBundleCategory;AL| 'NIL) 

(DEFUN |JetBundleCategory| ()
  (COND (|JetBundleCategory;AL|)
        (T (SETQ |JetBundleCategory;AL| (|JetBundleCategory;|))))) 

(DEFUN |JetBundleCategory;| ()
  (SPROG ((#1=#:G23 NIL))
         (PROG1
             (LETT #1#
                   (|subst_in_cat| '(#2=#:G22)
                                   (LIST '(|Expression| (|Integer|)))
                                   (|Join| (|JetBundleOperationsCategory|)
                                           (|OrderedSet|) (|CoercibleTo| '#2#)
                                           (|mkCategory|
                                            '(((|multiIndex|
                                                ((|List|
                                                  (|NonNegativeInteger|))
                                                 %))
                                               T)
                                              ((|repeatedIndex|
                                                ((|List| (|PositiveInteger|))
                                                 %))
                                               T)
                                              ((|r2m|
                                                ((|List|
                                                  (|NonNegativeInteger|))
                                                 (|List| (|PositiveInteger|))))
                                               T)
                                              ((|m2r|
                                                ((|List| (|PositiveInteger|))
                                                 (|List|
                                                  (|NonNegativeInteger|))))
                                               T)
                                              ((|allRepeated|
                                                ((|List|
                                                  (|List| (|PositiveInteger|)))
                                                 (|List|
                                                  (|NonNegativeInteger|))))
                                               T)
                                              ((|index|
                                                ((|PositiveInteger|) %))
                                               T)
                                              ((|type| ((|Symbol|) %)) T)
                                              ((|name| ((|Symbol|) %)) T)
                                              ((|class|
                                                ((|NonNegativeInteger|)
                                                 (|List|
                                                  (|NonNegativeInteger|))))
                                               T)
                                              ((|class|
                                                ((|NonNegativeInteger|) %))
                                               T)
                                              ((|order|
                                                ((|NonNegativeInteger|) %))
                                               T)
                                              ((|weight|
                                                ((|NonNegativeInteger|) %))
                                               T)
                                              ((> ((|Boolean|) % %)) T)
                                              ((|differentiate|
                                                ((|Union| % "0") %
                                                 (|PositiveInteger|)))
                                               T)
                                              ((|derivativeOf?|
                                                ((|List|
                                                  (|NonNegativeInteger|))
                                                 % %))
                                               T)
                                              ((|integrateIfCan|
                                                ((|Union| % "failed") %
                                                 (|PositiveInteger|)))
                                               T)
                                              ((|integrate|
                                                (% % (|PositiveInteger|)))
                                               T)
                                              ((|Pm|
                                                (% (|PositiveInteger|)
                                                 (|List|
                                                  (|NonNegativeInteger|))))
                                               T)
                                              ((|Pr|
                                                (% (|PositiveInteger|)
                                                 (|List| (|PositiveInteger|))))
                                               T)
                                              ((|1| (%) |constant|) T)
                                              ((|one?| ((|Boolean|) %)) T)
                                              ((|variables|
                                                ((|List| %)
                                                 (|NonNegativeInteger|)))
                                               T)
                                              ((|variables|
                                                ((|List| %)
                                                 (|NonNegativeInteger|)
                                                 (|PositiveInteger|)))
                                               T)
                                              ((|dimJ|
                                                ((|NonNegativeInteger|)
                                                 (|NonNegativeInteger|)))
                                               T)
                                              ((|dimS|
                                                ((|NonNegativeInteger|)
                                                 (|NonNegativeInteger|)))
                                               T))
                                            NIL NIL NIL))))
           (SETELT #1# 0 '(|JetBundleCategory|))))) 
