
(DECLAIM (NOTINLINE |DivisionRing;|)) 

(DEFPARAMETER |DivisionRing;AL| 'NIL) 

(DEFUN |DivisionRing| ()
  (COND (|DivisionRing;AL|) (T (SETQ |DivisionRing;AL| (|DivisionRing;|))))) 

(DEFUN |DivisionRing;| ()
  (SPROG ((#1=#:G2 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|EntireRing|) (|TwoSidedRecip|)
                           (|mkCategory|
                            '(((^ (% % (|Integer|))) T) ((|inv| (% %)) T))
                            '(((|Algebra| (|Fraction| (|Integer|)))
                               (|has| % (|CharacteristicZero|))))
                            NIL NIL)))
           (SETELT #1# 0 '(|DivisionRing|))))) 
