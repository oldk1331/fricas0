
(PUT '|TEXTREE;group;L%;1| '|SPADreplace| '(XLAM (|l|) (CONS 0 |l|))) 

(SDEFUN |TEXTREE;group;L%;1| ((|l| (|List| %)) (% (%))) (CONS 0 |l|)) 

(PUT '|TEXTREE;group?;%B;2| '|SPADreplace| '(XLAM (|x|) (QEQCAR |x| 0))) 

(SDEFUN |TEXTREE;group?;%B;2| ((|x| (%)) (% (|Boolean|))) (QEQCAR |x| 0)) 

(SDEFUN |TEXTREE;ungroup;%L;3| ((|x| (%)) (% (|List| %)))
        (SPROG ((#1=#:G5 NIL))
               (PROG2 (LETT #1# |x|)
                   (QCDR #1#)
                 (|check_union2| (QEQCAR #1# 0) (|List| %)
                                 (|Union| (|:| |group| (|List| %))
                                          (|:| |m_rec|
                                               (|Record|
                                                (|:| |name| (|String|))
                                                (|:| |args| (|List| %))))
                                          (|:| |tmath| %) (|:| |dmath| %)
                                          (|:| |text| (|String|)))
                                 #1#)))) 

(SDEFUN |TEXTREE;m_call;SL%;4| ((|s| (|String|)) (|args| (|List| %)) (% (%)))
        (CONS 1 (CONS |s| |args|))) 

(PUT '|TEXTREE;m_call?;%B;5| '|SPADreplace| '(XLAM (|x|) (QEQCAR |x| 1))) 

(SDEFUN |TEXTREE;m_call?;%B;5| ((|x| (%)) (% (|Boolean|))) (QEQCAR |x| 1)) 

(SDEFUN |TEXTREE;get_call;%R;6|
        ((|x| (%))
         (% (|Record| (|:| |name| (|String|)) (|:| |args| (|List| %)))))
        (SPROG ((#1=#:G6 NIL))
               (PROG2 (LETT #1# |x|)
                   (QCDR #1#)
                 (|check_union2| (QEQCAR #1# 1)
                                 (|Record| (|:| |name| (|String|))
                                           (|:| |args| (|List| %)))
                                 (|Union| (|:| |group| (|List| %))
                                          (|:| |m_rec|
                                               (|Record|
                                                (|:| |name| (|String|))
                                                (|:| |args| (|List| %))))
                                          (|:| |tmath| %) (|:| |dmath| %)
                                          (|:| |text| (|String|)))
                                 #1#)))) 

(PUT '|TEXTREE;text_math;2%;7| '|SPADreplace| '(XLAM (|x|) (CONS 2 |x|))) 

(SDEFUN |TEXTREE;text_math;2%;7| ((|x| (%)) (% (%))) (CONS 2 |x|)) 

(PUT '|TEXTREE;text_math?;%B;8| '|SPADreplace| '(XLAM (|x|) (QEQCAR |x| 2))) 

(SDEFUN |TEXTREE;text_math?;%B;8| ((|x| (%)) (% (|Boolean|))) (QEQCAR |x| 2)) 

(PUT '|TEXTREE;display_math;2%;9| '|SPADreplace| '(XLAM (|x|) (CONS 3 |x|))) 

(SDEFUN |TEXTREE;display_math;2%;9| ((|x| (%)) (% (%))) (CONS 3 |x|)) 

(PUT '|TEXTREE;display_math?;%B;10| '|SPADreplace| '(XLAM (|x|) (QEQCAR |x| 3))) 

(SDEFUN |TEXTREE;display_math?;%B;10| ((|x| (%)) (% (|Boolean|)))
        (QEQCAR |x| 3)) 

(SDEFUN |TEXTREE;get_math;2%;11| ((|x| (%)) (% (%)))
        (SPROG ((#1=#:G7 NIL))
               (COND ((QEQCAR |x| 3) (CDR |x|))
                     ('T
                      (PROG2 (LETT #1# |x|)
                          (QCDR #1#)
                        (|check_union2| (QEQCAR #1# 2) %
                                        (|Union| (|:| |group| (|List| %))
                                                 (|:| |m_rec|
                                                      (|Record|
                                                       (|:| |name| (|String|))
                                                       (|:| |args|
                                                            (|List| %))))
                                                 (|:| |tmath| %)
                                                 (|:| |dmath| %)
                                                 (|:| |text| (|String|)))
                                        #1#)))))) 

(PUT '|TEXTREE;text;S%;12| '|SPADreplace| '(XLAM (|s|) (CONS 4 |s|))) 

(SDEFUN |TEXTREE;text;S%;12| ((|s| (|String|)) (% (%))) (CONS 4 |s|)) 

(PUT '|TEXTREE;text?;%B;13| '|SPADreplace| '(XLAM (|x|) (QEQCAR |x| 4))) 

(SDEFUN |TEXTREE;text?;%B;13| ((|x| (%)) (% (|Boolean|))) (QEQCAR |x| 4)) 

(SDEFUN |TEXTREE;get_text;%S;14| ((|x| (%)) (% (|String|)))
        (SPROG ((#1=#:G9 NIL))
               (PROG2 (LETT #1# |x|)
                   (QCDR #1#)
                 (|check_union2| (QEQCAR #1# 4) (|String|)
                                 (|Union| (|:| |group| (|List| %))
                                          (|:| |m_rec|
                                               (|Record|
                                                (|:| |name| (|String|))
                                                (|:| |args| (|List| %))))
                                          (|:| |tmath| %) (|:| |dmath| %)
                                          (|:| |text| (|String|)))
                                 #1#)))) 

(DECLAIM (NOTINLINE |TeXTree;|)) 

(DEFUN |TeXTree;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|TeXTree|))
          (LETT % (GETREFV 25))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|TeXTree| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 6
                    (|Union| (|:| |group| (|List| %))
                             (|:| |m_rec|
                                  (|Record| (|:| |name| (|String|))
                                            (|:| |args| (|List| %))))
                             (|:| |tmath| %) (|:| |dmath| %)
                             (|:| |text| (|String|))))
          %))) 

(DEFUN |TeXTree| ()
  (SPROG NIL
         (PROG (#1=#:G57)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|TeXTree|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|TeXTree|
                             (LIST (CONS NIL (CONS 1 (|TeXTree;|))))))
                    (LETT #1# T))
                (COND ((NOT #1#) (HREM |$ConstructorCache| '|TeXTree|)))))))))) 

(MAKEPROP '|TeXTree| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|List| %) |TEXTREE;group;L%;1|
              (|Boolean|) |TEXTREE;group?;%B;2| |TEXTREE;ungroup;%L;3|
              (|String|) |TEXTREE;m_call;SL%;4| |TEXTREE;m_call?;%B;5|
              (|Record| (|:| |name| 12) (|:| |args| 7)) |TEXTREE;get_call;%R;6|
              |TEXTREE;text_math;2%;7| |TEXTREE;text_math?;%B;8|
              |TEXTREE;display_math;2%;9| |TEXTREE;display_math?;%B;10|
              |TEXTREE;get_math;2%;11| |TEXTREE;text;S%;12|
              |TEXTREE;text?;%B;13| |TEXTREE;get_text;%S;14|)
           '#(|ungroup| 0 |text_math?| 5 |text_math| 10 |text?| 15 |text| 20
              |m_call?| 25 |m_call| 30 |group?| 36 |group| 41 |get_text| 46
              |get_math| 51 |get_call| 56 |display_math?| 61 |display_math| 66)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|group| ($$ (|List| $$))) T)
                                   '((|group?| ((|Boolean|) $$)) T)
                                   '((|ungroup| ((|List| $$) $$)) T)
                                   '((|m_call| ($$ (|String|) (|List| $$))) T)
                                   '((|m_call?| ((|Boolean|) $$)) T)
                                   '((|get_call|
                                      ((|Record| (|:| |name| (|String|))
                                                 (|:| |args| (|List| $$)))
                                       $$))
                                     T)
                                   '((|text_math| ($$ $$)) T)
                                   '((|text_math?| ((|Boolean|) $$)) T)
                                   '((|display_math| ($$ $$)) T)
                                   '((|display_math?| ((|Boolean|) $$)) T)
                                   '((|get_math| ($$ $$)) T)
                                   '((|text| ($$ (|String|))) T)
                                   '((|text?| ((|Boolean|) $$)) T)
                                   '((|get_text| ((|String|) $$)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 24
                                            '(1 0 7 0 11 1 0 9 0 18 1 0 0 0 17
                                              1 0 9 0 23 1 0 0 12 22 1 0 9 0 14
                                              2 0 0 12 7 13 1 0 9 0 10 1 0 0 7
                                              8 1 0 12 0 24 1 0 0 0 21 1 0 15 0
                                              16 1 0 9 0 20 1 0 0 0 19)))))
           '|lookupComplete|)) 
