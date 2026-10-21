
(DECLAIM (NOTINLINE |OrderedSet;|)) 

(DEFPARAMETER |OrderedSet;AL| 'NIL) 

(DEFUN |OrderedSet| ()
  (COND (|OrderedSet;AL|) (T (SETQ |OrderedSet;AL| (|OrderedSet;|))))) 

(DEFUN |OrderedSet;| ()
  (SPROG ((#1=#:G3 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|Comparable|) (|PartialOrder|)
                           (|mkCategory|
                            '(((|max| (% % %)) T) ((|min| (% % %)) T)
                              ((|positive?| ((|Boolean|) %))
                               (|has| % (|SetWithZero|)))
                              ((|negative?| ((|Boolean|) %))
                               (|has| % (|SetWithZero|)))
                              ((|sign| ((|Integer|) %))
                               (|has| % (|SetWithZero|))))
                            NIL NIL NIL)))
           (SETELT #1# 0 '(|OrderedSet|))))) 
