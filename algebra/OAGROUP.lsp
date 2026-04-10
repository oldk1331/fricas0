
(DECLAIM (NOTINLINE |OrderedAbelianGroup;|)) 

(DEFPARAMETER |OrderedAbelianGroup;AL| 'NIL) 

(DEFUN |OrderedAbelianGroup| ()
  (COND (|OrderedAbelianGroup;AL|)
        (T (SETQ |OrderedAbelianGroup;AL| (|OrderedAbelianGroup;|))))) 

(DEFUN |OrderedAbelianGroup;| ()
  (SPROG ((#1=#:G6 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|OrderedCancellationAbelianMonoid|)
                           (|AbelianGroup|)
                           (|mkCategory|
                            '(((|positive?| ((|Boolean|) %)) T)
                              ((|negative?| ((|Boolean|) %)) T)
                              ((|sign| ((|Integer|) %)) T) ((|abs| (% %)) T))
                            NIL NIL NIL)))
           (SETELT #1# 0 '(|OrderedAbelianGroup|))))) 
