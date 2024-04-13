
(DECLAIM (NOTINLINE |IntegerNumberSystem;|)) 

(DEFPARAMETER |IntegerNumberSystem;AL| 'NIL) 

(DEFUN |IntegerNumberSystem| ()
  (COND (|IntegerNumberSystem;AL|)
        (T (SETQ |IntegerNumberSystem;AL| (|IntegerNumberSystem;|))))) 

(DEFUN |IntegerNumberSystem;| ()
  (SPROG ((#1=#:G22 NIL))
         (PROG1
             (LETT #1#
                   (|subst_in_cat|
                    '(#2=#:G17 #3=#:G18 #4=#:G19 #5=#:G20 #6=#:G21)
                    (LIST '(|Integer|) '(|Integer|) '(|InputForm|)
                          '(|Pattern| (|Integer|)) '(|Integer|))
                    (|Join| (|UniqueFactorizationDomain|) (|EuclideanDomain|)
                            (|OrderedIntegralDomain|) (|DifferentialRing|)
                            (|ConvertibleTo| '#2#) (|RetractableTo| '#3#)
                            (|ConvertibleTo| '#4#) (|ConvertibleTo| '#5#)
                            (|PatternMatchable| '#6#)
                            (|CombinatorialFunctionCategory|) (|RealConstant|)
                            (|CharacteristicZero|) (|StepThrough|)
                            (|canonicalUnitNormal|) (|multiplicativeValuation|)
                            (|mkCategory|
                             '(((|odd?| ((|Boolean|) %)) T)
                               ((|even?| ((|Boolean|) %)) T) ((|base| (%)) T)
                               ((|length| (% %)) T) ((|shift| (% % %)) T)
                               ((|bit?| ((|Boolean|) % %)) T)
                               ((|positiveRemainder| (% % %)) T)
                               ((|symmetricRemainder| (% % %)) T)
                               ((|rational?| ((|Boolean|) %)) T)
                               ((|rational| ((|Fraction| (|Integer|)) %)) T)
                               ((|rationalIfCan|
                                 ((|Union| (|Fraction| (|Integer|)) "failed")
                                  %))
                                T)
                               ((|random| (% %)) T) ((|copy| (% %)) T)
                               ((|inc| (% %)) T) ((|dec| (% %)) T)
                               ((|mask| (% %)) T) ((|addmod| (% % % %)) T)
                               ((|submod| (% % % %)) T)
                               ((|mulmod| (% % % %)) T)
                               ((|powmod| (% % % %)) T) ((|invmod| (% % %)) T))
                             NIL NIL NIL))))
           (SETELT #1# 0 '(|IntegerNumberSystem|))))) 

(MAKEPROP '|IntegerNumberSystem| 'NILADIC T) 
