
(DECLAIM (NOTINLINE |RealNumberSystem;|)) 

(DEFPARAMETER |RealNumberSystem;AL| 'NIL) 

(DEFUN |RealNumberSystem| ()
  (COND (|RealNumberSystem;AL|)
        (T (SETQ |RealNumberSystem;AL| (|RealNumberSystem;|))))) 

(DEFUN |RealNumberSystem;| ()
  (SPROG ((#1=#:G19 NIL))
         (PROG1
             (LETT #1#
                   (|subst_in_cat| '(#2=#:G15 #3=#:G16 #4=#:G17 #5=#:G18)
                                   (LIST '(|Integer|) '(|Fraction| (|Integer|))
                                         '(|Pattern| (|Float|)) '(|Float|))
                                   (|Join| (|Field|) (|OrderedRing|)
                                           (|RealConstant|)
                                           (|RetractableTo| '#2#)
                                           (|RetractableTo| '#3#)
                                           (|RadicalCategory|)
                                           (|ConvertibleTo| '#4#)
                                           (|PatternMatchable| '#5#)
                                           (|CharacteristicZero|)
                                           (|mkCategory|
                                            '(((|norm| (% %)) T)
                                              ((|ceiling| (% %)) T)
                                              ((|floor| (% %)) T)
                                              ((|wholePart| ((|Integer|) %)) T)
                                              ((|fractionPart| (% %)) T)
                                              ((|truncate| (% %)) T)
                                              ((|round| (% %)) T))
                                            NIL NIL NIL))))
           (SETELT #1# 0 '(|RealNumberSystem|))))) 

(MAKEPROP '|RealNumberSystem| 'NILADIC T) 
