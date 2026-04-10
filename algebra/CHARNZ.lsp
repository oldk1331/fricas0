
(DECLAIM (NOTINLINE |CharacteristicNonZero;|)) 

(DEFPARAMETER |CharacteristicNonZero;AL| 'NIL) 

(DEFUN |CharacteristicNonZero| ()
  (COND (|CharacteristicNonZero;AL|)
        (T (SETQ |CharacteristicNonZero;AL| (|CharacteristicNonZero;|))))) 

(DEFUN |CharacteristicNonZero;| ()
  (SPROG ((#1=#:G0 NIL))
         (PROG1 (LETT #1# (|Join| (|Ring|)))
           (SETELT #1# 0 '(|CharacteristicNonZero|))))) 
