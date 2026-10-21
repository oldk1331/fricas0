
(DECLAIM (NOTINLINE |OrderedMagma;|)) 

(DEFPARAMETER |OrderedMagma;AL| 'NIL) 

(DEFUN |OrderedMagma| ()
  (COND (|OrderedMagma;AL|) (T (SETQ |OrderedMagma;AL| (|OrderedMagma;|))))) 

(DEFUN |OrderedMagma;| ()
  (SPROG ((#1=#:G0 NIL))
         (PROG1 (LETT #1# (|Join| (|OrderedSet|) (|Magma|)))
           (SETELT #1# 0 '(|OrderedMagma|))))) 
