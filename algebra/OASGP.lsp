
(DECLAIM (NOTINLINE |OrderedAbelianSemiGroup;|)) 

(DEFPARAMETER |OrderedAbelianSemiGroup;AL| 'NIL) 

(DEFUN |OrderedAbelianSemiGroup| ()
  (COND (|OrderedAbelianSemiGroup;AL|)
        (T (SETQ |OrderedAbelianSemiGroup;AL| (|OrderedAbelianSemiGroup;|))))) 

(DEFUN |OrderedAbelianSemiGroup;| ()
  (SPROG ((#1=#:G3 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|OrderedSet|) (|AbelianSemiGroup|)
                           (|mkCategory|
                            '(((|abs| (% %)) (|has| % (|AbelianGroup|)))) NIL
                            NIL NIL)))
           (SETELT #1# 0 '(|OrderedAbelianSemiGroup|))))) 
