
(MAKEPROP '|ANY;obj;%N;1| '|SPADreplace| 'QCDR) 

(SDEFUN |ANY;obj;%N;1| ((|x| (%)) (% (|None|))) (QCDR |x|)) 

(MAKEPROP '|ANY;dom;%Se;2| '|SPADreplace| 'QCAR) 

(SDEFUN |ANY;dom;%Se;2| ((|x| (%)) (% (|SExpression|))) (QCAR |x|)) 

(SDEFUN |ANY;domainOf;%Of;3| ((|x| (%)) (% (|OutputForm|)))
        (|typeToOutputForm| (QCAR |x|))) 

(SDEFUN |ANY;=;2%B;4| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPROG ((|dx| #1=(|SExpression|)) (|dy| #1#) (|Dx| (|Type|)))
               (SEQ (LETT |dx| (SPADCALL |x| (QREFELT % 11)))
                    (LETT |dy| (SPADCALL |y| (QREFELT % 11)))
                    (EXIT
                     (COND ((SPADCALL |dx| |dy| (QREFELT % 15)) NIL)
                           ((SPADCALL |dx| (QREFELT % 16)) 'T)
                           (#2='T
                            (SEQ (LETT |Dx| (|evalType| |dx|))
                                 (EXIT
                                  (COND
                                   ((|HasCategory| |Dx| '(|BasicType|))
                                    (SPADCALL (SPADCALL |x| (QREFELT % 9))
                                              (SPADCALL |y| (QREFELT % 9))
                                              (|compiledLookupCheck| '=
                                                                     (LIST
                                                                      (LIST
                                                                       '|Boolean|)
                                                                      '% '%)
                                                                     |Dx|)))
                                   (#2#
                                    (EQ (SPADCALL |x| (QREFELT % 9))
                                        (SPADCALL |y| (QREFELT % 9))))))))))))) 

(SDEFUN |ANY;objectOf;%Of;5| ((|x| (%)) (% (|OutputForm|)))
        (|spad2BootCoerce| (QCDR |x|) (QCAR |x|)
                           (SPADCALL '|OutputForm| (QREFELT % 20)))) 

(SDEFUN |ANY;showTypeInOutput;BS;6| ((|b| (|Boolean|)) (% (|String|)))
        (SEQ (SETELT % 7 |b|)
             (EXIT
              (COND
               (|b|
                "Type of object will be displayed in output of a member of Any")
               ('T
                "Type of object will not be displayed in output of a member of Any"))))) 

(SDEFUN |ANY;coerce;%Of;7| ((|x| (%)) (% (|OutputForm|)))
        (SPROG
         ((|obj1| (|OutputForm|)) (|p| (|SExpression|))
          (|dom1| (|List| (|OutputForm|))))
         (SEQ (LETT |obj1| (SPADCALL |x| (QREFELT % 21)))
              (EXIT
               (COND
                ((QREFELT % 7)
                 (SEQ
                  (LETT |dom1|
                        (SEQ
                         (LETT |p| (|prefix2String| (|devaluate| (QCAR |x|))))
                         (EXIT
                          (COND
                           ((SPADCALL |p| (QREFELT % 24))
                            (SPADCALL |p| (QREFELT % 26)))
                           (#1='T |p|)))))
                  (EXIT
                   (SPADCALL
                    (CONS |obj1| (CONS (SPADCALL ":" (QREFELT % 27)) |dom1|))
                    (QREFELT % 29)))))
                (#1# |obj1|)))))) 

(SDEFUN |ANY;any;SeN%;8|
        ((|domain| (|SExpression|)) (|object| (|None|)) (% (%)))
        (SEQ
         (COND ((|isValidType| |domain|) (CONS |domain| |object|))
               (#1='T
                (SEQ (LETT |domain| (|devaluate| |domain|))
                     (EXIT
                      (COND ((|isValidType| |domain|) (CONS |domain| |object|))
                            (#1#
                             (|error|
                              "function any must have a domain as first argument"))))))))) 

(DECLAIM (NOTINLINE |Any;|)) 

(DEFUN |Any;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|Any|))
          (LETT % (GETREFV 32))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|Any| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 6
                    (|Record| (|:| |dm| (|SExpression|)) (|:| |ob| (|None|))))
          (QSETREFV % 7 NIL)
          %))) 

(DEFUN |Any| ()
  (SPROG NIL
         (PROG (#1=#:G26)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|Any|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|Any|
                             (LIST (CONS NIL (CONS 1 (|Any;|))))))
                    (LETT #1# T))
                (COND ((NOT #1#) (HREM |$ConstructorCache| '|Any|)))))))))) 

(MAKEPROP '|Any| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| '|printTypeInOutputP| (|None|)
              |ANY;obj;%N;1| (|SExpression|) |ANY;dom;%Se;2| (|OutputForm|)
              |ANY;domainOf;%Of;3| (|Boolean|) (0 . ~=) (6 . |string?|)
              |ANY;=;2%B;4| (|Symbol|) (|List| 18) (11 . |list|)
              |ANY;objectOf;%Of;5| (|String|) |ANY;showTypeInOutput;BS;6|
              (16 . |atom?|) (|List| 12) (21 . |list|) (26 . |message|)
              (|List| %) (31 . |hconcat|) |ANY;coerce;%Of;7| |ANY;any;SeN%;8|)
           '#(~= 36 |showTypeInOutput| 42 |objectOf| 47 |obj| 52 |latex| 57
              |domainOf| 62 |dom| 67 |coerce| 72 |any| 77 = 83)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| NIL |BasicType&|)
                       (CONS
                        '#((|SetCategory|) (|CoercibleTo| 12) (|BasicType|))
                        (|makeByteWordVec2| 31
                                            '(2 10 14 0 0 15 1 10 14 0 16 1 19
                                              0 18 20 1 10 14 0 24 1 25 0 12 26
                                              1 12 0 22 27 1 12 0 28 29 2 0 14
                                              0 0 1 1 0 22 14 23 1 0 12 0 21 1
                                              0 8 0 9 1 0 22 0 1 1 0 12 0 13 1
                                              0 10 0 11 1 0 12 0 30 2 0 0 10 8
                                              31 2 0 14 0 0 17)))))
           '|lookupComplete|)) 
