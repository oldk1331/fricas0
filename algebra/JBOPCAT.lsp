
(DECLAIM (NOTINLINE |JetBundleOperationsCategory;|)) 

(DEFPARAMETER |JetBundleOperationsCategory;AL| 'NIL) 

(DEFUN |JetBundleOperationsCategory| ()
  (COND (|JetBundleOperationsCategory;AL|)
        (T
         (SETQ |JetBundleOperationsCategory;AL|
                 (|JetBundleOperationsCategory;|))))) 

(DEFUN |JetBundleOperationsCategory;| ()
  (SPROG ((#1=#:G0 NIL))
         (PROG1
             (LETT #1#
                   (|Join|
                    (|mkCategory|
                     '(((|setNotation| ((|Symbol|) (|Symbol|))) T)
                       ((|getNotation| ((|Symbol|))) T)
                       ((X (% (|PositiveInteger|))) T)
                       ((U (% (|PositiveInteger|))) T)
                       ((P
                         (% (|PositiveInteger|)
                          (|List| (|NonNegativeInteger|))))
                        T)
                       ((|numIndVar| ((|PositiveInteger|))) T)
                       ((|numDepVar| ((|PositiveInteger|))) T) ((X (%)) T)
                       ((U (%)) T) ((P (% (|List| (|NonNegativeInteger|)))) T)
                       ((P (% (|PositiveInteger|) (|NonNegativeInteger|))) T)
                       ((P (% (|NonNegativeInteger|))) T))
                     NIL NIL NIL)))
           (SETELT #1# 0 '(|JetBundleOperationsCategory|))))) 
