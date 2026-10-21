
(DECLAIM (NOTINLINE |MagmaWithZero;|)) 

(DEFPARAMETER |MagmaWithZero;AL| 'NIL) 

(DEFUN |MagmaWithZero| ()
  (COND (|MagmaWithZero;AL|) (T (SETQ |MagmaWithZero;AL| (|MagmaWithZero;|))))) 

(DEFUN |MagmaWithZero;| ()
  (SPROG ((#1=#:G0 NIL))
         (PROG1 (LETT #1# (|Join| (|Magma|) (|SetWithZero|)))
           (SETELT #1# 0 '(|MagmaWithZero|))))) 
