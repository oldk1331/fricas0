
(DECLAIM (NOTINLINE |OrderedRing;|)) 

(DEFPARAMETER |OrderedRing;AL| 'NIL) 

(DEFUN |OrderedRing| ()
  (COND (|OrderedRing;AL|) (T (SETQ |OrderedRing;AL| (|OrderedRing;|))))) 

(DEFUN |OrderedRing;| ()
  (SPROG ((#1=#:G0 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|Ring|) (|OrderedAbelianSemiGroup|)
                           (|OrderedMagmaWithZero|) (|CharacteristicZero|)))
           (SETELT #1# 0 '(|OrderedRing|))))) 
