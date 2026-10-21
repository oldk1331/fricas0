
(DECLAIM (NOTINLINE |SetWithZero;|)) 

(DEFPARAMETER |SetWithZero;AL| 'NIL) 

(DEFUN |SetWithZero| ()
  (COND (|SetWithZero;AL|) (T (SETQ |SetWithZero;AL| (|SetWithZero;|))))) 

(DEFUN |SetWithZero;| ()
  (SPROG ((#1=#:G0 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|SetCategory|)
                           (|mkCategory|
                            '(((|0| (%) |constant|) T)
                              ((|sample| (%) |constant|) T)
                              ((|zero?| ((|Boolean|) %)) T))
                            NIL NIL NIL)))
           (SETELT #1# 0 '(|SetWithZero|))))) 
