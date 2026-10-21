
(DECLAIM (NOTINLINE |ComparableRepresentation;|)) 

(DEFPARAMETER |ComparableRepresentation;AL| 'NIL) 

(DEFUN |ComparableRepresentation| ()
  (COND (|ComparableRepresentation;AL|)
        (T (SETQ |ComparableRepresentation;AL| (|ComparableRepresentation;|))))) 

(DEFUN |ComparableRepresentation;| ()
  (SPROG ((#1=#:G0 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|SetCategory|)
                           (|mkCategory| '(((|smaller?| ((|Boolean|) % %)) T))
                                         NIL NIL NIL)))
           (SETELT #1# 0 '(|ComparableRepresentation|))))) 
