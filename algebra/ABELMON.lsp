
(DECLAIM (NOTINLINE |AbelianMonoid;|)) 

(DEFPARAMETER |AbelianMonoid;AL| 'NIL) 

(DEFUN |AbelianMonoid| ()
  (COND (|AbelianMonoid;AL|) (T (SETQ |AbelianMonoid;AL| (|AbelianMonoid;|))))) 

(DEFUN |AbelianMonoid;| ()
  (SPROG ((#1=#:G1 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|AbelianSemiGroup|) (|SetWithZero|)
                           (|mkCategory|
                            '(((* (% (|NonNegativeInteger|) %)) T)
                              ((|opposite?| ((|Boolean|) % %)) T))
                            NIL NIL NIL)))
           (SETELT #1# 0 '(|AbelianMonoid|))))) 
