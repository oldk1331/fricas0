
(DECLAIM (NOTINLINE |RealConstant;|)) 

(DEFPARAMETER |RealConstant;AL| 'NIL) 

(DEFUN |RealConstant| ()
  (COND (|RealConstant;AL|) (T (SETQ |RealConstant;AL| (|RealConstant;|))))) 

(DEFUN |RealConstant;| ()
  (SPROG ((#1=#:G450 NIL))
         (PROG1
             (LETT #1#
                   (|subst_in_cat| '(#2=#:G448 #3=#:G449)
                                   (LIST '(|DoubleFloat|) '(|Float|))
                                   (|Join| (|ConvertibleTo| '#2#)
                                           (|ConvertibleTo| '#3#))))
           (SETELT #1# 0 '(|RealConstant|))))) 

(MAKEPROP '|RealConstant| 'NILADIC T) 
