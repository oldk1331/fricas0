
(DECLAIM (NOTINLINE |OrderedMagmaWithZero;|)) 

(DEFPARAMETER |OrderedMagmaWithZero;AL| 'NIL) 

(DEFUN |OrderedMagmaWithZero| ()
  (COND (|OrderedMagmaWithZero;AL|)
        (T (SETQ |OrderedMagmaWithZero;AL| (|OrderedMagmaWithZero;|))))) 

(DEFUN |OrderedMagmaWithZero;| ()
  (SPROG ((#1=#:G0 NIL))
         (PROG1 (LETT #1# (|Join| (|OrderedSet|) (|MagmaWithZero|)))
           (SETELT #1# 0 '(|OrderedMagmaWithZero|))))) 
