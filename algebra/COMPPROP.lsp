
(SDEFUN |COMPPROP;=;2%B;1| ((|p1| (%)) (|p2| (%)) (% (|Boolean|)))
        (COND
         ((|BooleanEquality| (QCAR |p1|) (QCAR |p2|))
          (|BooleanEquality| (QCDR |p1|) (QCDR |p2|)))
         ('T NIL))) 

(MAKEPROP '|COMPPROP;closed?;%B;2| '|SPADreplace| 'QCAR) 

(SDEFUN |COMPPROP;closed?;%B;2| ((|p| (%)) (% (|Boolean|))) (QCAR |p|)) 

(MAKEPROP '|COMPPROP;solid?;%B;3| '|SPADreplace| 'QCDR) 

(SDEFUN |COMPPROP;solid?;%B;3| ((|p| (%)) (% (|Boolean|))) (QCDR |p|)) 

(MAKEPROP '|COMPPROP;new;2B%;4| '|SPADreplace| 'CONS) 

(SDEFUN |COMPPROP;new;2B%;4|
        ((|closed?| (|Boolean|)) (|solid?| (|Boolean|)) (% (%)))
        (CONS |closed?| |solid?|)) 

(SDEFUN |COMPPROP;copy;2%;5| ((|p| (%)) (% (%)))
        (SPADCALL (SPADCALL |p| (QREFELT % 9)) (SPADCALL |p| (QREFELT % 10))
                  (QREFELT % 11))) 

(SDEFUN |COMPPROP;coerce;%Of;6| ((|p| (%)) (% (|OutputForm|)))
        (SPADCALL
         (LIST (SPADCALL "Component is " (QREFELT % 15))
               (SPADCALL
                (COND ((SPADCALL |p| (QREFELT % 9)) "") (#1='T "not "))
                (QREFELT % 15))
               (SPADCALL "closed, " (QREFELT % 15))
               (SPADCALL (COND ((SPADCALL |p| (QREFELT % 10)) "") (#1# "not "))
                         (QREFELT % 15))
               (SPADCALL "solid" (QREFELT % 15)))
         (QREFELT % 17))) 

(DECLAIM (NOTINLINE |SubSpaceComponentProperty;|)) 

(DEFUN |SubSpaceComponentProperty;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|SubSpaceComponentProperty|))
          (LETT % (GETREFV 19))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|SubSpaceComponentProperty| NIL
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 6
                    (|Record| (|:| |closed| (|Boolean|))
                              (|:| |solid| (|Boolean|))))
          %))) 

(DEFUN |SubSpaceComponentProperty| ()
  (SPROG NIL
         (PROG (#1=#:G16)
           (RETURN
            (COND
             ((LETT #1#
                    (HGET |$ConstructorCache| '|SubSpaceComponentProperty|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|SubSpaceComponentProperty|
                             (LIST
                              (CONS NIL
                                    (CONS 1 (|SubSpaceComponentProperty;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|SubSpaceComponentProperty|)))))))))) 

(MAKEPROP '|SubSpaceComponentProperty| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|Boolean|) |COMPPROP;=;2%B;1|
              |COMPPROP;closed?;%B;2| |COMPPROP;solid?;%B;3|
              |COMPPROP;new;2B%;4| |COMPPROP;copy;2%;5| (|String|)
              (|OutputForm|) (0 . |message|) (|List| %) (5 . |hconcat|)
              |COMPPROP;coerce;%Of;6|)
           '#(~= 10 |solid?| 16 |new| 21 |latex| 27 |copy| 32 |coerce| 37
              |closed?| 42 = 47)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| NIL |BasicType&|)
                       (CONS
                        '#((|SetCategory|) (|CoercibleTo| 14) (|BasicType|))
                        (|makeByteWordVec2| 18
                                            '(1 14 0 13 15 1 14 0 16 17 2 0 7 0
                                              0 1 1 0 7 0 10 2 0 0 7 7 11 1 0
                                              13 0 1 1 0 0 0 12 1 0 14 0 18 1 0
                                              7 0 9 2 0 7 0 0 8)))))
           '|lookupComplete|)) 
