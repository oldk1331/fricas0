
(DECLAIM (NOTINLINE |CharacteristicZero;|)) 

(DEFPARAMETER |CharacteristicZero;AL| 'NIL) 

(DEFUN |CharacteristicZero| ()
  (COND (|CharacteristicZero;AL|)
        (T (SETQ |CharacteristicZero;AL| (|CharacteristicZero;|))))) 

(DEFUN |CharacteristicZero;| ()
  (SPROG ((#1=#:G0 NIL))
         (PROG1 (LETT #1# (|Join| (|mkCategory| NIL NIL NIL NIL)))
           (SETELT #1# 0 '(|CharacteristicZero|))))) 
